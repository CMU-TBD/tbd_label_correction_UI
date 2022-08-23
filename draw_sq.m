function [rst] = draw_sq(frame, cd, color, width)

    cd = round(cd);
    
    ws = round(width / 2);
    window_r = max(cd(2)-ws, 1):min(cd(2)+ws, 1024);
    window_c = max(cd(1)-ws, 1):min(cd(1)+ws, 1280);
    mask = zeros(length(window_r), length(window_c), 3);
    mask(:, :, 1) = zeros(length(window_r), length(window_c)) + color(1);
    mask(:, :, 2) = zeros(length(window_r), length(window_c)) + color(2);
    mask(:, :, 3) = zeros(length(window_r), length(window_c)) + color(3);
    frame(window_r, window_c, :) = mask;
    rst = frame;
    
end

