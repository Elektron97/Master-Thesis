function my_startup()
% My SoRoSim Start Up
toolbox_name = 'SoRoSim';
current_path = pwd;

% Find SoRoSim path
mngr        = com.mathworks.addons_toolbox.ToolboxManagerForAddOns();
installed   = cell(mngr.getInstalled());
myTb        = installed{find(cellfun(@(tb) strcmp(tb.getName(), toolbox_name), installed), 1)};
identifier  = char(myTb.getInstallationIdentifier());
addon_path   = extractBefore(identifier, '|');

% cd ~
base_path = pwd;
% addon_path = erase(addon_path, base_path);
cd(addon_path)
startup

cd(current_path)

% Clear
clear variables
end

