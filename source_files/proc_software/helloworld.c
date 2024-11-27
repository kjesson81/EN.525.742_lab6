
#include <stdio.h>
#include <math.h>
#include "platform.h"
#include "sleep.h"
#include "xparameters.h"
#include "xil_printf.h"
#include "xil_io.h"
#include "xiic.h"
#include "xuartps.h"

#define CODEC_IIC_ADDR 0x1A
#define GPIO_DAC_RST_ADDR 0x41200000
#define RADIO_PERIPH_ADDR 0x43C00000
#define ADC_OFFSET 0x0
#define TUNING_DDS_OFFSET 0x4
#define RADIO_RST_OFFSET 0x8
#define CLK_CNT_OFFSET 0xC

#define BUFFER_SIZE 512

void write_codec_register(u8 regnum, u16 regval);
void configure_codec_volume(int volume);
int  userMenu();
int  determinePhaseIncrement(int desiredFrequency);
int  intPower(int base, int exponent);
void BbScale();
void sendDDSconfig(int phase_inc);
void tune(int phase_inc_tune);
void resetRadio();
int readClockCount();


XIic iic;
XIic_Config *iicCfg;
XUartPs uartInstance;

int GlobalFrequency = 1000; // default
int GlobalTuneFrequency;
int TuningPhaseInc;
int GlobalPhaseInc;
int volumeLevel = 5;

int main()
{
    init_platform();

    iicCfg = XIic_LookupConfig(XPAR_IIC_0_DEVICE_ID);
    XIic_CfgInitialize(&iic, iicCfg, iicCfg->BaseAddress);
    XIic_Start(&iic);

    configure_codec_volume(volumeLevel);

    //

    xil_printf("\n\r\n\rWelcome to Kai's DDS Test System!\n\rImportant note: SW 3 is the MUTE switch: it must be in the ON position to hear/see waveforms. SW0 is the bypass switch, where when ON, the FIR Filters AND tuner are bypassed.\n\rButton 0 will reset the system.\n\r\n\r");
    userMenu();

    cleanup_platform();
    return 0;
}

///////////////////////////////////////////////////////////////////////////////////////////////////

void write_codec_register(u8 regnum, u16 regval)
{
    // Combine the bottom 7 bits of regnum with the bottom 9 bits of regval into a 16-bit word
    u16 dataWord = ((regnum & 0x7F) << 9) | (regval & 0x01FF);
    u8 writeBuffer[2] = {(dataWord >> 8) & 0xFF, dataWord & 0xFF};

    int SentBytes = XIic_Send(iic.BaseAddress, CODEC_IIC_ADDR, writeBuffer, 2, XIIC_STOP);

    if (SentBytes != 2)
    {
        xil_printf("I2C write failed for register 0x%02X\n\r", regnum);
    }
}

void configure_codec_volume(int volume)
{
	u8 codecVolume;

    switch (volume) {
        case 0:
            codecVolume = 0x43;
            volumeLevel = 0;
            break;
        case 1:
            codecVolume = 0x49;
            volumeLevel = 1;
            break;
        case 2:
            codecVolume = 0x4F;
            volumeLevel = 2;
            break;
        case 3:
            codecVolume = 0x5B;
            volumeLevel = 3;
            break;
        case 4:
            codecVolume = 0x61;
            volumeLevel = 4;
            break;
        case 5:
            codecVolume = 0x67;
            volumeLevel = 5;
            break;
        case 6:
            codecVolume = 0x6D;
            volumeLevel = 6;
            break;
        case 7:
            codecVolume = 0x73;
            volumeLevel = 7;
            break;
        case 8:
            codecVolume = 0x79;
            volumeLevel = 8;
            break;
        case 9:
            codecVolume = 0x7F;
            volumeLevel = 9;
            break;
        default:
            printf("Invalid option selected.\n\r");
            break;
    }

	Xil_Out32(GPIO_DAC_RST_ADDR, 0);
    write_codec_register(15, 0x00);
    usleep(1000);
    write_codec_register(6, 0x30);
    write_codec_register(0, 0x17);
    write_codec_register(1, 0x17);
    write_codec_register(2, codecVolume);
    write_codec_register(3, codecVolume);
    write_codec_register(4, 0x10);
    write_codec_register(5, 0x00);
    write_codec_register(7, 0x02);
    write_codec_register(8, 0x00);
    usleep(75000);
    write_codec_register(9, 0x01);
    write_codec_register(6, 0x00);
    Xil_Out32(GPIO_DAC_RST_ADDR, 1);

    xil_printf("\n\rVolume set to level %d\n\r", volumeLevel);
}

