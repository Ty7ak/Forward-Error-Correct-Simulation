n_bits = 20;
rows = 1;

init_bits = randi([0 1], rows, n_bits);

triple_bits = repelem(init_bits, 3);

n = 7;
k = 4;
A = [ 1 1 1; 1 1 0; 1 0 1; 0 1 1 ];        
G = [ eye(k) A ];
H = [ A' eye(n-k) ];
msg_mtrx = transpose(reshape(init_bits, 4, n_bits/4));
hamm_bits_mtrx = mod(msg_mtrx*G, 2);
hamm_bits_vec = hamm_bits_mtrx(:);

m = 4;
n = 2^m - 1;
k = 5;
bits_k_mtrx = reshape(init_bits, n_bits/k, k);
disp(bits_k_mtrx);
msgTx = gf(init_bits);
%bch_bits = bchenc(msgTx, n, k);

%disp(triple_bits);
%disp(init_bits);
%disp(hamm_bits_mtrx);
%disp(hamm_bits_vec);

subplot(2, 2, 1);
plot(init_bits);
title("Init bits");

subplot(2, 2, 2);
plot(triple_bits);
title("Triple bits");

subplot(2, 2, 3);
plot(hamm_bits_vec);
title("Hamming bits");

%subplot(2, 2, 4);
%plot(bch_bits);
%title("BCH bits");




