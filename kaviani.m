% Read the image
img = imread('your_image.jpg');

% Display the original image
figure;
subplot(1, 2, 1);
imshow(img);
title('Original Image');

% Get the rotation angle from the user
angle = input('Enter the rotation angle (in degrees): ');

% Convert the angle to radians
theta = deg2rad(angle);

% Define the rotation matrix
R = [cos(theta) -sin(theta); sin(theta) cos(theta)];

% Get the size of the image
[rows, cols, ~] = size(img);

% Create a blank image for the rotated image
rotated_img = uint8(zeros(rows, cols, 3));

% Perform the rotation without using any built-in functions
for i = 1:rows
    for j = 1:cols
        % Apply the rotation matrix to each pixel
        rotated_coords = R * [i - rows/2; j - cols/2] + [rows/2; cols/2];
        
        % Round the rotated coordinates
        x = round(rotated_coords(1));
        y = round(rotated_coords(2));
        
        % Check if the new coordinates are within the image boundaries
        if x >= 1 && x <= rows && y >= 1 && y <= cols
            rotated_img(i, j, :) = img(x, y, :);
        end
    end
end

% Display the rotated image
subplot(1, 2, 2);
imshow(rotated_img);
title('Rotated Image');