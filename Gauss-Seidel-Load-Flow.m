clear, clc

y12 = 10-j*20;
y13 = 10-j*30;
y23 = 16-j*32;
y33 = y13+y23;

v1 = 1.05+j*0;
format long
iter = 0;

s2 = -4.0-j*2.5;
p3 = 2;
v2 = 1.0+j*0.0;
vm3 = 1.04;
v3 = 1.04+j*0.0;

disp('iter  v2  s3  v3')
for i = 1:10
    iter = iter+1;
    e2 = v2;
    e3 = v3;

    v2 = (conj(s2)/conj(v2)+y12*v1+y23*v3)/(y12+y23);
    dv2 = v2-e2;

    q3 = -imag(conj(v3)*((y13+y23)*v3-y13*v1-y23*v2));
    s3 = p3+j*q3;

    vc3 = (conj(s3)/conj(v3)+y13*v1+y23*v2)/(y13+y23);
    vi3 = imag(vc3);
    vr3 = sqrt(vm3^2-vi3^2);
    v3 = vr3+j*vi3;

    R = [iter v2 s3 v3];
    disp(R)
end

format short

I12 = y12*(v1-v2);
I21 = -I12;
I13 = y13*(v1-v3);
I31 = -I13;
I23 = y23*(v2-v3);
I32 = -I23;

s12 = v1*conj(I12);
s21 = v2*conj(I21);
s13 = v1*conj(I13);
s31 = v3*conj(I31);
s23 = v2*conj(I23);
s32 = v3*conj(I32);

I1221 = [I12,I21];
I1331 = [I13,I31];
I2332 = [I23,I32];

S1221 = [s12,s21 (s12+s13) s12+s21];
S1331 = [s13,s31 (s31+s32) s13+s31];
S2332 = [s23,s32 (s21+s23) s23+s32];
