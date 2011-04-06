
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot Fields
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fig = figure;
SetFigure(fig, Title, [500 274 965 826]);

subplot(211);
h = plot(FREQ/gigahertz,100*REF,'-r','LineWidth',2);
hold on;
plot(FREQ/gigahertz,100*TRN,'-b','LineWidth',2);
plot(FREQ/gigahertz,100*CON,':k','LineWidth',2);
hold off;
axis([FREQ(1)/gigahertz FREQ(NFREQ)/gigahertz 0 105 ]);
h2 = get(h,'Parent');
set(h2,'FontSize',14,'LineWidth',2);
h = legend('Reflectance','Transmittance','Conservation');
set(h,'Location','NorthEastOutside');
xlabel('Frequency (GHz)');
ylabel('%','Rotation',0,'HorizontalAlignment','right');


subplot(212);
h = plot(FREQ/gigahertz,10*log10(REF),'-r','LineWidth',2);
hold on;
plot(FREQ/gigahertz,10*log10(TRN),'-b','LineWidth',2);
plot(FREQ/gigahertz,10*log10(CON),':k','LineWidth',2);
hold off;
axis([FREQ(1)/gigahertz FREQ(NFREQ)/gigahertz -60 1 ]);
h2 = get(h,'Parent');
set(h2,'FontSize',14,'LineWidth',2);
h = legend('Reflectance','Transmittance','Conservation');
set(h,'Location','NorthEastOutside');
xlabel('Frequency (GHz)');
ylabel('dB','Rotation',0,'HorizontalAlignment','right');
