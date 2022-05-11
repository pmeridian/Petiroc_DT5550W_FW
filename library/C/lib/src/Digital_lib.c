#include "niusb3_core.h"
#include  <stdlib.h>
#include <stdint.h>
#include  <stdbool.h>

#include "RegisterFile.h"

#include  "circular_buffer.h"



#include  "Digital_lib.h"

SCILIB int USB3_Init()
{
	return NI_USB3_Init();
}

SCILIB int USB3_ConnectDevice( char *IPAddress_or_SN, NI_HANDLE *handle)
{
	return NI_USB3_ConnectDevice( IPAddress_or_SN, handle);
}

SCILIB int USB3_CloseConnection(NI_HANDLE *handle)
{
	return NI_USB3_CloseConnection(handle);
}

SCILIB int USB3_ListDevices(char *ListOfDevice, char *model,  int *Count)
{
	return NI_USB3_ListDevices(ListOfDevice, model, Count);
}

SCILIB int __abstracted_mem_write(uint32_t *data, uint32_t count, 
										uint32_t address, 
										uint32_t timeout_ms, NI_HANDLE *handle, 
										uint32_t *written_data)
{
	return NI_USB3_WriteData(data,  count,  address, REG_ACCESS, timeout_ms, handle, written_data);
}


SCILIB int __abstracted_mem_read(uint32_t *data, uint32_t count, 
										uint32_t address, 
										uint32_t timeout_ms, NI_HANDLE *handle, 
										uint32_t *read_data, uint32_t *valid_data)
{
	return NI_USB3_ReadData(data,  count, address,  REG_ACCESS, timeout_ms, handle, read_data, valid_data);
}

SCILIB int __abstracted_fifo_write(uint32_t *data, uint32_t count, 
										uint32_t address, 
										uint32_t timeout_ms, NI_HANDLE *handle, 
										uint32_t *written_data)
{
	return NI_USB3_WriteData(data,  count,  address, STREAMING, timeout_ms, handle, written_data);
}
	
SCILIB int __abstracted_fifo_read(uint32_t *data, uint32_t count, 
										uint32_t address, 
										uint32_t address_status, 
										bool blocking,
										uint32_t timeout_ms, NI_HANDLE *handle, 
										uint32_t *read_data, uint32_t *valid_data)
{
	return NI_USB3_ReadData(data,  count, address,  STREAMING, timeout_ms, handle, read_data, valid_data);
}
	
SCILIB int __abstracted_reg_write(uint32_t data, uint32_t address, NI_HANDLE *handle)
{
	return NI_USB3_WriteReg(data, address, handle);
}

SCILIB int __abstracted_reg_read(uint32_t *data, uint32_t address, NI_HANDLE *handle)
{
	return NI_USB3_ReadReg(data,  address,  handle);
}

SCILIB int AFE_USB3_SetOffset(boolean top, uint32_t DACCODE, NI_HANDLE *handle)
{
	return NI_USB3_SetOffset( top,  DACCODE, handle);
}

SCILIB int AFE_USB3_SetImpedance(boolean R50, NI_HANDLE *handle)
{
	return NI_USB3_SetImpedance( R50, handle);
}

SCILIB int AFE_USB3_SetIICControllerBaseAddress(uint32_t ControlAddress, uint32_t StatusAddress, NI_HANDLE *handle)
{
	return NI_USB3_SetIICControllerBaseAddress( ControlAddress,  StatusAddress, handle);
}	


SCILIB int SetHV_A7585D(bool Enable, float voltage, NI_HANDLE *handle)
{
	return NI_USB3_SetHV(Enable, voltage, handle);
}

SCILIB int GetHV_A7585D(bool *Enable, float *voltage, float *current, NI_HANDLE *handle)
{
	return NI_USB3_GetHV(Enable, voltage, current, handle);
}

SCILIB int IICUser_OpenControllerInit(uint32_t ControlAddress, uint32_t StatusAddress, NI_HANDLE *handle, NI_IIC_HANDLE *IIC_Handle)
{
	return NI_USB3_IICUser_OpenController(ControlAddress, StatusAddress, handle, IIC_Handle);
}

SCILIB int IICUser_ReadData(uint8_t address, uint8_t *value, int len, uint8_t *value_read, int len_read, NI_IIC_HANDLE *IIC_Handle)
{
	return NI_USB3_IICUser_ReadData(address, value, len, value_read, len_read, IIC_Handle);
}

