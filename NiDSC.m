n_bits = 20;
rows = 1;

%message we want to encode
init_bits = randi([0 1], rows, n_bits);

%tripple bits encoding
triple_bits = repelem(init_bits, 3);

%hamming encoding
n = 7;
k = 4;
A = [ 1 1 1; 1 1 0; 1 0 1; 0 1 1 ];        
G = [ eye(k) A ];
H = [ A' eye(n-k) ];
msg_mtrx = transpose(reshape(init_bits, k, n_bits/k));
hamm_bits_mtrx = mod(msg_mtrx*G, 2);
hamm_bits_vec = hamm_bits_mtrx(:);

%bch encoding
m = 4;
n = 2^m - 1;
k = 5;
bits_k_mtrx = reshape(init_bits, n_bits/k, k);
msgTx = gf(bits_k_mtrx);
bch_encoded = bchenc(msgTx, n, k);

%getting bch bits for array representation
m = 1;
prim_poly = 3;
bch_bits = gf2dec(bch_encoded, m, prim_poly);

%choosing what coding we want to use to transport bits
%data = bch_bits;
%data = hamm_bits_vec;
data = triple_bits;

%bsc channel
probability = 0.3;
ndata = bsc(data, probability);

%decoding triple bits
zeros = 0;
ones = 0;
decoded_data = [];
for bit = ndata
    if bit == 0
        zeros = zeros + 1;
    else 
        ones = ones +1;
    end
    if zeros + ones == 3
        if zeros > ones
            decoded_data = [decoded_data, 0]; %#ok<*AGROW>
        else
            decoded_data = [decoded_data, 1];
        end
        zeros = 0;
        ones = 0;
    end
end
[number, ratio] = biterr(init_bits, decoded_data);

subplot(2, 2, 1);
plot(init_bits);
title("Init bits");

subplot(2, 2, 2);
plot(triple_bits);
title("Triple bits");

subplot(2, 2, 3);
plot(hamm_bits_vec);
title("Hamming bits");

subplot(2, 2, 4);
plot(bch_bits);
title("BCH bits");

%turning gf array to decimal array
function [DecOutput] = gf2dec(GFInput,m,prim_poly)
GFInput = GFInput(:)';% force a row vector
GFRefArray = gf([0:(2^m)-1],m,prim_poly);
for i=1:length(GFInput)
    for k=0:(2^m)-1
        temp = isequal(GFInput(i),GFRefArray(k+1));
        if (temp==1)
            DecOutput(i) = k;
        end
    end
end
end