int userMenu()
{
    char option;

    while (1)
    {
        xil_printf("\n\r    - Press B/b to test the DDS System with a Bb scale - NOTE: centered at 0 Hz\n\r    - Press T/t to tune the system\n\r    - Press E/e to enter a frequency\n\r    - Press U/u to increase frequency by 1000Hz / 100Hz\n\r    - Press D/d to decrease frequency by 1000Hz / 100Hz\n\r    - Press R to reset phase\n\r    - Press +/- to increase/decrease volume\n\r    - Press C/c to read the clock counts\n\r\n\r");

        // Wait for a valid character input from the UART
        while (!XUartPs_IsReceiveData(XPAR_XUARTPS_0_BASEADDR)){}

        option = XUartPs_RecvByte(XPAR_XUARTPS_0_BASEADDR);

        // check for valid input
        if ((option != 'T') && (option != 't') && (option != 'F') && (option != 'f') && (option != 'E') && (option != 'e') && (option != 'C') && (option != 'c') && (option != 'U') && (option != 'u') &&  (option != 'D') && (option != 'd') && (option != 'R') && (option != 'r')&& (option != '+') && (option != '-'))
        {
            xil_printf("ERROR: Invalid selection! You entered: %c. Please try again.\n\r", option);
        }
        else
        {
            if ((option == 'B') || (option == 'b'))
            {
            	BbScale();
            }
            else if ((option == 'E') || (option == 'e'))
            {
            	xil_printf("Please enter your desired frequency: ");;
            	char userInput[BUFFER_SIZE];
            	scanf("%s", userInput);
                GlobalFrequency = atoi(userInput);
            	xil_printf("\n\r");
            	GlobalPhaseInc = determinePhaseIncrement(GlobalFrequency);
            	sendDDSconfig(GlobalPhaseInc);

            }
            else if (option == 'U')
            {
                GlobalFrequency += 1000;
                GlobalPhaseInc = determinePhaseIncrement(GlobalFrequency);
            	xil_printf("Increased by 1000 Hz\n\r");
            	sendDDSconfig(GlobalPhaseInc);
            }
            else if (option == 'u')
            {
                GlobalFrequency += 100;
                GlobalPhaseInc = determinePhaseIncrement(GlobalFrequency);
            	xil_printf("Increased by 100 Hz\n\r");
            	sendDDSconfig(GlobalPhaseInc);
            }
            else if (option == 'D')
            {
				GlobalFrequency -= 1000;
				GlobalPhaseInc = determinePhaseIncrement(GlobalFrequency);
				xil_printf("Decreased by 1000 Hz\n\r");
				sendDDSconfig(GlobalPhaseInc);
            }
            else if (option == 'd')
            {
				GlobalFrequency -= 100;
				GlobalPhaseInc = determinePhaseIncrement(GlobalFrequency);
				xil_printf("Decreased by 100 Hz\n\r");
				sendDDSconfig(GlobalPhaseInc);
            }
            else if ((option == 'R') || (option == 'r'))
            {
                resetRadio();
            }
            else if ((option == 'C') || (option == 'c'))
            {
                xil_printf("Current Clock Count : %d\n\r", readClockCount());
            }
            else if ((option == 'T') || (option == 't'))
            {
            	xil_printf("Please enter your tuning frequency: ");;
            	char userInput[BUFFER_SIZE];
            	scanf("%s", userInput);
                GlobalTuneFrequency = atoi(userInput);
            	xil_printf("\n\r");
            	TuningPhaseInc = determinePhaseIncrement(-GlobalTuneFrequency);
            	tune(TuningPhaseInc);
            }
            else if (option == '+')
            {
            	if (volumeLevel < 9)
            	{
            		volumeLevel ++;
            		configure_codec_volume(volumeLevel);
            	}
            	else {
            		xil_printf("Volume can not go any higher!\n\r");
            	}
            }
            else if (option == '-')
			{
            	if (volumeLevel > 0)
            	{
            		volumeLevel --;
            		configure_codec_volume(volumeLevel);
            	}
            	else {
            		xil_printf("Volume can not go any lower!\n\r");
            	}
			}
            xil_printf("Current Frequency : %d Hz\n\rCurrent Tuning Frequency %d\n\r",GlobalFrequency, GlobalTuneFrequency);
        }

    }

    return 0;
}

int determinePhaseIncrement(int desiredFrequency) {
    // phaseInc = f_out * (2^N/fs)
    int phaseInc;
    int fs = 125000000; // 125 MHz sysclk
    int N = 27;

    phaseInc = (int)((desiredFrequency * (double)intPower(2, N)) / fs);

    return phaseInc;
}

void sendDDSconfig(int phase_inc)
{
    Xil_Out32(RADIO_PERIPH_ADDR + ADC_OFFSET, phase_inc);
}

void tune(int phase_inc_tune)
{
    Xil_Out32(RADIO_PERIPH_ADDR + TUNING_DDS_OFFSET, phase_inc_tune);
}

int intPower (int base, int exponent){
	int value = 1;
	for (int i = 0; i < exponent; i++){
		 value = value * base;
	}
	return value;
}

void BbScale () {
    int delayCnt = 50000000;
    int delay = 0;
    int BbScale[21] = {233, 262, 294, 311, 349, 392, 440, 466, 440, 392, 349, 311, 294, 262, 233, 294, 349, 466, 349, 294, 233};

    xil_printf("Playing Bb scale tuned at 0 Hz...\n\r");
    for (int i = 0; i < sizeof(BbScale) / sizeof(BbScale[0]); i++) {
        GlobalFrequency = BbScale[i];
        GlobalPhaseInc = determinePhaseIncrement(GlobalFrequency);
        sendDDSconfig(GlobalPhaseInc);

        while (delay != delayCnt) {
            delay++;
        }
        delay = 0;
    }

    xil_printf("Done!\n\r");
}

void resetRadio()
{
    Xil_Out32(RADIO_PERIPH_ADDR + RADIO_RST_OFFSET, 1);
    usleep(5000);
    Xil_Out32(RADIO_PERIPH_ADDR + RADIO_RST_OFFSET, 0);
}

int readClockCount () {
    return (int)Xil_In32(RADIO_PERIPH_ADDR + CLK_CNT_OFFSET);
}

