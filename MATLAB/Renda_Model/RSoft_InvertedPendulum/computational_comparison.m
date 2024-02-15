clear all
clc
close all

%% Computational Times of the two Models
inertia_renda = 0.19104;
gravity_renda = 0.034344;

inertia_santina = 0.10244;
gravity_santina = 0.014415;

%% Percentual
inertia_perc = 100*(inertia_renda - inertia_santina)/inertia_santina;
disp("[INERTIA]: Computational Time increased of " + num2str(inertia_perc) + " %.")
gravity_perc = 100*(gravity_renda - gravity_santina)/gravity_santina;
disp("[GRAVITY]: Computational Time increased of " + num2str(gravity_perc) + " %.")

%% Plot
% Define categories
x = categorical({'Inertia', 'Gravity'});
y = [inertia_santina, inertia_renda; gravity_santina gravity_renda];

figure
bar(x, y)
% title("Computational Time of Dynamics Matrices");
ylabel("Comp. Time [s]");
legends = legend("Curv. Param.", "Strain Param.");
set(legends,...
    'Position',[0.170238074323251 0.765476203709841 0.223214285714286 0.0837301587301587]);
grid on
% Create doublearrow
annotation('doublearrow',[0.671527777777778 0.671875],...
    [0.886031966643502 0.526059763724809],...
    'Color',[0.466666666666667 0.674509803921569 0.188235294117647],...
    'LineWidth',2,...
    'LineStyle','--');

% Create doublearrow
annotation('doublearrow',[0.363194444444444 0.363541666666666],...
    [0.247783877692842 0.166087560806115],...
    'Color',[0.466666666666667 0.674509803921569 0.188235294117647],...
    'LineWidth',2,...
    'LineStyle','--');

% Create textbox
annotation('textbox',...
    [0.531605158730157 0.68661879391553 0.160119047619048 0.0650793650793651],...
    'Color',[0.466666666666667 0.674509803921569 0.188235294117647],...
    'String', "+" + num2str(inertia_perc) + "%",...
    'LineStyle','none');

% Create textbox
annotation('textbox',...
    [0.20303373015873 0.175950009375999 0.173214285714286 0.0650793650793651],...
    'Color',[0.466666666666667 0.674509803921569 0.188235294117647],...
    'String', "+" + num2str(gravity_perc) + "%",...
    'LineStyle','none');