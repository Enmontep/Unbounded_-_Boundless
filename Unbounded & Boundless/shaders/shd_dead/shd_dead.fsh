//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 color = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
	color.a = color.a - 0.75; 
    gl_FragColor = color;
}
