void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord.xy / iResolution.xy;
    
    // Only mirror if the window is NOT focused
    // iFocus is 1 when focused, 0 when blurred
    if (iFocus == 0) {
        uv.x = 1.0 - uv.x;
    }
    
    fragColor = texture(iChannel0, uv);
}
