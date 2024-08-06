@echo off

::��׼�����·��
set SPL_Path="D:\STM32\00_STM32��������\STM32�̼���\F1\en.stsw-stm32054\STM32F10x_StdPeriph_Lib_V3.5.0"
echo ��׼������ַ��%SPL_Path%

::���ĸ�λ�ô��� Keil ����
set Create_Path=".\"

::�����ļ���
set Doc_Path=%Create_Path%\Documentation
set Project_Path=%Create_Path%\Projects
set Midware_Path=%Create_Path%\Middleware
set Std_Path=%Create_Path%\STM32F10x_StdPeriph_Lib

::goto :Start_Copy

md %Doc_Path%
md %Project_Path%
md %Midware_Path%
md %Std_Path%

md %Project_Path%\Demo\MDK-Keil
md %Project_Path%\Demo\Application\AppMain\Inc
md %Project_Path%\Demo\Application\AppMain\Src

md %Std_Path%\CMSIS\Startup
md %Std_Path%\CMSIS\CoreSupport
md %Std_Path%\CMSIS\DeviceSupport
md %Std_Path%\STM32F10x_StdPeriph_Driver

::���Ʊ�׼�����
:Start_Copy
xcopy %SPL_Path%\Libraries\STM32F10x_StdPeriph_Driver			%Std_Path%\STM32F10x_StdPeriph_Driver /e
xcopy %SPL_Path%\Libraries\CMSIS\CM3\CoreSupport				%Std_Path%\CMSIS\CoreSupport /e
xcopy %SPL_Path%\Libraries\CMSIS\CM3\DeviceSupport\ST\STM32F10x %Std_Path%\CMSIS\DeviceSupport /e
xcopy %Std_Path%\CMSIS\DeviceSupport\startup\arm\*.s			%Std_Path%\CMSIS\Startup
rd %Std_Path%\CMSIS\DeviceSupport\startup /s /q

::ɾ����׼������е�html�ļ�
del *.html /s

::����Ӧ�ò����
set Temp_Project_Path=%SPL_Path%\Project\STM32F10x_StdPeriph_Template
set AppMain_Path=%Project_Path%\Demo\Application\AppMain

xcopy %Temp_Project_Path%\*.c %AppMain_Path%\Src
xcopy %Temp_Project_Path%\*.h %AppMain_Path%\Inc

del %AppMain_Path%\Src\system_stm32f10x.c /s

::���� Keil ���������ļ�
set Keil_Path=%Project_Path%\Demo\MDK-Keil
xcopy %Create_Path%\Demo.* %Keil_Path%\
del xcopy %Create_Path%\Demo.* /q

pause