SCILIB int IICUser_WriteData(uint8_t address, uint8_t *value, int len, NI_IIC_HANDLE *IIC_Handle)
{
	return NI_USB3_IICUser_WriteData(address, value, len, IIC_Handle);
}
 
SCILIB int GetDT5550WTempSens(int address, float *temp, NI_HANDLE *handle)
{
	return NI_USB3_GetDT5550WTempSens(address, temp, handle);
}

SCILIB char *ReadFirmwareInformation(NI_HANDLE *handle)
{
	return ReadFirmwareInformationApp(handle);
}

SCILIB int ReadSN(uint32_t *SN, NI_HANDLE *handle)
{
	uint64_t UID;
	return SECReadUIDSN(&UID, SN, handle);
}

SCILIB int GetDT5550_DGBoardInfo(char *model, int *asic_count, int *SN, NI_HANDLE *handle)
{
	return NI_USB3_GetDT5550_DGBoardInfo(model, asic_count, SN, handle);
}


uint32_t gray_to_bin(uint32_t num, int nbit)
{
	uint32_t temp = num ^ (num >> 8);
	temp ^= (temp >> 4);
	temp ^= (temp >> 2);
	temp ^= (temp >> 1);
	return temp;
}



//-----------------------------------------------------------------
//-
//-  PETIROC_ALLFIFO_FLUSH
//-
//-	 Clear all FIFOs of the PETIROCFRAME syncronous
//-  ARGUMENTS:
//- 	            buffer_handle   PARAM_OUT   void ** 
//-			Handle to the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-  
//- 	   
//-  
//-  RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-----------------------------------------------------------------

SCILIB int PETIROC_ALLFIFO_FLUSH(NI_HANDLE *handle)
{
	__abstracted_reg_write(1, SCI_REG_ALL_FIFO_RESET, handle);
	return __abstracted_reg_write(0, SCI_REG_ALL_FIFO_RESET, handle);

}




//-----------------------------------------------------------------
//-
//-  Utility_ALLOCATE_DOWNLOAD_BUFFER
//-
//-	 This function take as input a pointer to a buffer handle (not pre-allocated void*) and fill it
//-  with the pointer to the circular buffer to store data acquired from a board FIFO that is waiting
//-  to be processed.
//-  The buffer_size specify the size of the buffer to be allocated
//-  ARGUMENTS:
//- 	            buffer_handle   PARAM_OUT   void ** 
//-			Handle to the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-  
//- 	            buffer_size   PARAM_IN   uint32_t
//- 		size in word (32 bit) of the buffer to be allocated
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-  
//-  RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-  EXAMPLE:
//-
//-		void *BufferDownloadHandler = NULL;
//-		Utility_ALLOCATE_DOWNLOAD_BUFFER(&BufferDownloadHandler, 1024*1024);
//-----------------------------------------------------------------

SCILIB int Utility_ALLOCATE_DOWNLOAD_BUFFER(void **buffer_handle, uint32_t buffer_size)
{
	uint32_t * buffer = malloc(buffer_size * sizeof(uint32_t));
	if (buffer == NULL) return -1;
	cbuf_handle_t cbuf = circular_buf_init(buffer, buffer_size);
	*buffer_handle = cbuf;
	return 0;
}




//-----------------------------------------------------------------
//-
//-  Utility_ENQUEUE_DATA_IN_DOWNLOAD_BUFFER
//-
//-	 This function take as input a pointer to a buffer handle allocated with the function 
//-  Utility_ALLOCATE_DOWNLOAD_BUFFER and fill it with the content of the array val
//-  If the buffer is full the function fails and the output parameter 
//-  The buffer_size specify the size of the buffer to be allocated enqueued_data willl
//-	 contain the number of word that has been enqueued in the buffer
//-
//-  ARGUMENTS:
//- 	            buffer_handle   PARAM_IN   void *
//-			Handle to the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-  
//- 	            val			   PARAM_IN   uint32_t *
//-			input data vector downloaded from a FIFO from the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 
//- 	            size   			PARAM_IN   uint32_t 
//- 		number of valid word in the val vector
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-  
//- 	            enqueued_data   PARAM_OUT   uint32_t *
//-			number of word of the val vector really enqueued in the circular buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-  RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Not all word enqueued in the buffer
//-
//-  EXAMPLE:
//-
//-		FRAME_ImageReadout_0_DOWNLOAD(&data_frame, N_Packet * (9+4), timeout_frame, &handle, &read_data_frame, &valid_data_frame);
//-		Utility_ENQUEUE_DATA_IN_DOWNLOAD_BUFFER(BufferDownloadHandler, data_frame, valid_data_frame, &valid_data_enqueued);
//-----------------------------------------------------------------

