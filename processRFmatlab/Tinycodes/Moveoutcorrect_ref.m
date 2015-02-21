function [Newdatar, EndIndex, x_s, x_p] = Moveoutcorrect_ref(datar, rayp, raypref, YAxisRange, sampling, shift)

RFlength = size(datar,1); EV_num = size(datar, 2);
%% Model information
Velocity1D='/Users/xumj/Documents/MATLAB/ccp/VEL_models/IASP91.vel';
VelocityModel = load(Velocity1D,'-ascii');

% Depths
%--------------------------------------------------------------------------
Depths = VelocityModel(:,1);
% Velocities
%--------------------------------------------------------------------------
Vp = VelocityModel(:,2);
Vs = VelocityModel(:,3);
% Interpolate velocity model to match depth range and increments
%--------------------------------------------------------------------------
Vp = interp1(Depths,Vp,YAxisRange)';
Vs = interp1(Depths,Vs,YAxisRange)';
Depths = YAxisRange';

% Depth intervals
%--------------------------------------------------------------------------
dz = [0; diff(Depths)];
% Radial shells
%--------------------------------------------------------------------------
R = 6371 - Depths;

%% 1D ray tracing:
%--------------------------------------------------------------------------
for i = 1:EV_num
    
x_s(:,i) = cumsum((dz./R) ./ sqrt((1./(rayp(i)^2.* (R./Vs).^-2)) - 1));%Pds piercing distance from station in rad
raylength_s(:,i) = (dz.*R) ./  (sqrt(((R./Vs).^2) - (rayp(i)^2)).* Vs);
x_p(:,i) = cumsum((dz./R) ./ sqrt((1./(rayp(i)^2.* (R./Vp).^-2)) - 1));%P piercing distance from station in rad
raylength_p(:,i) = (dz.*R) ./  (sqrt(((R./Vp).^2) - (rayp(i)^2)).* Vp);

% Calculate Pds travel time
%----------------------------------------------------------------------
Tpds(:,i) = cumsum((sqrt((R./Vs).^2 - rayp(i)^2) - sqrt((R./Vp).^2 - rayp(i)^2)) .* (dz./R));%the travel time versus depth in columns for all RFs

end

Tpds_ref = cumsum((sqrt((R./Vs).^2 - (rad2deg(raypref))^2) - sqrt((R./Vp).^2 - (rad2deg(raypref))^2)) .* (dz./R));%the travel time for referred rayp 

%% Adjust the travel time by compressing/stretching the time scale
Newdatar=zeros(RFlength,EV_num); EndIndex = zeros(EV_num, 1);
for i = 1:EV_num
TempTpds = Tpds(:,i);
StopIndex = find(imag(TempTpds),1);
if isempty(StopIndex)
    StopIndex = length(Depths) + 1;
end
EndIndex(i) = StopIndex - 1;
Newaxis(1:(shift/sampling+1)) = -shift:sampling:0;
    for j = (shift/sampling)+2:RFlength
        Refaxis = (j-1)*sampling - shift;        
         index = find(Refaxis <= Tpds((1:StopIndex-1),i),1,'first');        
         if isempty(index)
            break;end
         Ratio = (Tpds_ref(index) - Tpds_ref(index-1))/(Tpds(index,i) - Tpds(index-1,i));
         Newaxis(j) = Tpds_ref(index-1) + (Refaxis - Tpds(index-1,i))*Ratio;               
    end 
    
    if j < RFlength        
    j=j-1;
    end
    %New RF generated
    Tempdata = interp1(Newaxis,datar(1:j,i),(0:1:RFlength-1)*sampling-shift);
    endIndice = find(isnan(Tempdata),1,'first');
    
     if isempty(endIndice)
        New_data = Tempdata;
    else
        New_data = [Tempdata(1:endIndice-1)';datar(j+1:end,i)];
    end
   
    %adjust to the length equal to RFlength:    
        if length(New_data) < RFlength
           Newdatar(:,i)=[New_data;zeros(RFlength - length(New_data),1)];
        else
           Newdatar(:,i)=New_data(1:RFlength);
        end
     %%Normalization
     %Newdatar(:,i) = Newdatar(:,i)/max(Newdatar(:,i));
    Newaxis = []; New_data = [];
end

return

    
        
        
            
            


    
        
        
    
    