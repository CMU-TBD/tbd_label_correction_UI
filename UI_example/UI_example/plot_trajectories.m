function [] = plot_trajectories(vid_name, trajectories, traj_starts)
    v_read = VideoReader(vid_name);
    v_write = VideoWriter("detected_trajectories.avi");
    open(v_write);
    vid_idx = 0;
    num_ped = length(trajectories);
    
    colors = [255, 255, 255; 
              0,   255, 255; 
              255, 0,   255; 
              255, 255, 0; 
              255, 0,   0; 
              0,   255, 0; 
              0,   0,   255];
    num_colors = size(colors, 1);

    while hasFrame(v_read)
        frame = readFrame(v_read);
        vid_idx = vid_idx + 1;       

        for i = 1:num_ped
            if (vid_idx >= traj_starts{i}) && (vid_idx < (traj_starts{i} + size(trajectories{i}, 1)))
                pt = trajectories{i}(vid_idx - traj_starts{i} + 1, :);
                frame = insertText(frame, pt, num2str(i));
                for j = traj_starts{i}:vid_idx
                    frame = draw_sq(frame, trajectories{i}(j - traj_starts{i} + 1, :), colors(mod(i, num_colors) + 1, :), 6);
                end
            end
        end
        writeVideo(v_write, frame);
    end

    close(v_write);
end

