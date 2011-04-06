
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot Fields
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fig = figure;
SetFigure(fig, Title, [500 274 965 826]);

subplot(211);
h = plot(LAMBDA/micrometers,10*log10(REF),'-r','LineWidth',2);
hold on;
plot(LAMBDA/micrometers,10*log10(TRN),'-b','LineWidth',2);
plot(LAMBDA/micrometers,10*log10(CON),':k','LineWidth',2);
hold off;
axis([LAMBDA(1)/micrometers LAMBDA(NLAM)/micrometers -40 5]);
h2 = get(h,'Parent');
set(h2,'FontSize',14,'LineWidth',2);
h = legend('Reflectance','Transmittance','Conservation');
set(h,'Location','NorthEastOutside');
xlabel('Wavelength (um)');
ylabel('dB','Rotation',0,'HorizontalAlignment','right');



subplot(212);
h = Draw1D(ER,abs(ssEy),-1, dz/micrometers);
axis([za(1)/micrometers za(length(za))/micrometers 0 1.5 ]);
xlabel('z (nm)');
h2 = get(h,'Parent');
set(h2,'FontSize',14,'LineWidth',2);
title(['STEADY-STATE FIELD @ ' num2str(lambda_0/micrometers) ' um']);
xlabel('z (um)');
ylabel('|E|','Rotation',0,'HorizontalAlignment','right');

