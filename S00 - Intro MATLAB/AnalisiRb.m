dati = readtable("dati_Rb.txt",NumHeaderLines=1);
dati = table2array(dati);
Vcont = dati(:,1);
S_Rb = dati(:,2);
S_FP = dati(:,3);
S_Rb = - S_Rb;
[pks,locs] = findpeaks(S_FP,'MinPeakHeight',0.2);
Vpks = Vcont(locs);
p = polyfit((1:size(Vpks)),Vpks,1);
freq = Vcont./p(1).*0.5 + 3;
f = fit(freq,S_Rb,'gauss4','StartPoint',[2.7,1.1,0.2, 7.6,2.4,0.2, 10.7,3.8,0.2, 4.8,4.3,0.2]);
plot(f,freq,S_Rb);
xlabel("Relative frequency [GHz]");
ylabel("Intensity [a.u.]");

myfig = gcf;
exportgraphics(gcf,"SpettroRb.pdf",ContentType="vector");