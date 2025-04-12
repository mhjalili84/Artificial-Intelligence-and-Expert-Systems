clc
clear
%% Membership function types

x = 0:0.01:10; % Input

mf1 = A(x); %mf 1

plot(x, mf1);
hold on
ylim([0, 1.2]);
legend(['A mf']);


mf2 = B(x); %mf 1

plot(x, mf2);
hold on
ylim([0, 1.2]);
legend(['B mf']);
%% Not --> Not(A) = 1-A

NotA = 1-mf1;

subplot(2,1,1);
plot(x, mf1);
ylim([0, 1.2]);
legend(['A']);

subplot(2,1,2);
plot(x, NotA);
ylim([0, 1.2]);
legend(['Not(A)']);

%% Not --> Not(B) = 1-B

NotB = 1-mf2;

subplot(2,1,1);
plot(x, mf2);
ylim([0, 1.2]);
legend(['B']);

subplot(2,1,2);
plot(x, NotB);
ylim([0, 1.2]);
legend(['Not(B)']);
%% Or (S-Norm) --> Or(A,B) = max(A, B)

A_Or_B = max(mf1,mf2);

subplot(2,1,1);
plot(x, mf1);
hold on
plot(x, mf2);
ylim([0, 1.2]);
legend(['A' 'B']);

subplot(2,1,2);
plot(x, A_Or_B);
ylim([0, 1.2]);
legend(['Or(A,B)']);

%% And (T-Norm) --> And(A,B) = min(A, B)

A_And_B = min(mf1,mf2);

subplot(2,1,1);
plot(x, mf1);
hold on
plot(x, mf2);
ylim([0, 1.2]);
legend(['mf1' 'mf2']);

subplot(2,1,2);
plot(x, A_And_B);
ylim([0, 1.2]);
legend(['And(A,B)']);

%% Or (S-Norm) --> Or(NotA,NotB) = max(NotA, NotB)

NotA_Or_NotB = max(NotA, NotB);

subplot(2,1,1);
plot(x, NotA);
hold on
plot(x, NotB);
ylim([0, 1.2]);
legend(['NotA' 'NotB']);

subplot(2,1,2);
plot(x, NotA_Or_NotB);
ylim([0, 1.2]);
legend(['Or(NotA,NotB)']);

%% And (T-Norm) --> And(A,NotB) = min(A, NotB)

NotA_And_NotB = min(mf1, NotB);

subplot(2,1,1);
plot(x, mf1);
hold on
plot(x, NotB);
ylim([0, 1.2]);
legend(['A' 'NotB']);

subplot(2,1,2);
plot(x, NotA_And_NotB);
ylim([0, 1.2]);
legend(['And(A,NotB)']);