SCILIB int Utility_ENQUEUE_DATA_IN_DOWNLOAD_BUFFER(void *buffer_handle, int32_t *val, uint32_t size, uint32_t *enqueued_data)
{
	cbuf_handle_t cbuf;
	uint32_t i;
	uint32_t data_counter=0;
	cbuf = ((cbuf_handle_t)buffer_handle);
	for (i = 0; i < size; i++)
	{
		if (circular_buf_full(cbuf))
		{
			*enqueued_data = data_counter;
			return -1;
		}
		data_counter++;
		circular_buf_put(cbuf, val[i]);
	}
	*enqueued_data = data_counter;
	return 0;
}


//-----------------------------------------------------------------
//-
//-  Utility_PEAK_DATA_FORM_DOWNLOAD_BUFFER
//-
//-	 This function take as input a pointer to a buffer handle allocated with the function 
//-  Utility_ALLOCATE_DOWNLOAD_BUFFER and retrive one data from the buffer (head of the FIFO)
//-  If the buffer is rmpty function fails with -1 error
//-  The buffer_size specify the size of the buffer to be allocated enqueued_data willl
//-	 contain the number of word that has been enqueued in the buffer
//-
//-  ARGUMENTS:
//- 	            buffer_handle   PARAM_IN   void *
//-			Handle to the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-  
//- 	            val			   PARAM_OUT   uint32_t *
//-			head of the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-  RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Empty
//-
//-  EXAMPLE:
//-----------------------------------------------------------------


SCILIB int Utility_PEAK_DATA_FORM_DOWNLOAD_BUFFER(void *buffer_handle, int32_t *val)
{
	cbuf_handle_t cbuf;
	cbuf = (cbuf_handle_t)buffer_handle;
	if (circular_buf_empty(cbuf))
		return -1;
	circular_buf_get(cbuf, val);
	return 0;
}

//-----------------------------------------------------------------
//-
//-  free_PETIROCFRAME_packet_collection
//-
//-	 This function take as input a pointer to a decoded packets and release the memory
//-
//-  ARGUMENTS:
//- 	    buffer_handle   PARAM_IN   t_ASIC_packet_collection *
//-			Packet to be released
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-  RETURN [void]
//-
//-  EXAMPLE:
//-		PETIROCFRAME_PetirocFrame0_RECONSTRUCT_DATA(BufferDownloadHandler, &decoded_packets);
//-		... processing code ...
//-		free_PETIROCFRAME_packet_collection(&decoded_packets);
//-----------------------------------------------------------------


SCILIB void free_PETIROCFRAME_packet_collection(t_ASIC_packet_collection *decoded_packets)
{
	int i;
	for (i = 0; i < decoded_packets->allocated_packets; i++)
	{
		free(decoded_packets->packets[i].Charge);
		free(decoded_packets->packets[i].FineTime);
		free(decoded_packets->packets[i].CoarseTime);
		free(decoded_packets->packets[i].Hit);
	}
	free(decoded_packets->packets);
}


//-----------------------------------------------------------------
//-
//-  free_FRAME_packet_collection
//-
//-	 This function take as input a pointer to a decoded packets and release the memory
//-
//-  ARGUMENTS:
//- 	            buffer_handle   PARAM_IN   t_FRAME_packet_collection *
//-			Packet to be released
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-  RETURN [void]
//-
//-  EXAMPLE:
//-		FRAME_ImageReadout_0_RECONSTRUCT_DATA(BufferDownloadHandler, &decoded_packets);
//-		... processing code ...
//-		free_FRAME_packet_collectionvoid(&decoded_packets);
//-----------------------------------------------------------------


