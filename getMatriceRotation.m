function rot=getMatriceRotation(anglez)

rot = [ ...
    cos(anglez) -sin(anglez) 0; ...
    sin(anglez) cos(anglez) 0; ...
    0 0 1] ...