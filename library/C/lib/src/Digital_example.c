#include "Def.h"
#include "niusb3_core.h"
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <stdint.h>

#include  "Digital_lib.h"

#define BOARD_SERIAL_NUMBER "NI120012"




int main(int argc, char* argv[])
{
	NI_HANDLE handle;
	int ret;
	uint32_t    val;


	USB3_Init();


	if(USB3_ConnectDevice(BOARD_SERIAL_NUMBER, &handle) != 0) { printf("Unable to connect to the board!\n"); return (-1); };
#ifndef CUSTOM_EXAMPLE		
	
	/* //REMOVE THIS COMMENT TO ENABLE THE EXAMPLE CODE

char ASIC_CONFIG[] = "0000000000000000000000000000000000000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100010000000000000000000000000000000000000000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000011100011001000001100100110011110100000111111111101111111010011111111001111111111011001011";
PETIROC_PetirocCfg0_CONFIG(ASIC_CONFIG, &handle);
*/
/* //REMOVE THIS COMMENT TO ENABLE THE EXAMPLE CODE

	float voltage;
	float current;
	bool enable;
	AFE_USB3_SetIICControllerBaseAddress(SCI_REG_i2chv_CTRL, SCI_REG_i2chv_MON, &handle);
	GetHV_A7585D(&enable, &voltage, &current, &handle);
	SetHV_A7585D(true, 35.0, &handle);
	for (int cy = 0; cy < 5; cy++)
	{
		GetHV_A7585D(&enable, &voltage, &current, &handle);
		printf("%d v:%f i:%f\n", enable, voltage, current);
		Sleep(500);
	}
*/
/* //REMOVE THIS COMMENT TO ENABLE THE EXAMPLE CODE

	uint32_t status_frame = 0;
	uint32_t N_Packet = 100;
	uint32_t data_frame[100000];
	uint32_t read_data_frame;
	uint32_t valid_data_frame;
	uint32_t valid_data_enqueued;

	uint32_t N_Total_Events = 10000;
	uint32_t ReadDataNumber = 0;
	int32_t timeout_frame = 1000;
	t_generic_event_collection decoded_packets;

	//Configuration flag
	int32_t FrameSync = 0;
	int32_t	FrameWait = 0;
	int32_t	FrameMask = 3;
	int32_t	FrameExternalTrigger = 0;
	int32_t	FrameOrTrigger = 1;

	void *BufferDownloadHandler = NULL;
	Utility_ALLOCATE_DOWNLOAD_BUFFER(&BufferDownloadHandler, 1024*1024);
	printf("%x\n", BufferDownloadHandler);

	if (CPACK_CP_0_RESET(&handle) != 0) printf("Reset Error");
	if (CPACK_CP_0_START(&handle) != 0) printf("Start Error");
	if (CPACK_CP_0_STATUS(&status_frame, &handle) != 0) printf("Status Error");
	if (status_frame >0)
	{
		while (1)
		{
			valid_data_frame = 0;
			if (CPACK_CP_0_DOWNLOAD(&data_frame, N_Packet * (<<<PACKET_SIZE_HERE_IN_WORK>>>), timeout_frame, &handle, &read_data_frame, &valid_data_frame) != 0) printf("Data Download Error");
			
			valid_data_enqueued = 0;
			Utility_ENQUEUE_DATA_IN_DOWNLOAD_BUFFER(BufferDownloadHandler, data_frame, valid_data_frame, &valid_data_enqueued);

			if (CPACK_CP_0_RECONSTRUCT_DATA(BufferDownloadHandler, &decoded_packets) == 0)
			{
				printf(".");
				for (int i =0;i<decoded_packets.valid_packets;i++){
				    t_CP_0_struct *data = decoded_packets.packets[i].payload;
				    printf("%d\n", data->row[0]);
				}
				free_packet_collection(&decoded_packets);
			}
			ReadDataNumber = ReadDataNumber+ N_Packet;
	}
		printf("Download completed");
	}
	else printf("Status Error");

*/


	
#else

#endif

	return 0;
}

 