SCILIB void free_FRAME_packet_collection (t_FRAME_packet_collection *decoded_packets)
{
	int i;
	for (i = 0; i < decoded_packets->allocated_packets; i++)
	{
		free(decoded_packets->packets[i].Energy);
	}
	free(decoded_packets->packets);
}SCILIB int REG_c_tot_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_c_tot, handle);
}
SCILIB int REG_c_tot_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_c_tot, handle);
}
SCILIB int REG_run_time_lsb_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_run_time_lsb, handle);
}
SCILIB int REG_run_time_lsb_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_run_time_lsb, handle);
}
SCILIB int REG_run_time_msb_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_run_time_msb, handle);
}
SCILIB int REG_run_time_msb_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_run_time_msb, handle);
}
SCILIB int REG_run_start_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_run_start, handle);
}
SCILIB int REG_run_start_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_run_start, handle);
}
SCILIB int REG_sw_trig_freq_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_sw_trig_freq, handle);
}
SCILIB int REG_sw_trig_freq_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_sw_trig_freq, handle);
}
SCILIB int REG_tr_sel_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_tr_sel, handle);
}
SCILIB int REG_tr_sel_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_tr_sel, handle);
}
SCILIB int REG_e16_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_e16, handle);
}
SCILIB int REG_e16_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_e16, handle);
}
SCILIB int REG_evt_ts_msb_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_evt_ts_msb, handle);
}
SCILIB int REG_evt_ts_msb_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_evt_ts_msb, handle);
}
SCILIB int REG_evt_ts_lsb_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_evt_ts_lsb, handle);
}
SCILIB int REG_evt_ts_lsb_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_evt_ts_lsb, handle);
}
SCILIB int REG_e15_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_e15, handle);
}
SCILIB int REG_e15_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_e15, handle);
}
SCILIB int REG_tr_en_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_tr_en, handle);
}
SCILIB int REG_tr_en_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_tr_en, handle);
}
SCILIB int REG_fw_ver_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_fw_ver, handle);
}
SCILIB int REG_fw_ver_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_fw_ver, handle);
}
SCILIB int REG_dv_tot_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_dv_tot, handle);
}
SCILIB int REG_dv_tot_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_dv_tot, handle);
}
SCILIB int REG_rej_delay_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_rej_delay, handle);
}
SCILIB int REG_rej_delay_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_rej_delay, handle);
}
SCILIB int REG_rej_en_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_rej_en, handle);
}
SCILIB int REG_rej_en_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_rej_en, handle);
}
SCILIB int REG_tot16_GET(uint32_t *val, NI_HANDLE *handle)
{
     return __abstracted_reg_read(val, SCI_REG_tot16, handle);
}
SCILIB int REG_tot16_SET(uint32_t val, NI_HANDLE *handle)
{
     return __abstracted_reg_write(val, SCI_REG_tot16, handle);
}
//-----------------------------------------------------------------
//-
//- PETIROC_PetirocCfg0_CONFIG
//-
//- Configure ASIC.
//-
//- ARGUMENTS:
//- 	           incfg   PARAM_IN    int32_t
//- 		Bitstream to be downloaded to the ASIC. Use integrated SciCompiler Tool to generate the bitstream or read petiroc documentation
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int PETIROC_PetirocCfg0_CONFIG(char *incfg, NI_HANDLE *handle)
{
int i,j;
uint32_t bitstream[1024];
uint32_t cfg[32];
int result;
if (strlen(incfg) != 640) return -1;
for (i=0;i<1024;i++) bitstream[i] = 0;
for (i=0;i<640;i++)
{
	bitstream[i] = (incfg[i] == '0' ? 0:1);
}
for (i=0;i<20;i++)
{
	cfg[i]=0;
	for (j=0;j<32;j++)
		cfg[i] += (bitstream[i*32+j] << j);
}
result=0;
	result+=__abstracted_reg_write(cfg[0],SCI_REG_PetirocCfg0_REG_CFG0, handle);
	result+=__abstracted_reg_write(cfg[1],SCI_REG_PetirocCfg0_REG_CFG1, handle);
	result+=__abstracted_reg_write(cfg[2],SCI_REG_PetirocCfg0_REG_CFG2, handle);
	result+=__abstracted_reg_write(cfg[3],SCI_REG_PetirocCfg0_REG_CFG3, handle);
	result+=__abstracted_reg_write(cfg[4],SCI_REG_PetirocCfg0_REG_CFG4, handle);
	result+=__abstracted_reg_write(cfg[5],SCI_REG_PetirocCfg0_REG_CFG5, handle);
	result+=__abstracted_reg_write(cfg[6],SCI_REG_PetirocCfg0_REG_CFG6, handle);
	result+=__abstracted_reg_write(cfg[7],SCI_REG_PetirocCfg0_REG_CFG7, handle);
	result+=__abstracted_reg_write(cfg[8],SCI_REG_PetirocCfg0_REG_CFG8, handle);
	result+=__abstracted_reg_write(cfg[9],SCI_REG_PetirocCfg0_REG_CFG9, handle);
	result+=__abstracted_reg_write(cfg[10],SCI_REG_PetirocCfg0_REG_CFG10, handle);
	result+=__abstracted_reg_write(cfg[11],SCI_REG_PetirocCfg0_REG_CFG11, handle);
	result+=__abstracted_reg_write(cfg[12],SCI_REG_PetirocCfg0_REG_CFG12, handle);
	result+=__abstracted_reg_write(cfg[13],SCI_REG_PetirocCfg0_REG_CFG13, handle);
	result+=__abstracted_reg_write(cfg[14],SCI_REG_PetirocCfg0_REG_CFG14, handle);
	result+=__abstracted_reg_write(cfg[15],SCI_REG_PetirocCfg0_REG_CFG15, handle);
	result+=__abstracted_reg_write(cfg[16],SCI_REG_PetirocCfg0_REG_CFG16, handle);
	result+=__abstracted_reg_write(cfg[17],SCI_REG_PetirocCfg0_REG_CFG17, handle);
	result+=__abstracted_reg_write(cfg[18],SCI_REG_PetirocCfg0_REG_CFG18, handle);
	result+=__abstracted_reg_write(cfg[19],SCI_REG_PetirocCfg0_REG_CFG19, handle);
	result+=__abstracted_reg_write(0,SCI_REG_PetirocCfg0_START_REG_CFG, handle);
	result+=__abstracted_reg_write(1,SCI_REG_PetirocCfg0_START_REG_CFG, handle);
	result+=__abstracted_reg_write(0,SCI_REG_PetirocCfg0_START_REG_CFG, handle);
if (result!=0) return -1; else return 0;

}
//-----------------------------------------------------------------
//-
//- PETIROC_PetirocCfg0_CONFIG_MON
//-
//- Configure ASIC Monitor probe.
//-
//- ARGUMENTS:
//- 	           incfg   PARAM_IN    int32_t
//- 		Bitstream to be downloaded to the ASIC. Use integrated SciCompiler Tool to generate the bitstream or read petiroc documentation
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int PETIROC_PetirocCfg0_CONFIG_MON(char *incfg, NI_HANDLE *handle)
{
int i,j;
uint32_t bitstream[1024];
uint32_t cfg[32];
int result;
if (strlen(incfg) != 200) return -1;
for (i=0;i<1024;i++) bitstream[i] = 0;
for (i=0;i<200;i++)
{
	bitstream[i] = (incfg[i] == '0' ? 0:1);
}
for (i=0;i<20;i++)
{
	cfg[i]=0;
	for (j=0;j<32;j++)
		cfg[i] += (bitstream[i*32+j] << j);
}
result=0;
	result+=__abstracted_reg_write(cfg[0],SCI_REG_PetirocCfg0_REG_CFG0, handle);
	result+=__abstracted_reg_write(cfg[1],SCI_REG_PetirocCfg0_REG_CFG1, handle);
	result+=__abstracted_reg_write(cfg[2],SCI_REG_PetirocCfg0_REG_CFG2, handle);
	result+=__abstracted_reg_write(cfg[3],SCI_REG_PetirocCfg0_REG_CFG3, handle);
	result+=__abstracted_reg_write(cfg[4],SCI_REG_PetirocCfg0_REG_CFG4, handle);
	result+=__abstracted_reg_write(cfg[5],SCI_REG_PetirocCfg0_REG_CFG5, handle);
	result+=__abstracted_reg_write(cfg[6],SCI_REG_PetirocCfg0_REG_CFG6, handle);
	result+=__abstracted_reg_write(cfg[7],SCI_REG_PetirocCfg0_REG_CFG7, handle);
	result+=__abstracted_reg_write(cfg[8],SCI_REG_PetirocCfg0_REG_CFG8, handle);
	result+=__abstracted_reg_write(cfg[9],SCI_REG_PetirocCfg0_REG_CFG9, handle);
	result+=__abstracted_reg_write(cfg[10],SCI_REG_PetirocCfg0_REG_CFG10, handle);
	result+=__abstracted_reg_write(cfg[11],SCI_REG_PetirocCfg0_REG_CFG11, handle);
	result+=__abstracted_reg_write(cfg[12],SCI_REG_PetirocCfg0_REG_CFG12, handle);
	result+=__abstracted_reg_write(cfg[13],SCI_REG_PetirocCfg0_REG_CFG13, handle);
	result+=__abstracted_reg_write(cfg[14],SCI_REG_PetirocCfg0_REG_CFG14, handle);
	result+=__abstracted_reg_write(cfg[15],SCI_REG_PetirocCfg0_REG_CFG15, handle);
	result+=__abstracted_reg_write(cfg[16],SCI_REG_PetirocCfg0_REG_CFG16, handle);
	result+=__abstracted_reg_write(cfg[17],SCI_REG_PetirocCfg0_REG_CFG17, handle);
	result+=__abstracted_reg_write(cfg[18],SCI_REG_PetirocCfg0_REG_CFG18, handle);
	result+=__abstracted_reg_write(cfg[19],SCI_REG_PetirocCfg0_REG_CFG19, handle);
	result+=__abstracted_reg_write(0,SCI_REG_PetirocCfg0_START_REG_CFG, handle);
	result+=__abstracted_reg_write(2,SCI_REG_PetirocCfg0_START_REG_CFG, handle);
	result+=__abstracted_reg_write(0,SCI_REG_PetirocCfg0_START_REG_CFG, handle);
if (result!=0) return -1; else return 0;

}
//-----------------------------------------------------------------
//-
//- RATE_METER_RateMeter_0_GET_DATA
//-
//- USAGE: 
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN   channels
//- 		number of word to download from the buffer.
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN    int32_t
//- 		timeout in ms
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	       read_data  PARAM_OUT    int32_t
//- 		number of word read from the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	      valid_data  PARAM_OUT    int32_t
//- 		number of word valid in the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int RATE_METER_RateMeter_0_GET_DATA(uint32_t *val, uint32_t channels, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, channels, SCI_REG_RateMeter_0_FIFOADDRESS, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- RATE_METER_RateMeter_0_GET_DATA_COUNTS
//-
//- USAGE: 
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN   channels
//- 		number of word to download from the buffer.
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN    int32_t
//- 		timeout in ms
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	       read_data  PARAM_OUT    int32_t
//- 		number of word read from the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	      valid_data  PARAM_OUT    int32_t
//- 		number of word valid in the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int RATE_METER_RateMeter_0_GET_DATA_COUNTS(uint32_t *val, uint32_t channels, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_mem_read(val, channels, SCI_REG_RateMeter_0_FIFOADDRESS+512, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- CPACK_CP_0_START
//-
//- Start acquisition.
//-
//- ARGUMENTS:
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int CPACK_CP_0_START(NI_HANDLE *handle)

