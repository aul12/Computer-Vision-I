%% Part a
N = 4;
ti = [0 1/30 2/30 3/30];
si = [2 3 0 1];

S = zeros(size(ti));
f = zeros(size(ti));

for u=1:N
    for t=0:(N-1)
        S(u) += si(t+1) * exp(-2*pi*i*u/N*t);
    end;
    f(u) = 2*pi*u/N;
end;
S ./= sqrt(N);

%% Part b
x = 0:0.01:1;
y = sin(2*pi*x*1/N*3);
figure();
plot(x,y);
title("A sine-wave with the frequency of S(3)");
xlabel("t");
ylabel("y(t)");
print("frequency.eps", "-depsc");

%% Part c
sr = zeros(size(ti));
for u=1:N
    for t=0:(N-1)
        sr(u) += S(t+1) * exp(2*pi*i*u/N*t);
    end;
end;
sr ./= sqrt(N);

%% Part d
figure();
subplot(3,1,1);
plot(ti,si);
xlabel("t");
ylabel("s_i(t)");
subplot(3,1,2);
plot(f,S);
xlabel("f");
ylabel("S(f)");
subplot(3,1,3);
plot(ti,sr);
xlabel("t");
ylabel("s_r(t)");
print("transforms.eps", "-depsc");