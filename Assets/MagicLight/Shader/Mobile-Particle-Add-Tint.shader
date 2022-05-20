//modified Mobile Particle Additive. Added Tint color.

Shader "Custom/MobileParticlesAdditiveTint" {
Properties {
    _MainTex ("Particle Texture", 2D) = "gray" {}
	_TintColor("Tint Color", Color) = (0.5, 0.5, 0.5, 0.5)
}

Category {
    Tags { "Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" "PreviewType"="Plane" }
    Blend SrcAlpha One
    Cull Off Lighting Off ZWrite Off Fog { Color (0,0,0,0) }

    BindChannels {
        Bind "Color", color
        Bind "Vertex", vertex
        Bind "TexCoord", texcoord
    }

    SubShader {
        Pass {
            SetTexture [_MainTex] {
                combine texture * primary
            }
			SetTexture [_MainTex] {
				constantColor[_TintColor]
				combine previous * constant
			}
        }
    }
}
}
