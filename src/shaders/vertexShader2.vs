#version 410 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;

out vec2 TexCoords;
out vec3 Fnormal;
out vec3 FragPos;

uniform mat4 model;
uniform mat4 lightSpaceMatrix;
uniform mat3 normalMatrix;

void main()
{
    Fnormal = normalize(normalMatrix * aNormal);
    FragPos = vec3(model * vec4(aPos, 1.0));
    gl_Position = lightSpaceMatrix * model * vec4(aPos, 1.0);
}