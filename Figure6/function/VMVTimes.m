
% Nx x Ny x 4 matrices
% v1' * M * v2
function[C] = VMVTimes(V1,M,V2)
    C = V1(:,:,1) .* M(:,:,1) .* V2(:,:,1) + V1(:,:,1) .* M(:,:,2) .* V2(:,:,2) ...
      + V1(:,:,2) .* M(:,:,3) .* V2(:,:,1) + V1(:,:,2) .* M(:,:,4) .* V2(:,:,2);
end