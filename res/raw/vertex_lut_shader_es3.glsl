#version 300 es
precision highp float;

// attribute 替换为 in
layout(location = 0) in vec4 aPosition;
layout(location = 1) in vec2 aTexCoord;

// varying 替换为 out
out highp vec2 vTexCoord;

void main() {
    gl_Position = aPosition;
    vTexCoord = aTexCoord;
}