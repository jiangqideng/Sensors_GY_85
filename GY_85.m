%GY-85ģ�����������ٶȼ�ADXL345������������ITG3205�����������HMC5583L
%������Ϊ��λ���Ĵ�����򣬴Ӵ���com2������λ�������ݣ��������ݻ�ԭ��У׼��������ʵʱ�������ߡ�
%ͼ1��2��3Ϊ���ٶ�x��y��z�����ݣ�ͼ4��5��6Ϊ���ٶ�x��y��z�����ݣ�ͼ7Ϊ�����Ƶ�y��z������ĽǶȣ���Ϊx������洹ֱ����ͼ8Ϊ�����ָʾ��
%��������Ҫ����λ���Ĳɼ����ʹ�ã���λ������ʹ�õ�Ƭ��������GY-85ģ�����ݵĲɼ��봫�䣬�ⷽ����������Ϻܶࡣ
%��ҵ��Ƶĵ�һС���֣��������󣬵�д�ıȽ��ң������ο��������½⡣

%%�۲촫��������,����У׼            accel_x(jj)=accel_x(jj)-976.153;accel_y(jj)=accel_y(jj)+5.1209;accel_z(jj)=accel_z(jj)-72.2687;
%�򿪴���
        s = serial('com2');
        set(s,'baudrate',9600)
        try
        fopen(s);
        catch err
        fprintf('%s��ʧ�ܡ�\n', s.name);
        end
        fprintf('%s�ɹ��򿪡�\n', s.name);

jj=1;                                           %���ڴ�����ʱ�ļ���
ii=1;
accel_x=0;accel_y=0;accel_z=0;itg_x=0;itg_y=0;itg_z=0;HMC_x=0;HMC_y=0;HMC_z=0;
subplot(3,3,1);h1=plot(1,1);
subplot(3,3,2);h2=plot(1,1);
subplot(3,3,3);h3=plot(1,1);
subplot(3,3,4);h4=plot(1,1);
subplot(3,3,5);h5=plot(1,1);
subplot(3,3,6);h6=plot(1,1);
subplot(3,3,7);h7=plot(1,1);
subplot(3,3,8);h8=plot(1,1);
subplot(3,3,9);h9=plot(1,1);
while(1)      
%            hh=s.BytesAvailable;                %��¼�±��ν��յ����ݵ��ֽ���
%            if hh>=jj+2
            hh=s.BytesAvailable;
            if hh>=20
            receive = fread(s,s.BytesAvailable);
            if receive(20)~=255;
				disp('�������ݻ���');           
            end
%***********************���ٶ�***********************************%             
            accel_x(jj)=(receive(1)*256+receive(2));
            if accel_x(jj)>=32768
                accel_x(jj)=accel_x(jj)-65536;
            end
            accel_x(jj)=accel_x(jj)*3.9;
            
            accel_y(jj)=(receive(3)*256+receive(4));
            if accel_y(jj)>=32768
                accel_y(jj)=accel_y(jj)-65536;
            end
            accel_y(jj)=accel_y(jj)*3.9;
            
            accel_z(jj)=(receive(5)*256+receive(6));
            if accel_z(jj)>=32768
                accel_z(jj)=accel_z(jj)-65536;
            end
            accel_z(jj)=accel_z(jj)*3.9;  
%******************У׼****************************            
            accel_x(jj)=accel_x(jj)-976.153;
            accel_y(jj)=accel_y(jj)+5.1209;
            accel_z(jj)=accel_z(jj)-72.2687;
            
            
%***********************���ٶ�***********************************%            
            itg_x(jj)=(receive(13)*256+receive(14));
            if itg_x(jj)>=32768
                itg_x(jj)=itg_x(jj)-65536;
            end
            itg_x(jj)=itg_x(jj)/14.375;
            
            itg_y(jj)=(receive(15)*256+receive(16));
            if itg_y(jj)>=32768
                itg_y(jj)=itg_y(jj)-65536;
            end
            itg_y(jj)=itg_y(jj)/14.375;
            
            itg_z(jj)=(receive(17)*256+receive(18));
            if itg_z(jj)>=32768
                itg_z(jj)=itg_z(jj)-65536;
            end
            itg_z(jj)=itg_z(jj)/14.375; 
%***********************�ų�***********************************% 
            HMC_z(jj)=(receive(7)*256+receive(8));            
           if HMC_z(jj)>=32768
                HMC_z(jj)=HMC_z(jj)-65536;
            end
            HMC_y(jj)=(receive(9)*256+receive(10));            
            if HMC_y(jj)>=32768
               HMC_y(jj)=HMC_y(jj)-65536;
            end
            HMC_x(jj)=(receive(11)*256+receive(12));  
            if HMC_x(jj)>=32768
               HMC_x(jj)=HMC_x(jj)-65536;
            end
%�ų�У׼%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            HMC_y(jj)=HMC_y(jj)-(-397.3444);
            HMC_z(jj)=HMC_z(jj)-(-167.1790);
            HMC_z(jj)=HMC_z(jj)*(345.2024/313.5846);
            angle(jj)=atan2(HMC_y(jj),HMC_z(jj)) * (180 / 3.14159265) + 180;
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                
            if jj>=1*ii %������ʾ֡���ٶ�
            delete(h1);delete(h2);delete(h3);delete(h4);delete(h5);delete(h6);delete(h7);delete(h8);%delete(h9);
            if jj>100
            subplot(3,3,1);h1=plot(accel_x(jj-99:jj));axis([0 110 -1000 1000]);grid on;
            subplot(3,3,2);h2=plot(accel_y(jj-99:jj));axis([0 110 -1000 1000]);grid on;
            subplot(3,3,3);h3=plot(accel_z(jj-99:jj));axis([0 110 -1000 1000]);grid on;
            subplot(3,3,4);h4=plot(itg_x(jj-99:jj));axis([0 110 -600 600]);grid on;
            subplot(3,3,5);h5=plot(itg_y(jj-99:jj));axis([0 110 -600 600]);grid on;
            subplot(3,3,6);h6=plot(itg_z(jj-99:jj));axis([0 110 -600 600]);grid on;
            subplot(3,3,7);h7=plot(angle(jj-99:jj));axis([0 110 0 360]);grid on;
            else
            subplot(3,3,1);h1=plot(accel_x(1:jj));axis([0 110 -1000 1000]);grid on;
            subplot(3,3,2);h2=plot(accel_y(1:jj));axis([0 110 -1000 1000]);grid on;
            subplot(3,3,3);h3=plot(accel_z(1:jj));axis([0 110 -1000 1000]);grid on;
            subplot(3,3,4);h4=plot(itg_x(1:jj));axis([0 110 -600 600]);grid on;
            subplot(3,3,5);h5=plot(itg_y(1:jj));axis([0 110 -600 600]);grid on;
            subplot(3,3,6);h6=plot(itg_z(1:jj));axis([0 110 -600 600]);  grid on;
            subplot(3,3,7);h7=plot(angle(1:jj));axis([0 110 0 360]);    grid on;            
            end
            
            subplot(3,3,8);h8=plot([0 HMC_y(jj)],[0 -HMC_z(jj)],'-r.','linewidth',4);axis([-400 400 -400 400]); grid on;     
            
            pause(0.001);
            ii=ii+1;
            end
            jj=jj+1;
            end
end