step = 0;
obj = new Image();
function anim(xp,xk,smer) //smer = direction
{
obj.style.left = x;
x += step*smer;
if (x>=(xk+xp)/2) {
if (smer == 1) step--;
else step++;
}
else {
if (smer == 1) step++;
else step--;
}
if (x >= xk) {
x = xk;
smer = -1;
}
if (x <= xp) {
x = xp;
smer = 1;
}
// if (smer > 2) smer = 3;
setTimeout('anim('+xp+','+xk+','+smer+')', 50);
}
function moveLR(objID,movingarea_width,c)
{
if (navigator.appName=="Netscape") window_width = window.innerWidth;
else window_width = document.body.offsetWidth;
obj = document.images[objID]; 
image_width = obj.width;
x1 = obj.style.left;
x = Number(x1.substring(0,x1.length-2)); // 30px -> 30
if (c == 0) {
if (movingarea_width == 0) {
right_margin = window_width - image_width;
anim(x,right_margin,1);
}
else {
right_margin = x + movingarea_width - image_width; 
if (movingarea_width < x + image_width) window.alert("No space for moving!");
else anim(x,right_margin,1);
}
}
else {
if (movingarea_width == 0) right_margin = window_width - image_width;
else {
x = Math.round((window_width-movingarea_width)/2);
right_margin = Math.round((window_width+movingarea_width)/2)-image_width;
}
anim(x,right_margin,1);
} 
} 
