%multicam

tic;urlread('http://192.168.3.108:5000/s')
toc
tic;urlread('http://192.168.3.106:5000/s')
toc

tic;ir = imread('http://raspi_ir:5000/static/s.jpg');
toc
tic;
rgb = imread('http://raspi_rgb:5000/static/s.jpg');
toc
 g_rgb = rgb2gray(rgb);
 g_ir = rgb2gray(ir);
 
 bw_rgb = g_rgb>100;
 bw_ir = g_ir>100;
 
 figure;
 subplot(2,1,1);
 imshow(bw_ir);
 
 subplot(2,1,2);
 imshow(bw_rgb);
 irc = im_rst(ir,1,0, 28, 27);
 %375 236 rgb light centre
 %347 209 ir light centre
 %move IR +x 28px +y 27
 ed_rgb = edge(g_rgb);
 ed_ir = edge(g_ir);
 figure; imshow( 0.3*im_rst(ir,1,0, 28, 27)+rgb)
 figure; imshow( im_rst(ir,1,0, 28, 27)+rgb)
 figure;subplot(2,1,1); imshow(edge(g_rgb)); subplot(2,1,2); imshow(edge(g_ir))