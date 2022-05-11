from Digital_Functions import *
from ctypes import *
import matplotlib.pyplot as plt
import time

[ListOfDevices, count] = ListDevices()
if (count > 0):

	board = ListOfDevices[0].encode('utf-8')

	Init()
	[err, handle] = ConnectDevice(board)
	if (err == 0):
		print("Successful connection to board ", board)
	else:
		print("Connection Error")


	PETIROC_PetirocCfg0_CONFIG("0000000000000000000000000000000000000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100000001100010000000000000000000000000000000000000000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000010000011100011001000001100100110011110100000111111111101111111010011111111001111111111011001011",handle)


	## ---------------------------------------------------- ##
	## CODE EXAMPLE FOR HV CONTROLLER                       ##
	SetIICControllerBaseAddress(Digital_RegisterFile.SCI_REG_i2chv_CTRL, Digital_RegisterFile.SCI_REG_i2chv_MON, handle)
	voltage=0
	target_voltage=55
	SetHV_A7585D(1,target_voltage,handle)
	while abs(voltage-target_voltage) > 0.2:
		[err, enable, voltage, current] = GetHV_A7585D(handle)
		print(enable, " ", voltage, " ", current)
		time.sleep(1)
	
	## ---------------------------------------------------- ##


	plt.ion()
	plt.show()
	N_Packet = 100
	Timeout_ms = 1000
	N_Total_Events = 10000
	ReadDataNumber = 0
	if (CPACK_CP_0_RESET(handle) != 0):
		print("Reset Error!")
	if (CPACK_CP_0_START(handle) == True):
		[err, Frame_Status] = CPACK_CP_0_GET_STATUS(handle)
		if (Frame_Status >0):
			while(ReadDataNumber < N_Total_Events):
				[err, Frame_Data, Frame_Read_Data, Frame_Valid_Data] = CPACK_CP_0_GET_DATA(N_Packet, Timeout_ms, handle)
				[Time_Code, Pack_Id, Energy] = CPACK_CP_0_RECONSTRUCT_DATA(Frame_Data)                 
				ReadDataNumber += N_Packet
				print("Event Id: ", Pack_Id[0])
				plt.cla()
				plt.plot(Energy[0])
				plt.pause(0.01)
				print("Total Acquired Events: ", ReadDataNumber)
		else:
			print("Status Error")
	else:
		print("Start Error")