{
return __abstracted_reg_write(1,SCI_REG_CP_0_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- CPACK_CP_0_STOP
//-
//- Start acquisition.
//-
//- ARGUMENTS:
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int CPACK_CP_0_STOP(NI_HANDLE *handle)

{
return __abstracted_reg_write(0,SCI_REG_CP_0_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- CPACK_CP_0_RESET
//-
//- Reset counters and FIFO
//-
//- ARGUMENTS:
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int CPACK_CP_0_RESET(NI_HANDLE *handle)
{
return __abstracted_reg_write(0,SCI_REG_CP_0_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- CPACK_CP_0_FLUSH
//-
//- Clear Fifo Content
//-
//- ARGUMENTS:
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int CPACK_CP_0_FLUSH(NI_HANDLE *handle)
{
return __abstracted_reg_write(0,SCI_REG_CP_0_CONFIG, handle);

}
//-----------------------------------------------------------------
//-
//- CPACK_CP_0_STATUS
//-
//- Get status
//-
//- ARGUMENTS:
//- 	          status  PARAM_OUT    int32_t
//- 		Return the status:
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		bit[0] = 0) No data available
//- 		bit[0] = 1) Data available
//- 		bit[1] = 1) Running
//- 		bit[2] = 1) Full
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int CPACK_CP_0_STATUS(uint32_t *status,NI_HANDLE *handle)
{
int err;
uint32_t int_status=0;
err= __abstracted_reg_read(&int_status, SCI_REG_CP_0_READ_STATUS, handle);
*status = int_status & 0xF;
return err;

}
//-----------------------------------------------------------------
//-
//- CPACK_CP_0_DATA_AVAILABLE
//-
//- Return number of word available in the FIFO
//-
//- ARGUMENTS:
//- 	          status  PARAM_OUT    int32_t
//- 		Return the status (1) data available (0) no data
//- 		DEFAULT: 
//- 		OPTIONAL: False
//- 		bit[0] = 0) No data available
//- 		bit[0] = 1) Data available
//- 		bit[1] = 1) Running
//- 		bit[2] = 1) Full
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int CPACK_CP_0_DATA_AVAILABLE(uint32_t *status,NI_HANDLE *handle)
{
return __abstracted_reg_read(status, SCI_REG_CP_0_READ_VALID_WORDS, handle);

}
//-----------------------------------------------------------------
//-
//- CPACK_CP_0_DOWNLOAD
//-
//- Download data from buffer. Data in the buffer respect the packet layout defined in the Packet Creator Tool
//- 
//- USAGE: 
//- 
//-
//- ARGUMENTS:
//- 	             val  PARAM_OUT   uint32_t
//- 		uint32_t buffer data with preallocated size of at list 'size' parameters + 16 word
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN       size
//- 		number of word to download from the buffer. 
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	             val   PARAM_IN    int32_t
//- 		timeout in ms
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	          handle PARAM_INOUT  NI_HANDLE
//- 		Connection handle to the board
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	       read_data  PARAM_OUT    int32_t
//- 		number of word read from the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	      valid_data  PARAM_OUT    int32_t
//- 		number of word valid in the buffer
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int CPACK_CP_0_DOWNLOAD(uint32_t *val, uint32_t size, int32_t timeout, NI_HANDLE *handle, uint32_t *read_data, uint32_t *valid_data)
{
return __abstracted_fifo_read(val, size, SCI_REG_CP_0_FIFOADDRESS, SCI_REG_CP_0_READ_STATUS,1, timeout, handle, read_data, valid_data);

}
//-----------------------------------------------------------------
//-
//- CPACK_CP_0_RECONSTRUCT_DATA
//-
//- Take in input a circular buffer (buffer_handle) allocated with the function Utility_ALLOCATE_DOWNLOAD_BUFFER 
//- And filled with downloaded data Utility_ENQUEUE_DATA_IN_DOWNLOAD_BUFFER And decoded the packet  
//- created with the Image (Frame Transfer block).
//- The function internally allocate the output data structure t_FRAME_packet_collection And fill it with packed data
//- decoded. Release the memory allocated by the function with free_FRAME_packet_collectionvoid(buffer) function
//- in order to avoid memory leakage
//- ----------------------------------------
//- USAGE: 
//-   t_FRAME_packet_collection decoded_packets; 
//-   uint32_t data_frame[100000]; 
//-   void *BufferDownloadHandler = NULL;
//- 
//-   Utility_ALLOCATE_DOWNLOAD_BUFFER(&BufferDownloadHandler, 1024*1024);
//-   .... initialize frame transfer ....
//-   while (1){
//-     CPACK_CP0_DOWNLOAD(&data_frame, N_Packet * (PacketSize), timeout_frame, &handle, &read_data_frame, &valid_data_frame); 
//-     Utility_ENQUEUE_DATA_IN_DOWNLOAD_BUFFER(BufferDownloadHandler, data_frame, valid_data_frame, &valid_data_enqueued); 
//-     if (CPACK_CP_0_RECONSTRUCT_DATA(BufferDownloadHandler, &decoded_packets) == 0) { 
//-         .... process data contained in decoded_packets....
//-         free_FRAME_packet_collectionvoid(&decoded_packets);
//-     }
//- 
//- 
//- 
//- 
//- THIS FUNCTION MUST BE CONFIGURED IN FUNCTION OF THE PACKET LAYOUT DEFINED IN THE TOOL!
//- 
//- 
//- 
//- This Is just the skeleton for the decoded function!
//- In the state 3 of the thate machine in the code the packet decoder extract every line from the packet
//- for example if the payload of your packet Is 8 channels of 16 bits alligned 2 channels per row
//- 1:   0xFFFFFFFF      %%HEADER                            Decoded in state 0
//- 2:   0xtttttttt      %%TIMECODE                          Decoded in state 1
//- 3:   0xpppppppp      %%PACKET COUNTER                    Decoded in state 2
//- 4:   IN1    IN2      %%16 BIT DATA * 2 Channels          Decoded in state 3
//- 5:   IN3    IN4      %%16 BIT DATA * 2 Channels          Decoded in state 3
//- 6:   IN5    IN6      %%16 BIT DATA * 2 Channels          Decoded in state 3
//- 7:   IN7    IN7      %%16 BIT DATA * 2 Channels          Decoded in state 3
//- <<<NUMBER OF PACKET LINES AFTER THE HEADER HERE>>> must be set to 4 (the line containing the payload 4...7)
//- You can change the state machine in an arbitrary way in order to correctly decode packets and extract every single channels
//- This function example works as is for the following packet format
//- 1:   0xFFFFFFFF      %%HEADER                            Decoded in state 0
//- 2:   0xtttttttt      %%TIMECODE                          Decoded in state 1
//- 3:   0xpppppppp      %%PACKET COUNTER                    Decoded in state 2
//- 4:   IN1             %%32 BIT DATA                       Decoded in state 3
//- 5:   IN2             %%32 BIT DATA                       Decoded in state 3
//- 6:   IN3             %%32 BIT DATA                       Decoded in state 3
//- 7:   IN4             %%32 BIT DATA                       Decoded in state 3
//- 
//-
//- ARGUMENTS:
//- 	   buffer_handle   PARAM_IN       void
//- 		void pointer to the allocated memory area
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//- 	 decoded_packets  PARAM_OUT t_FRAME_packet_collection
//- 		Output vector containing the decoded data
//- 		DEFAULT: 
//- 		OPTIONAL: False
//-
//-
//- RETURN [int]
//- 	Return if the function has been succesfully executed
//- 		0) Success
//- 		-1) Error
//-
//-----------------------------------------------------------------

SCILIB int CPACK_CP_0_RECONSTRUCT_DATA(void *buffer_handle, t_generic_event_collection *decoded_packets)
{
	cbuf_handle_t cbuf;
	cbuf = (cbuf_handle_t)buffer_handle;
	int PacketSize =7;
	int in_sync = 0;
	uint64_t event_timecode = 0;
	uint32_t ev_energy = 0;
	uint32_t mpe = 0;
	int ch_index = 0;
	int i = 0,j;
	int k = 0;
	decoded_packets->packets = NULL;
	decoded_packets->allocated_packets = 0;
	decoded_packets->valid_packets = 0;
	
	//check if we have elements in the circular buffer
	int bfsize = circular_buf_size(cbuf);
	if (bfsize < PacketSize + 1) return -1;
	//allocate output
	int possible_packets = (circular_buf_size(cbuf) / PacketSize)+10;
	if (possible_packets < 1) return -1;
	decoded_packets->packets = (t_generic_event *)malloc(possible_packets * sizeof(t_generic_event));
	if (decoded_packets->packets==NULL) return -2;
	decoded_packets->allocated_packets = possible_packets;
	decoded_packets->valid_packets = 0;
	t_CP_0_struct temp_data;
	//process packets
	while (circular_buf_size(cbuf)> 0)
	{
		circular_buf_get(cbuf, &mpe);

		if (in_sync == 0) {
			if (mpe != 0x08000000)
			{
				continue;
			}
			in_sync = 1;
		    ch_index =0;
			continue;
		}
		if (in_sync == 1) {
			temp_data.row[0]  =  mpe;
			in_sync = 2;
			continue;
		}
		if (in_sync == 2) {
			temp_data.row[1]  =  mpe;
			in_sync = 3;
			continue;
		}
		if (in_sync == 3) {
			temp_data.row[2]  =  mpe;
			in_sync = 4;
			continue;
		}
		if (in_sync == 4) {
			temp_data.row[3]  =  mpe;
			in_sync = 5;
			continue;
		}
		if (in_sync == 5) {
			temp_data.row[4]  =  mpe;
			in_sync = 6;
			continue;
		}
		if (in_sync == 6) {
			temp_data.row[5]  =  mpe;
			decoded_packets->packets[k].payload = malloc(sizeof(t_CP_0_struct));
			if (decoded_packets->packets[k].payload != NULL) {
			    *((t_CP_0_struct*)decoded_packets->packets[k].payload) = temp_data;
			    k++;
			    decoded_packets->valid_packets = k;
			}
			if (k > decoded_packets->allocated_packets) return 0;
			
			in_sync = 0;
			if (circular_buf_size(cbuf) >= PacketSize)
			    continue;
			else
			    break;
		}
	}

 return 0;

}
