function R=PCNN_zhu(matrix,Para)

iteration_times=Para.iterTimes;
alpha_f=Para.alpha_f;
alpha_e=Para.alpha_e ;
lambda=Para.lambda;
V_E=Para.V_e;

% Initialize the PA-PCNN model
[p,q]=size(matrix);
F=abs(matrix);

U=zeros(p,q);
Y=zeros(p,q);
T=zeros(p,q);
E=ones(p,q);

% synaptic weights.
W=[0.5 1 0.5;1 0 1;0.5 1 0.5];

for n=1:iteration_times
    K = conv2(Y,W,'same');
    U = exp(-alpha_f) * U + F .* (1 + lambda * (K));
    Y = im2double( U > E );
    E = exp(-alpha_e) * E + V_E * Y;
    T = T + Y;
end
R = T;
end