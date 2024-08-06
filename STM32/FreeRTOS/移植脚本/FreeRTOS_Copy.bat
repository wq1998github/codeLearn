::�ص�����
@echo off

::���� FreeRTOS Դ����·��
set FreeRTOS_Path=C:\Users\wangq\Desktop\FreeRTOSv9.0.0\FreeRTOSv9.0.0
::echo %FreeRTOS_Path%

::�������ĸ�λ����ֲ FreeRTOS Դ����
set Create_Path=.\FreeRTOS

::���� FreeRTOS �ļ���
IF EXIST %Create_Path% (
    echo "��ǰ·�����Ѵ��� FreeRTOS �ļ���"
    
    ::ɾ���Ѵ��ڵ� FreeRTOS �ļ���
    ::rd %Create_Path% /s /q
    
    ::����
    goto :end
) ELSE (
    echo "���� FreeRTOS �ļ���"
    
    :: ��������ļ���
    md %Create_Path%\Core\Source
    md %Create_Path%\Core\Include
    
    md %Create_Path%\portable\Keil
    md %Create_Path%\portable\MemMang
    md %Create_Path%\portable\RVDS
)

::���� FreeRTOS Դ����
xcopy %FreeRTOS_Path%\FreeRTOS\Source\*.c %Create_Path%\Core\Source
xcopy %FreeRTOS_Path%\FreeRTOS\Source\include\*.h %Create_Path%\Core\Include
xcopy %FreeRTOS_Path%\FreeRTOS\Source\portable\Keil %Create_Path%\portable\Keil /e

xcopy %FreeRTOS_Path%\FreeRTOS\Source\portable\MemMang %Create_Path%\portable\MemMang /e
xcopy %FreeRTOS_Path%\FreeRTOS\Source\portable\RVDS %Create_Path%\portable\RVDS /e

:end
pause
