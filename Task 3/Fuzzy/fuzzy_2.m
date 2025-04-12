clc;clear
%% input MFs: (This is just for show)

inp_range = 0:0.001:1;

% Input mf's
in1 = trapmf(inp_range, [0 0 0.12 0.22]);
in2 = trapmf(inp_range, [0.12 0.22 0.35 0.6]);
in3 = trimf(inp_range, [0.35 0.55 0.75]);
in4 = trimf(inp_range, [0.55 0.75 1]);
in5 = trimf(inp_range, [0.75 1 1]);


plot(inp_range, in1, inp_range, in2, inp_range, in3,inp_range, in4,inp_range, in5)
ylim([0,1.1])
title('input membership functions')
ylabel('\mu')
xlabel('F_{in}')
legend(['VL' 'L' 'M' 'H', 'VH'])
%% Output MFs:

out_range = 0:0.001:1;

% Output mf's
out1 = trapmf(out_range, [0 0 0.1 0.25]);
out2 = trapmf(out_range, [0.1 0.25 0.35 0.65]);
out3 = trimf(out_range, [0.35 0.65 0.85]);
out4 = trimf(out_range, [0.65 0.85 1]);
out5 = trimf(out_range, [0.85 1 1]);

plot(out_range, out1, out_range, out2, out_range, out3, out_range, out4, out_range, out5)
ylim([0,1.1])
title('output membership functions')
ylabel('\mu')
xlabel('h')
legend(['VL' 'L' 'M' 'H', 'VH'])

%% Rules:
inp = 5.1;
max_inp = 10.5;
min_inp = 1.1;
inp_normal = (inp - min_inp)/(max_inp - min_inp);

% Fuzzify Inputs
in1 = trapmf(inp_normal, [0 0 0.12 0.22]);
in2 = trapmf(inp_normal, [0.12 0.22 0.35 0.55]);
in3 = trimf(inp_normal, [0.35 0.55 0.75]);
in4 = trimf(inp_normal, [0.55 0.75 1]);
in5 = trimf(inp_normal, [0.75 1 1]);


% Implication
% rule 1:
imp1 = min(out1, in1);
% rule 2:
imp2 = min(out2, in2);
% rule 3:
imp3 = min(out3, in3);
% rule 4:
imp4 = min(out4, in4);
% rule 5:
imp5 = min(out5, in5);

figure
plot(out_range, imp1, out_range, imp2, out_range, imp3, out_range, imp4, out_range, imp5)
ylim([0,1.1])
title('output membership functions')
ylabel('\mu')
xlabel('h')
legend(['VL' 'L' 'M' 'H', 'VH'])
%% Aggregate outputs

% Aggregate using union
aggregated = max(max(max(imp1, max(imp2, imp3)), imp4), imp5);

subplot(2,1,1)
plot(out_range, imp1, out_range, imp2, out_range, imp3, out_range, imp4, out_range, imp5)
ylim([0,1.1])
title('implications')
ylabel('\mu')
xlabel('h')
legend(['rule 1' 'rule 2' 'rule 3' 'rule 4' 'rule 5'])

subplot(2,1,2)
plot(out_range, aggregated)
ylim([0,1.1])
title('aggregated output')
ylabel('\mu')
xlabel('h')
%% Defuzzification: Center of area

% Calculate COG using equation
defuzzified = sum(aggregated.*out_range)/sum(aggregated)

max_out = 122391;
min_out =37731;

salary = defuzzified * (max_out - min_out) + min_out
