pico-8 cartridge//http://www.pico-8.com
version 8
__lua__
--ld39 toy project
--copyright(c)2017 sam hocevar<sam@hocevar.net>
image_list={
{file="data/background.png",w=128,h=96,tolerance=62200,scroll=true},
{file="data/owl-indexed.png",w=512,h=88,tolerance=10000},
{file="data/owl-power.png",w=512,h=120,tolerance=200000},
{file="data/water-transposed.png",w=1920,h=32,tolerance=2000,scroll=true},
{file="data/mountains.png",w=288,h=48,tolerance=2000,scroll=true},
{file="data/trees.png",w=336,h=128,tolerance=60000,scroll=true},
}
background=image_list[1]
water=image_list[4]
mountains=image_list[5]
trees=image_list[6]
facts={}
global_rom={
[0]=
0x7af.e3d5,0x53ab.52a5,0x5af9.27ed,0x88d9.07c6,0xaa96.3cd8,0x699d.72a1,
0x8af4.05ed,0xf438.48c6,0x83e3.2c21,0x27dd.110e,0x5367.94cd,0x7dd1.2bd5,
0xd42f.a07f,0x6527.c169,0x5c2d.2bb6,0x4e0c.4b1d,0xbc2.1c59,0x4639.12c3,
0xac57.e1a7,0x9bdf.f48e,0x20b2.2a46,0x5f7d.64b1,0x14c2.9e4e,0xed24.90a6,
0xfe9f.ebcf,0x317f.df6e,0x841f.9be9,0x13f3.fb9,0x2139.33e2,0x9f9d.2083,
0x49c5.9f14,0xed04.1c5f,0xb7f9.f9f9,0x313a.bd93,0xc348.0363,0xcf87.7dd1,
0xb513.44fc,0x9c24.2627,0x7e67.4025,0xee7c.627e,0x8062.fa4f,0x473b.7dce,
0x9f99.d09b,0x2152.4ec4,0x7b0e.9da4,0xfdc.0074,0x7c64.5f16,0x5483.d026,
0x33a8.bb19,0xa59e.c7b6,0x1efe.2e1d,0xdb63.08f8,0xa351.126e,0x73a3.63fb,
0xfefc.5c3f,0x36f3.e2fb,0x844c.dfb9,0xfd67.a9e5,0x6324.2268,0x4fcf.8b32,
0x5e68.8f8c,0x3b65.deea,0x8296.4763,0xe8a6.8d46,0xd265.c5f9,0x3856.ec09,
0x5a02.ef0b,0x8e64.754d,0x3447.f749,0x7e3e.3cbc,0x99f1.b1d2,0xfd9a.80f7,
0xfb99.1d56,0x6d8b.4471,0xfb69.f0e7,0x7835.c739,0x4900.6af3,0xb0e5.d13f,
0xd174.7b98,0x2b2.33cf,0xdf6f.4851,0xe845.47ef,0xee03.5d1a,0x8b3e.01df,
0x866f.722f,0x5925.42f,0x73a0.ebf4,0xdf34.efa,0x86b7.9f03,0x8cf8.41b2,
0xe77d.21c,0xcf8f.336d,0xe186.06c8,0xc743.2d26,0xb60f.03e2,0xde49.7207,
0x4213.cf69,0xe2a3.eb96,0x4edf.3f33,0xba01.d1cb,0x4969.94cc,0xf10e.d246,
0x58f9.6459,0x4f8e.8fae,0x3cd0.eea9,0xa59a.f2de,0x62fd.d5a9,0x233c.ec7c,
0xa25b.bc1a,0x1f08.7754,0x7c5b.ee8f,0xcc72.28b2,0x5cf4.5ccb,0x2a23.3e11,
0xe6.60f4,0x2ae8.7d3e,0x27fb.3ea5,0xfbc9.f47c,0xa88c.f805,0x69f1.43d,
0xe361.5df6,0x3424.ca71,0xb818.4a53,0xfa7c.3ed4,0x193d.a814,0x2e0b.6f3e,
0x534d.4201,0x14c2.5036,0x9f1f.b23,0x162d.02bc,0x7c50.ea9a,0x7b16.008a,
0x79f1.6f3b,0x8038.8f91,0x5f8a.ee73,0xdbc1.9d94,0x2b06.8402,0xe5bc.0973,
0x7c5a.deb5,0xc5b9.3372,0x497a.b472,0x47ee.0b89,0xe8c.2ca8,0xa52b.5901,
0x3160.547f,0x5082.9b7,0x92ff.3f7a,0x919b.6f15,0x4f6.03be,0x7485.bd6b,
0xc03c.4dcd,0xf0bc.32a7,0x4ce5.be8b,0xcd7.bdd2,0xe864.c7fc,0xe484.d084,
0xf3ed.40a,0xce05.d22,0xdf6f.f628,0x177e.8a06,0x951d.bcf8,0xfe4e.8cc9,
0x89b4.2b71,0x2852.6bcc,0x423c.b4cb,0x7d8.69a5,0x2b65.1781,0x98fa.cd1a,
0x18c.b6f,0x2a3f.f1ea,0x2540.a03a,0x6e8b.780c,0x33a3.63e3,0x3829.c03f,
0x2fa1.31b7,0xe818.0f7c,0x73ee.f214,0xbaf8.530a,0x8784.b9c1,0x6e1e.8fc7,
0x1f74.bc6e,0x6d9e.cf,0xedf9.bb7c,0x3cfb.9cd1,0xafee.7b82,0x5529.fd97,
0x12f2.b2b2,0xa5f0.4f9f,0xaee6.ba63,0x87fa.3dcc,0x7ccb.97e5,0x8117.af99,
0x9efe.027d,0x48f0.8679,0x15d.d361,0xdc3c.1cbc,0x3b1e.57a4,0xa6e7.bd98,
0x7c7d.593f,0xe46.8e6f,0x9bf0.dce6,0xdcf7.b397,0xd7fa.f7b2,0xc5fe.6871,
0xff83.3c01,0x818.f0ff,0x8fd.af72,0x4bba.cc18,0x445.6bb3,0x784d.6626,
0xc2de.7e8a,0x96d6.4f15,0x845c.d31f,0x6a7a.63c3,0x338.966e,0x1e39.1d04,
0x111f.95b8,0x500c.404d,0xba6c.6ee1,0xf61f.8fff,0x38ec.b961,0xf99d.a8ee,
0x9036.f707,0xe28f.4cbc,0xbdc7.f0eb,0x4dce.59b2,0x5d1e.199a,0xe06e.d666,
0xb7c3.f882,0x9c6a.cccb,0x2ab2.0708,0x807f.801,0x7667.f035,0x3209.4136,
0xed96.b797,0x41f1.2f1a,0xcf1.d044,0x3f07.bafe,0x25dc.55af,0x4c09.cbe,
0x500c.b2b5,0x106.e78a,0xaeb.8d4c,0xe42d.f13b,0x1578.4a28,0x28aa.7307,
0xf56.510f,0xab91.5551,0x5243.d1c9,0xe5fb.fe16,0xfe0c.b851,0x4168.10fd,
0x6d0e.8001,0xfe7d.44bd,0x9a28.090f,0xbe25.e59b,0xd154.cc5b,0xaffe.87ec,
0x31c8.9c19,0xcfc.add3,0xd241.bae5,0x24bc.b961,0x4059.223e,0x837a.8246,
0x35d0.acc4,0x42df.4fe4,0xcb32.b1f8,0x12af.8ab,0x9772.30fe,0xeff3.bd5,
0x1312.7619,0x1168.9d89,0x3c0f.d132,0xb841.0e01,0xb010.1a42,0xe203.cccc,
0x9c2f.408e,0x1942.3fb9,0x976d.806c,0x9211.dae9,0x823a.ab8d,0xac3b.d0b7,
0x8624.da3c,0xb8f.6f,0x8316.14d5,0x1139.e1c9,0xbc58.8ce6,0x4b98.109b,
0x4703.6763,0xd065.92cc,0x670c.520c,0x7222.b8a2,0x9caa.681,0x8df1.adcc,
0xe632.c8a4,0xc473.819,0x97a.3709,0x2a29.ba88,0x1a76.3c73,0x8dcf.c258,
0xd244.5413,0x40c3.0dc2,0xead.2c62,0x3813.4c1a,0xd766.3945,0xe3fe.50e9,
0x2f49.1fd6,0x90ac.9e9c,0x8d40.d803,0x34a3.762d,0xbfbb.11c3,0xb974.1995,
0x92c7.510f,0x197f.3287,0x41c9.373f,0x1ae2.6e6e,0x5984.8a6e,0x5e05.7c49,
0xda4a.33e3,0x90f9.e40f,0x948.c796,0x14fe.4a12,0x5a68.1414,0x6e86.f72e,
0x3e28.e45d,0x1e74.0c03,0x5e19.5677,0x35e3.def8,0x92b1.1be2,0xd8f2.4c5d,
0xd03b.29e8,0x9ea2.c7b5,0x8ffc.168e,0xd0c.8574,0x8258.18ad,0x3a21.ed7e,
0x2452.95c7,0xb039.8161,0x97cd.b076,0xf791.c538,0xc65.1b0f,0x8f8d.2f25,
0x55ec.cfe3,0xe2cb.9f85,0xc09d.8549,0xb0b5.65ab,0xfa0d.d9d9,0xad9.bc0f,
0x32ca.ef19,0xd87e.9c05,0x3741.58d8,0xc703.0739,0xc013.e012,0x3be6.00dc,
0xd8f5.e09b,0x13e7.e9b2,0xb21a.5b52,0x3ea7.b833,0x3404.4d18,0x3ff.1ff1,
0xb23.a4aa,0x919.05b4,0x95f5.1c1e,0x5f31.423d,0xa31c.ae5e,0x9032.21b,
0x1ccd.6eb2,0xbe1a.3c15,0xeb76.0c76,0xfe86.0488,0xfcc9.7a4,0x7e11.9adc,
0xc9b3.3e6e,0xf91a.eac3,0x6911.3f94,0x9ca4.2727,0x848b.d3f,0xada4.4bb8,
0xa209.3116,0x45b2.bc33,0x67d2.24fc,0x600c.1e0b,0x557e.d483,0xbb31.e16c,
0x5c41.fa49,0x267c.0532,0x2523.9d0c,0x5d14.cb4b,0xfd82.7dc,0x1c38.a301,
0x171e.31a1,0x1a50.1705,0x8f2b.94f,0x9867.f97,0x6763.0d7e,0xa1ef.71c2,
0x4fd2.6e7a,0x3a9a.f48e,0xf680.9b2d,0xcc09.f1f2,0x41fa.88ef,0x3005.ed2c,
0x57c6.2913,0xf3ba.4fff,0x31e0.9143,0xf985.3968,0x2e60.2fdd,0x8eb9.c7f,
0x583a.5861,0x7649.bf11,0x235c.fc4,0x9d0b.778b,0xbc78.2bb,0xb2e1.23ec,
0x419c.07d,0xb75a.22dd,0xf26.169,0x4d8f.b34d,0x52.f7ce,0x5d34.0a21,
0x9f89.1b99,0x84d.3fe4,0x4929.444a,0x761c.8369,0x612e.6e65,0x8234.02d7,
0x71a4.2456,0xcfb5.803f,0xc0bd.e37d,0x427.bcbd,0xa5ad.45b3,0xdd5c.401c,
0xacae.7808,0x8ac1.5672,0xf98f.e648,0x1ce5.5ea6,0x16e5.372e,0x2808.50fb,
0x2273.029,0x1e47.39b3,0x396f.a10e,0x79a2.67e4,0x972.d6f8,0x17ae.fd8a,
0x1242.9275,0x9919.e879,0xf8dc.4365,0x49.6156,0x1679.0a79,0xef97.9f48,
0x7274.c271,0xc93d.1ca2,0x31b7.05af,0x78f.22bd,0x7990.aca1,0xe634.f91b,
0x2211.26b1,0x9b1a.c7ab,0xd57c.2a1,0xa63a.2768,0xad0.5623,0x3fe4.3c24,
0x3703.4821,0x76a2.91c1,0xb9f9.e4ce,0xa688.ea41,0x180d.590a,0xfb3.dead,
0x1b7a.d5a2,0xfff2.5614,0x37e0.e47f,0x99fd.3123,0xcf33.4ba4,0x4a78.1cac,
0x9e13.b934,0xd311.4c88,0xd0cf.59f4,0x7272.8e7e,0xfd17.6e82,0x313f.2145,
0x22b.b5c5,0x8cb4.925,0xb651.3d2c,0xf3f5.48e2,0x16c9.3724,0x79a5.3e79,
0x1105.7d13,0xb921.b478,0x1190.795,0xd329.1c1e,0x349c.265e,0x673a.af1e,
0xcba4.11ba,0x14dc.a4be,0xd991.fdfe,0x48fe.1a87,0xa010.3ead,0xfa39.da33,
0xaa1b.5249,0x8464.2a53,0x4b7d.1227,0x23de.0f94,0xcc87.c386,0x427.3c79,
0x76ec.c4bf,0xe702.a8c5,0x252e.159c,0xd10e.f24d,0x65ae.2a07,0x2ac1.9df6,
0xd448.ff1b,0x491e.3332,0x614c.be46,0x7bca.eb17,0x19e5.81a8,0xbd08.7ba8,
0x285c.b0bb,0xe92a.82de,0x15db.b438,0x8936.88a9,0x933e.df97,0x8566.73ac,
0x9a57.1362,0x926.419b,0x2789.03e1,0x2130.d77a,0x13ee.b0c7,0xe762.45a8,
0x2b9a.195c,0x1397.c0ab,0xf5f1.04ff,0x2e3a.c531,0xb4db.44c,0x9e86.074,
0x63df.95b,0xa337.27f5,0x1ac.d4ce,0xafd3.00da,0xe2c0.ac8,0x887d.02b1,
0xea50.cdc4,0x8f5.5102,0x9e09.6add,0x10e6.8e8f,0x2851.39b5,0x7b0a.e947,
0xd071.1743,0x7945.97ae,0xc104.d2b9,0x86e.4e93,0x2da5.f143,0xd0e5.dbd1,
0x8be.4277,0xf4e6.008a,0x8d60.7598,0xd68.b9e3,0x66b0.11e9,0x5f49.50a5,
0x2d38.a63e,0x1f5b.1278,0x865e.dc53,0xb9e4.094a,0x3c37.374a,0xab36.126,
0xe541.2801,0x6a1e.1a93,0xd068.50a3,0x8922.c0be,0x582b.229a,0x7e26.3a05,
0xf7bc.ec8b,0xa9de.2d1,0xd470.3c1a,0xec98.f46f,0x1a2d.56a3,0xc5d5.527e,
0xbbf8.119e,0x8b15.de45,0x1c49.722e,0x74fa.5fd8,0x7cda.e749,0x7bb5.2a14,
0x13a1.0b0f,0x925b.71f4,0x9874.624a,0x92e7.5b03,0x26bf.213a,0x9f8f.a6ee,
0x8fa3.1f8f,0x84fc.b59c,0x9f21.5578,0x5f2e.1908,0x2673.615e,0x9771.494c,
0xe49.3d45,0xf4e5.3e9c,0x8b63.7413,0xa8ce.143b,0x1047.b251,0xd114.9c5f,
0x463.81bd,0x51eb.a80a,0x4c28.8f04,0xd29.e483,0x3190.abc5,0xe933.c3fc,
0xf3ac.71fb,0xade9.26a5,0x7b26.06a4,0x52b4.ecf,0xd05.4a87,0x78aa.8b74,
0xca07.fca2,0x610c.3428,0x3916.6e67,0xa78f.d736,0x9db0.94cb,0x97be.3d84,
0x3752.f2ac,0xb8e6.cdce,0x3ad5.ccbc,0x9f13.a305,0x1874.caf7,0x13fe.72ae,
0xc3a8.e499,0xa58c.7ce8,0x2c82.e027,0xe4d1.d404,0xc4bf.e231,0x40b8.fe3a,
0x7c63.293f,0xb5a2.6c94,0x33d9.811e,0xbc9e.60cb,0xdf12.3f46,0x5589.560c,
0x587b.3e5a,0xc1ad.2931,0x81fd.e91d,0x2c6c.656a,0x7404.ff91,0x124f.4149,
0xefc.89ee,0x2687.3695,0x21eb.3b18,0x9b58.497b,0x7b91.5963,0x473c.9a7,
0x9e85.6ec1,0x1ecf.eb9f,0xb9a.e3c8,0x2da3.e8f,0x6c47.a656,0x80df.d0a,
0x3da9.0d1,0x3724.7a12,0x53e6.5eb7,0xb626.e449,0xd2aa.5ea,0x59f4.7b71,
0xe80.4661,0x8784.aa92,0xf4ce.b29c,0xaae7.db3f,0xd3d2.2e91,0xa102.4a2d,
0xb1ff.0133,0x4a3a.42f5,0x7b77.4ccd,0xe5cd.cf2e,0x5f1a.a935,0x531e.9312,
0x6d72.f42a,0x851b.2cae,0x1525.f5da,0x9d61.90b6,0xc4ec.fd24,0xdeff.3af2,
0x427a.5491,0x2bb.b1e7,0x726c.f908,0x266f.f585,0xd083.d59f,0x98c1.5cb1,
0xe74a.85b2,0xb9ea.8b34,0x174c.c062,0x52e0.025b,0xfe99.a16,0xd3c8.8b79,
0x28ac.cece,0x131d.8515,0x440d.b85d,0xcbc.d51e,0x6ea4.3989,0xe2a5.5827,
0x73a8.7353,0xd9e5.735b,0x2643.d5,0x6e4d.2da7,0xc263.400d,0x51c9.b591,
0x41d7.1ee8,0x2761.75c,0xe1a9.c04a,0x41c6.a166,0xba0b.6f57,0x9b5c.47a,
0x7095.3d42,0x2e04.55de,0x7dc4.d169,0xb99d.0a0b,0x73f0.a367,0xe89c.3a0d,
0x6cf6.391b,0x7122.6681,0x6bf0.11cc,0x8361.3d5,0x27cf.24e7,0xd04e.e14e,
0x568f.3069,0xd652.b7b1,0x3b43.5ddc,0x2855.254,0xe4f3.6628,0x2f80.5731,
0x67bd.e248,0x623a.1fdc,0x35d8.264e,0x6070.92e6,0x81f3.08e7,0x4263.6c23,
0x5aca.70f4,0xaecb.b4f4,0xe90d.8ffe,0x181d.a07b,0xeb64.0e7e,0x1ad0.39cb,
0x3eb9.adcc,0xe6e0.bc49,0x6467.031,0x8373.c8a8,0xf4c3.9e68,0x8e78.0e7f,
0xca89.6b69,0xf8a8.9339,0x218a.bc06,0x5bdd.b101,0xb180.3c7d,0x2a20.118e,
0x308f.d52e,0x3cbf.bb12,0xd509.1b52,0x6c3d.454a,0x69c7.4e0f,0x9384.af0b,
0xd4f0.6004,0x73f6.1672,0xdd02.0605,0x21c9.2a38,0xa15c.62b8,0xf223.84ba,
0xc84f.0e49,0xd6f0.4e53,0x5967.3c6,0xcacf.181,0x5537.b201,0x1ff8.314d,
0x5645.153,0x150f.ce97,0xa6e8.86e3,0x473.0ae8,0xdb08.e8cd,0x3ac3.9bee,
0x951f.5a32,0x6c20.906f,0x1d1c.ac6c,0xe199.73b1,0x99a2.957a,0xc1a4.a45b,
0x7982.b73e,0xe7e2.f622,0x32dd.a84c,0x614b.3f46,0xcac.1869,0xa68a.8271,
0xaed.9ae3,0x12d8.aac,0x295a.cf61,0x22b6.0778,0x9513.2771,0xfc3d.3033,
0x623b.891b,0x8114.308f,0x244f.8da1,0x24b.b1e7,0x626c.b9c,0x5945.bfc6,
0x3c0f.6f04,0x3f5c.692c,0x2d89.bdc6,0x209c.e8e8,0x48be.4179,0x9581.1c5c,
0xfb1a.06f4,0x37b8.d85,0xe779.dd2b,0x4322.5e1e,0xfd11.5c2b,0xba2d.b65,
0x740b.d9a5,0x4866.8fc6,0x916c.9063,0x34b8.8562,0xc008.32c8,0x739a.8b68,
0x863c.ac21,0x87b8.8eb5,0x86c9.b5b2,0x8c59.10fe,0xf91.4c59,0x7950.2105,
0x9c9d.6402,0x271d.3f08,0xd547.2559,0xfc5a.84ba,0x4da2.0943,0xfc0f.692a,
0x6964.fcc,0x302a.a862,0xb8c7.95f8,0x6095.b98d,0x621f.840d,0xc8cc.2bb4,
0xabc8.90ca,0x658b.373,0x8630.c6cb,0x836e.8362,0x3d8c.77b9,0xa01a.67fd,
0xd6fa.8a8e,0x63d1.98,0x13c2.d8f,0xffde.1508,0xe79.4d82,0xe9e2.231b,
0xcef5.49f8,0x3bbe.f95a,0xdb22.e8ae,0x570b.6f06,0x807d.5158,0x9038.a1fa,
0xbcee.6161,0x47a4.96e6,0x682b.b364,0x8e6c.548a,0x7300.c464,0x295c.8bd,
0x8210.ff38,0x3c2d.8933,0x5b44.71,0x6ebe.949b,0xb96e.db7,0x215a.7538,
0xa631.cd8e,0xd6d8.d98f,0x911c.28a4,0xd6b7.8f99,0x3a66.cb1e,0xa203.f296,
0x2c3d.c6f4,0x386e.b135,0x2862.5661,0xb167.fea4,0x7d66.411d,0x33fa.d584,
0x3f23.25ea,0x318.9d85,0xdf14.4247,0xdf28.d2c,0x6e03.eba,0xa8e3.21d6,
0x2836.92bc,0x6f17.76ee,0xa05e.93d9,0xe70.c3b1,0xe034.1183,0x7dfd.bc2a,
0x10d4.e982,0x3f79.5724,0xda44.87e8,0x49d2.83c4,0x8bb2.1fa7,0xb37e.2b3a,
0x7d45.8c42,0x63f8.322d,0x5c47.9f74,0x7a61.6d39,0x4474.2acf,0x95cd.c86d,
0x5a14.1451,0xcba4.cfa6,0xc88e.d83e,0xa328.57e,0x7a0c.f285,0x9ba7.a029,
0x430a.a614,0xea32.4bfc,0x4be7.e439,0xa3b0.89cc,0x5f17.3101,0x887a.3ac,
0x4523.53cd,0x34f1.7ff7,0xf94c.10ce,0x87a2.42b8,0x4ffc.c441,0xa6f7.8ae6,
0xc3b9.b8b7,0xed9b.42da,0x19d1.4098,0x6fce.270f,0x5586.b68f,0x9ae.6883,
0x71e1.266e,0xd921.e3a6,0x6825.16c,0x5789.b447,0x23f8.8de1,0x2fd.8c09,
0x245b.9d81,0x17da.8e6a,0x30d7.ec1,0xeae6.5a81,0x2ec.8471,0xc7ac.2cf3,
0xcc9e.39d1,0xd8ba.f70e,0x3067.e10b,0xb0b4.5776,0xab78.a1fa,0x340a.3c1f,
0x3e31.3184,0x2fa8.a242,0x9eb3.4789,0x6f07.511d,0x2e1b.a608,0xcc99.049f,
0x3b8b.0651,0x315e.4328,0xaf9d.81aa,0xeea2.7267,0xc035.7159,0xf8b2.9651,
0xb89b.750a,0x1ed1.0687,0x7c11.f493,0x32c2.49d3,0xd4c6.a399,0xa281.4988,
0x8afa.4cb,0x8ce2.f9dd,0x2da3.aa1e,0x37f0.eb8e,0x9e96.bc18,0x1f38.b0cf,
0x6101.407a,0xa8eb.9485,0xc232.eba,0xbea4.7f7b,0x4518.660c,0xf599.8dba,
0xb40a.d709,0x91cc.8d99,0x35b2.7b58,0x9613.431a,0x460f.1cc6,0xe512.0b4d,
0x735f.d627,0x5243.3283,0xb38a.5a2e,0xe1e7.384d,0xa2a3.b26a,0x4029.549e,
0x26b8.3ab1,0x170a.842d,0x56c3.2712,0x8a49.e702,0xa749.f15f,0x2fa3.f664,
0x18de.e5bc,0xc035.5d39,0xa510.db39,0xc028.3c66,0x8b02.474b,0x8fa8.ee29,
0xe02c.4fcc,0x4fc7.0027,0x7828.e962,0x6bc1.889e,0x199c.29b5,0xcfc8.4199,
0x8cad.10c9,0x4551.9c96,0x5b31.3f09,0x1a3f.8b31,0x4999.cf1b,0xb436.7cf1,
0x9a80.a57b,0xf52b.35b5,0x9604.c9d1,0x5f1c.fc8b,0xbe9e.1d3f,0x4d14.3071,
0x1550.4d54,0x9423.a471,0x7b00.3998,0x2b45.449f,0x2a6a.46cf,0x4b69.cc13,
0x8e74.d459,0xa1cc.8cef,0x7c15.68ca,0xcec8.9e01,0xb9c6.4ad1,0x86b0.7f2d,
0x4156.c29b,0x8a9d.d147,0xe2e3.ff56,0x362d.4639,0xc2c2.1be7,0x8b40.e34f,
0x307d.3e9a,0x2115.8aa2,0x3a82.ba3a,0x6a5d.098e,0x341f.44f5,0x89e8.8e97,
0xb5c5.b081,0x7e78.04c1,0x187e.11ab,0xd399.438,0xbdb.1ced,0xa6d0.f1d1,
0x3b32.a55d,0xd04c.d841,0x831b.3e81,0x53c2.5b9f,0xd623.e8d5,0x4315.0855,
0xe7a9.cf45,0x8b7e.8844,0x93c2.3f06,0x6edd.4fc4,0xf270.abe4,0x7e76.9a8e,
0x261c.b743,0xd1ad.cfd6,0x979.13d5,0x69f0.a8dc,0xd615.860d,0x98e6.91b8,
0x61bd.3d5,0xe7e4.070c,0x950c.225c,0x468f.c7ab,0x5b27.9ef7,0xbded.8995,
0x6e7a.ba32,0xa46d.e089,0x4741.871d,0x7373.f393,0xc40e.f8f4,0x8a9f.c1cc,
0x62c.6ca5,0x71cf.ce4d,0x331c.e7dc,0xf1c1.7acf,0x9b3.f5c2,0x1955.b9f9,
0x3e93.936d,0xcdad.e4e6,0xc7de.de47,0x2d90.7328,0x3cad.c523,0x1a8f.b9b,
0xbf33.a5df,0xd31b.29e9,0x8d26.5621,0xcffb.a3ef,0xb7cc.f744,0x1b8c.aabc,
0x9f8f.de5f,0x8adf.7ae3,0xbeae.3692,0xd14f.c84d,0xcf05.51cf,0xc6ca.796f,
0xcb44.ced2,0xf841.71ab,0xa8bb.ae39,0x773c.50cc,0xcfcd.8df4,0x4c25.f2c9,
0x14c6.67e8,0x63a0.e687,0x752.6733,0xc63d.f7ea,0x85b4.9d78,0xadd8.e8bd,
0xc9f9.09a2,0xc98.fd09,0xac77.e8ad,0xf989.83c6,0xe347.9ba9,0xbf31.0bf8,
0x4993.b1b9,0x77dc.7378,0x9723.82fc,0x2ea4.029c,0x9521.8f03,0x740e.64c,
0x189c.12ab,0x473d.e319,0xbd04.c9dc,0xd09.ad8d,0x2e85.42be,0x871c.5d1c,
0x9455.15a1,0x993f.2571,0xda29.7503,0x7524.fc24,0x306f.c649,0x18c1.a905,
0x6670.018,0xbc93.1e8c,0x971c.fca7,0x73f1.1339,0x3fae.382b,0xab54.72d6,
0xdf83.247c,0x3339.daf2,0x58b9.4316,0x457b.1b99,0x66c7.40cc,0x5523.44a8,
0x9c46.1fd,0x85ce.8b62,0xaf6a.d24d,0xc502.ed8c,0x1f8c.6a7b,0xe2f7.8a63,
0x6521.58e7,0x9b46.18b6,0x6c7e.0d43,0xa433.1ad8,0xf30.8f68,0x7a4e.bda3,
0x7867.4932,0x94bc.accc,0x41cd.239f,0x2ad2.4e54,0xfd1e.cd22,0xf7cc.e979,
0xdbd2.37ff,0x8027.df14,0xb02e.78ca,0xcda3.9d94,0xfc5e.f331,0x176b.a31c,
0xd8c8.64a8,0x8c74.3411,0x57b0.d9ee,0xed.db07,0x4952.ce76,0x67f5.f831,
0x3354.c7cf,0x38d4.8d05,0xb4e0.e0cf,0x374c.bcf5,0xcfe7.bff9,0x61c4.0f9f,
0xa47e.32ae,0x987d.b595,0xa472.a4a6,0x5200.8b67,0x7cfc.618c,0xccd1.f5ce,
0x2d55.3cd8,0x5830.0e7b,0xca57.9ecb,0xf294.279c,0xd780.c134,0xca95.9b91,
0xacf5.3c64,0x7af4.184,0x8727.2065,0x95b.0fbd,0x319a.91cf,0x203c.c8b6,
0xcf15.893f,0x9a8d.bf07,0x6ea1.a25c,0x8061.4279,0x4628.8f38,0x1a7f.2a57,
0xe2d8.35fc,0x2c12.49c5,0xacfc.818d,0x1629.4ee4,0x5bdc.b3b1,0xa219.d1cc,
0x7958.cfe7,0x7850.d5c6,0x3cbf.1ef3,0xf0b7.3d5,0x7ef3.cab1,0x9f57.89bf,
0xdfcb.4713,0xe5d.9b9f,0xc2f1.c1d3,0x4ac8.cff5,0xabf9.69e5,0x4e7e.b42c,
0xfccc.acfe,0x3982.7cb9,0xa0ce.08e4,0xc12b.1d0c,0x37d7.a0de,0x85b9.bd86,
0xcec.cffa,0x2301.263c,0xd283.3a5,0xfc5a.b3f2,0x1d9d.0ce8,0x1f4a.c5fd,
0xe56.0333,0x4448.37f3,0x32b5.8c45,0x639f.9c5e,0x9a19.9f43,0x4c27.3e44,
0x578f.059e,0xceca.9194,0x4e7a.8612,0x3a63.4fd,0x9516.3ed1,0x6dcc.9729,
0xfe66.579f,0xff68.639c,0xd10a.8e24,0x8a6c.e798,0x1e23.67a4,0x906e.5651,
0xbb59.95ea,0x2b3f.90f2,0xc12b.335e,0xa70e.25df,0x4730.0dea,0xe5c7.28d4,
0x5358.ae7e,0x58dc.b9ff,0x9ff9.a143,0xdd69.b151,0xfb28.8d9f,0x7874.ca39,
0x793c.89ff,0x47fd.5a3e,0xc41.600c,0x33e7.add2,0x1570.13ec,0xe663.4354,
0xf158.74cf,0x8d37.3fc1,0x2b9f.c131,0xc61d.4d39,0x964f.a34e,0x14ec.c54d,
0xe0e4.aca5,0x3e95.b34f,0xf8b0.5aaf,0x65d5.efc6,0xd8ce.a6a2,0xcb18.314,
0x73e6.288a,0xb9a5.d98e,0x1cc9.96c1,0x335e.f59,0x1999.c7f1,0xdeac.df59,
0xc4b1.a84f,0xa931.c8ca,0xece5.2f8,0x6760.39fc,0xd543.533f,0x27c7.982c,
0x41a2.a249,0xcd00.32e5,0x95ea.8ad9,0xeca5.638f,0xcc84.0bf4,0x6906.eff4,
0x8a38.de69,0x6494.6898,0xdbf5.3b,0x2d3b.792e,0x40db.c978,0x8b67.3301,
0xfa0a.49d8,0x8236.03ff,0xa.77c4,
}
function u32_to_memory(dest,src,size,offset)
offset=offset or 0
for i=0,size/4-1,64 do
local first=i+offset
for j=0,63 do
dset(j,src[first+j])
end
memcpy(dest+i*4,0x5e00,0x100)
end
end
local reverse={}
local function bs_init(data)
local bs={
data=data,
pos=0,
b=0,
n=0,
out={},
outpos=0,
}
function bs:flushb(n)
self.n-=n
self.b=shr(self.b,n)
end
function bs:getb(n)
while self.n<n do
self.b+=shr(self.data[self.pos],16-self.n)
self.pos+=1
self.n+=8
end
local ret=shl(band(self.b,shl(0x.0001,n)-0x.0001),16)
self.n-=n
self.b=shr(self.b,n)
return ret
end
function bs:getv(hufftable,n)
while self.n<n do
self.b+=shr(self.data[self.pos],16-self.n)
self.pos+=1
self.n+=8
end
local h=reverse[band(shl(self.b,16),0xff)]
local l=reverse[band(shl(self.b,8),0xff)]
local v=band(shr(shl(h,8)+l,16-n),shl(1,n)-1)
local e=hufftable[v]
local len=band(e,15)
local ret=flr(shr(e,4))
self.n-=len
self.b=shr(self.b,len)
return ret
end
function bs:write(n)
local d=band(self.outpos,0.75)
local off=flr(self.outpos)
if d==0 then
n=shr(n,16)
else
if d==0.25 then
n=shr(n,8)
elseif d==0.75 then
n=shl(n,8)
end
n+=self.out[off]
end
self.out[off]=n
self.outpos+=0.25
end
function bs:readback(off)
local d=band(self.outpos+off*0.25,0.75)
local n=self.out[flr(self.outpos+off*0.25)]
if d==0 then
n=shl(n,16)
elseif d==0.25 then
n=shl(n,8)
elseif d==0.75 then
n=shr(n,8)
end
return band(n,0xff)
end
return bs
end
local bl_count={}
local next_code={}
local function hufftable_create(table,depths,nvalues)
local nbits=1
for i=0,16 do
bl_count[i]=0
end
for i=1,nvalues do
local d=depths[i]
if d>nbits then
nbits=d
end
bl_count[d]+=1
end
local code=0
bl_count[0]=0
for i=1,nbits do
code=(code+bl_count[i-1])*2
next_code[i]=code
end
for i=1,nvalues do
local len=depths[i]or 0
if len>0 then
local e=(i-1)*16+len
local code=next_code[len]
next_code[len]=next_code[len]+1
local code0=shl(code,nbits-len)
local code1=shl(code+1,nbits-len)
for j=code0,code1-1 do
table[j]=e
end
end
end
return nbits
end
local littable={}
local disttable={}
local function inflate_block_loop(bs,nlit,ndist)
local lit
repeat
lit=bs:getv(littable,nlit)
if lit<256 then
bs:write(lit)
elseif lit>256 then
local nbits=0
local size=3
local dist=1
if lit<265 then
size+=lit-257
elseif lit<285 then
nbits=flr(shr(lit-261,2))
size+=shl(band(lit-261,3)+4,nbits)
else
size=258
end
if nbits>0 then
size+=bs:getb(nbits)
end
local v=bs:getv(disttable,ndist)
if v<4 then
dist+=v
else
nbits=flr(shr(v-2,1))
dist+=shl(band(v,1)+2,nbits)
dist+=bs:getb(nbits)
end
for n=1,size do
bs:write(bs:readback(-dist))
end
end
until lit==256
end
local order={17,18,19,1,9,8,10,7,11,6,12,5,13,4,14,3,15,2,16}
local depths={}
local lengthtable={}
local litdepths={}
local distdepths={}
local function inflate_block_dynamic(bs)
local hlit=257+bs:getb(5)
local hdist=1+bs:getb(5)
local hclen=4+bs:getb(4)
for i=1,hclen do
local v=bs:getb(3)
depths[order[i]]=v
end
for i=hclen+1,19 do
depths[order[i]]=0
end
local nlen=hufftable_create(lengthtable,depths,19)
local i=1
while i<=hlit+hdist do
local v=bs:getv(lengthtable,nlen)
if v<16 then
depths[i]=v
i+=1
elseif v<19 then
local nbt={2,3,7}
local nb=nbt[v-15]
local c=0
local n=3+bs:getb(nb)
if v==16 then
c=depths[i-1]
elseif v==18 then
n+=8
end
for j=1,n do
depths[i]=c
i+=1
end
end
end
for i=1,hlit do litdepths[i]=depths[i]end
local nlit=hufftable_create(littable,litdepths,hlit)
for i=1,hdist do distdepths[i]=depths[i+hlit]end
local ndist=hufftable_create(disttable,distdepths,hdist)
inflate_block_loop(bs,nlit,ndist,littable,disttable)
end
local stcnt={144,112,24,8}
local stdpt={8,9,7,8}
local function inflate_block_static(bs)
local k=1
for i=1,4 do
local d=stdpt[i]
for j=1,stcnt[i]do
depths[k]=d
k+=1
end
end
local nlit=hufftable_create(littable,depths,288)
for i=1,32 do
depths[i]=5
end
local ndist=hufftable_create(disttable,depths,32)
inflate_block_loop(bs,nlit,ndist,littable,disttable)
end
local function inflate_block_uncompressed(bs)
bs:flushb(band(bs.n,7))
local len=bs:getb(16)
local nlen=bs:getb(16)
for i=0,len-1 do
bs:write(bs.data[bs.pos+i])
end
bs.pos+=len
end
local function inflate_main(bs)
bs.pos+=2
repeat
local block
last=bs:getb(1)
type=bs:getb(2)
if type==0 then
inflate_block_uncompressed(bs)
elseif type==1 then
inflate_block_static(bs)
elseif type==2 then
inflate_block_dynamic(bs)
end
until last==1
bs:flushb(band(bs.n,7))
return bs.out
end
function inflate(data)
return inflate_main(bs_init(data))
end
for i=0,255 do
local k=0
for j=0,7 do
if band(i,shl(1,j))!=0 then
k+=shl(1,7-j)
end
end
reverse[i]=k
end
function blit_bigpic(lines,dst,dstwidth,src,srcwidth,xoff,yoff)
local data=src[flr(xoff%2)]
xoff=band(xoff,0xfffe)
srcwidth/=8
dstwidth/=2
local dx=band(xoff,7)
local xoff=flr(xoff/8)
local srcoff=yoff*srcwidth+xoff
local w1=min(max(0,srcwidth-xoff-1),dstwidth/4)
local w2=dstwidth/4
tmp_mem=0x5e00+shr(dx,1)
for line=0,lines-1 do
local off=srcoff+srcwidth*line
for j=0,w1 do dset(j,data[off+j])end
off-=srcwidth
for j=w1+1,w2 do dset(j,data[off+j])end
memcpy(dst+dstwidth*line,tmp_mem,dstwidth)
end
end
strlen={}
function _init()
cls()
local s="\151"
for i=1,#s do strlen[sub(s,i,i)]=true end
local rom={}
for i=0,0x4300-1 do rom[i]=peek(i)end
for i=0,#global_rom do
local n=global_rom[i]
for j=4*i+0x4300,4*i+0x4304 do
rom[j]=band(shl(n,16),255)
n=shr(n,8)
end
end
print('decompressing...')
local tmp=inflate(rom)
rom=nil
local u32_offset=0
print('unpacking...')
u32_to_memory(0x0000,tmp,0x4300)
u32_offset+=0x4300/4
for i in all(image_list)do
local u32_count=i.w/8*i.h
local pixels={}
for n=0,u32_count-1 do pixels[n]=tmp[u32_offset+n]end
i.data={[0]=pixels,{}}
u32_offset+=u32_count
end
print('postprocessing...')
for i in all(image_list)do
if i.scroll then
local data,w,h=i.data,i.w,i.h
for n=0,#data[0]-1 do
local off=n+1
if off%(w/8)==0 then off-=w/8 end
data[1][n]=band(shr(data[0][n],4),0xfff.ffff)+shl(data[0][off],28)
end
end
end
end
scroll_mul=0
owl_page=-1
owl_mode=0
owl_x,owl_y=10,20
fly_cycle=0
water_cycle=0
function _update60()
rnd()
if(btn(0))owl_x-=0x2.2
if(btn(1))owl_x+=0x2.2
if(btn(2))owl_y-=0x2.2
if(btn(3))owl_y+=0x2.2
if btnp(5)then
owl_mode=1-owl_mode
owl_page=-1
end
scroll_mul=(scroll_mul+0x.0018)%4
fly_cycle=(fly_cycle+0x.07)%1
water_cycle=(water_cycle+0x.03)%1
end
function draw_world()
local data=background.data
local image_width=background.w
local image_height=background.h
local world_x=(image_width*scroll_mul*4)%image_width
local n=6
local lines=flr(image_height/n)
for i=0,n-1 do
local srcwidth=image_width
local dstwidth=128
local dst=0x6000+64*i*lines
off_x=(flr(world_x*(2+2*abs(5-i)/n))+image_width)%image_width
off_y=i*lines
blit_bigpic(lines,dst,dstwidth,data,srcwidth,off_x,off_y)
end
end
function _draw()
local frame,page,off_x
cls(1)
draw_world()
palt(0,false)
palt(8,true)
off_x=water.w*scroll_mul*0.5
blit_bigpic(mountains.h,0x0200,0x80,mountains.data,mountains.w,off_x%mountains.w,0)
spr(16,0,60,16,6)
palt()
palt(0,false)
palt(8,true)
frame=flr(water_cycle%1*12)
off_x=water.w*(scroll_mul+frame*5%12/12)
blit_bigpic(water.h,0x0200,0x80,water.data,water.w,off_x%water.w,0)
spr(16,0,84,16,4)
pal()
local owl=image_list[2+owl_mode]
frame=flr(fly_cycle%1*16)
page=flr(frame/4)
owl_page=-1
if page!=owl_page then
blit_bigpic(owl.h,0x0200,0x80,owl.data,owl.w,owl.w/4*page,0)
owl_page=page
end
palt(8,true)
spr(16+frame%4*4,owl_x,owl_y,owl.w/16/8,owl.h/8)
palt()
if true then
palt(8,true)
frame=flr(water_cycle%1*12)
off_x=water.w*(scroll_mul*1.5+(frame+6)*5%12/12)
blit_bigpic(water.h,0x0200,0x80,water.data,water.w,off_x%water.w,0)
spr(16,0,96,16,4)
palt()
end
palt(8,true)
palt(0,false)
off_x=trees.w*(scroll_mul*8.0)
blit_bigpic(trees.h/2,0x0200,0x80,trees.data,trees.w,off_x%trees.w,0)
spr(16,0,0,16,8)
blit_bigpic(trees.h/2,0x0200,0x80,trees.data,trees.w,off_x%trees.w,64)
spr(16,0,64,16,8)
palt()
cursor(90,120)
print(stat(1)..'%',90,120)
end
__gfx__
87c9dedbb4f4c595ab02a46939a6aa57575507aba5c0c8aea5a338c94a4eb2c9213cb9563a627061e3d01e66275d3acd4c0281cd3308d300183d011bb4a0bc3d
33969f7b87214c067c00b2f014b41b59ff0ee557b83d0c0a4cd5fd37d7b67ced1f23e765c799670b6f36dafedfa5b20fcccc416a035892c416a035892c416a03
5892c416a035892c416a035892c416a035892c416a035892c416a035892c416a035892c416a035892c416a035892c416a035892c7ed0fdcf5e1f39f1ffe8ffc2
cfbfffd7eef7b9bf3cfe76f7ffbbfdf73fdefbb99f676e7733fdcccbdf6eb9199183333f3df165ff0f3ef1cdc1fde73fb7af9f7cf77f3ecef87faff1ef9ef058
37cff5fdcf7cff9fbbff5fbbbcfdddc7bff3fbdfffebdff7fb57f3dfeedeccbd1b4093ec3c520f7c9ec13d936a37c47e89ec13d936a37c47e89ec13d936a37c4
7e89ec13d936a37c7d837469dc314ee33b1df3fe70f9db5a1fe3fca87df9f3b11f396958fbfe78f97f74cfc92cb72cdf1bffc24fd7ed10a0b039c7eb7fac6018
049b6e7cbfc7fa585ffcdf9ce3ffe01eea4eef9c1ee3b4fdb75bbf3ed7ebf3206ffcdf98e3fd3162516ed9921c4645fdd05f64e97f729fc7fe5f374bc744fd75
e1bf7cefc7f38f482f732fcbf31d7ed51203f31f7eb7fae2f758f93f3ad7ed905f3923ffefdf7bc31d95ee3fde88f95e47f867dfd712028646c5cf7ed50df97e
2ccf83f97722085abf39f7e4eb4fbd9fe39ff8f03ffe90cb8f442cfeb5e7c7164fd48b436e7eb7acfb466e19ffcbd9f7fbff461d949cfc1d4f67cffc259fe812
ff7b39ff9066b1f12099f42d3806e6e4ef9f637c6d7b3ed7edf7f3ff73ffe907f70afff1ef9f678f213c7df196daf051ffc6c3f52699ae7e25ff7ec78f9773be
f8f97fcd11df2a00397ef7773bcba806ccfcb318bff9e2ff7a5e74ea37eeebef11a16cffcb310bcac9cefbb3642e318cf71eef4ef99480759cfd534c78f9a138
f8b01fb6b3864275ddf468ac7c700a7b166c78fa293838f468dc7c783c7d1b32991c133abe8f19d7a448e3624cd8bee63e26f45ef1f1427095c9dfdd0df78701
f1cba83359ff557f22bce2af8effa63e14798e52afd9bdf38ce59f1b2c7571f0e05e320a7fabbe60df4ff59bb1f1d13cf070e3eb933df898ed7143ece51863c2
95aff0148f78f5f8f387de2eb5c7841fde0f02334fe57286a07671acf08b8d506657fba1affaab7dddcea99e17f902df3bb8330a7d501cc6905b169c8f3c3875
780f0d7a2c7fe610439d5073a8f6ece0234b576a7bb06dfe871769d998d3c51c54062dba183de79201fe53e2cbf7bbaea3b6f3b71e8ad3349f7c42af52006f78
01a11934f570dfeced3136fe91a8ef208e58bbecaff5c50273e1c919cffaab8ef12b71edf1c71c075d8b8e2253768afd7decbad952e8a50a73103ffb0268c2db
32b700369c0302e7512ffbe3c301a0330a7e6f0c9e20bab764eb0f223466cc39cfd5a644cf26bf8f2d1c113f2ec05fb19e9eab020840308bbd0c5176b0b0eefb
5a5049f3034c5040fef0eb860792f9325852e04f4642b70277121c139d2cc31f70ca5e58038ebc79ff5771c991258f008e1849659cd3366f08deb3bef5877fac
99b8af30775fb459f76789dfdcdff7b09fe935070a56169ed12d77003a5074ba35087786d19c581e708af7299078eb449ff557ff6b7e48efff8373fb7095ce50
b0ff1cc3afb7719d3381ec39fff89ca10c81cdf1abfb4909f385858f205ef78020e50097f214c3302798ab58502b7f46199ed585072f705f026f01f3abce016e
5cf1c7e90ff4f4e2f9c6e6e66ffd079bb46f00c4df10cfd8efe838b1c813ed188ff18c8312bf776f0061229b21a63cb381f7e60b6be78e2d3958c6510a2a7975
7d7d7d17c1f1295bf288c7f01def9e246a7fdf812c1ec32fb8ce3ab8af076a6f261e3d5f78d9cb140ee8efbcb9d3720e9fd469ffad5e5de9398f310081f50987
19e14f769099b380c96cecdd13db769199bb893c2059b74ce2f6f2007d906dfcf1fbe1c5f7378880eaea39cb7d6df5720ac9e40eee29b1fb9fd05adee6ea3ae3
c1aa8b13fb341876b084f0e8f09df1c20f8bbce0009148af081e0ec87cc075d8b67511e728e70c5e5e51a5ce6e3129fba503bcb140e862fff40a1047b9c799b4
7f11dde29f33cb0afabf1b307cd02b8181f181b712bffbe3c7d1365401f728a700ccd12e5faed29d7fadda3f05ecfbf3da085c3cdfbdb50f70b4eeacaeae98b7
323c000b489fe3cc0717b701c8d1db67cb7d523810680dd72f503fa6ff052283f2a99def0d7438727cece5d118e4cb7902fe727973ddfeec0412cd014ed7973b
9f0ec8598dd3c8411524bc2f74d804f10764eebea06c9d282dbb846fe45f091bf12d783c3c7d0e139218ef419f008cbd9cb0ccd14edecef3325002bff5f4ef5e
0f7b520518c81fbb0251678e3bcb334a92359ff12e302361389971e715eb4c6f1ec6e93c18fef0c7c48beb172ea70e4e7e4cf79e4edf4033a78cd4c98ff21f98
bcfb2984fceb75bf44b9fc23dded18bfe6cd53368b047ffa1953a6f10e03d563043eb66f604e057cbc70ea7d7d381f16e6c7d7b32c42eceff0711c38fa29fb77
af8784ae806fe8f4cbe4e6f6f7b38300bb76af926cbe0129e74570faeb9b1779ce188f171957925240afbb76c1c16eb02f18c1cad1bd1d5edc5e6a9b07dec05f
7dcfdf09f1735037e3172d5478de4cd0efd12ef3a5b36c40d9a3bb1795f76d5628e28aad3f2f7aee6ae815cf991df840c8f30e798dbcf699f87962f182287306
b9a0ff27bbebeffae91eb6f62c1729f138a7caf94fd4abe291bdf5659dedf612a1173078f995f5aff67bf7efbdb9ce0dbcf3334f4c04e8d135e00e9ede6e8f17
58131ec0ce5aba9d1ccb4ef45207973f463d3d37d73e68641ee6c94bf753c0fbccdd7c7edbf797029fe9bb1ddee7f76ec2e1c10428101ab86de0822d3c71fb66
7979fbedcdcff8b9fb2dc5412f336d7641770ef0ab4e2f46c17ede58b628c42f524b6958779fde08bdb532fe53097af7004cbf72ff2cda35e85ff75d8f1b6436
fb0ea3c3f0fefafd26107fe02bdb5dacb2c00f0a98091ffaffb1c3990f31eef369fb341ddbbe2d18b5270307f71c8d7f12783830d5e8c3e9e87f827466e71838
5baf0d5c6f90e5808c77207f6fd42feccfdbbcdc72fbe256e78e4c976aa08734361e783306c7ed92cd5ab8fee3fdbc0dedd504b52827493ffbb1872eb7779e18
4e3271ee9f9773f98341637f335a737361df0dbfb846ee6cd760ef1364efd24e6b74140aa32018ef949e541faf134d6678bebafe891eb6877dd899e721e3c479
15ebfe24d04e7f595dc04effaf004a1014803fb37e10c93bf504d0df540d3c87070c1064cedf0276ff236a61181d70697b5e7189b88df01f3dd58b23efc142c7
618cb73f7dfefc44ebb979d572ebe2b24142d609ea3130fad96ac318b07647ffaeae21e18c63120e08a41c2d09ed9b900cedd9e3e2193cf700be9b98ea0bac7d
dfaae278bfce925048b269fa8cbea83cb9aaf53025a432fe09f17da9e25ece72b7aedf3f5b319da6627e58cd0e7372f29483d9dce3577bff4431e5b3bd4794af
a65ef44bff27be640f67507147f3faea2aa38b176a8dcf503fdbce67df5f5b3b7ffd8ded3b48a30078fb18608a242520be5e971ea260b3ecbdb7c9503ebee627
601de56abe25984a2ffe6792d9e33f5ff1a9bffa91bcbd9df67ff6b9a2feff2ec97b317e6e6e9117ae9c5288896c7d7575eeeab81ef41dcb1f6c31ca1e1ceff5
d1bbc7f0ae9f33c60fc39ceae60e16720cfefceb776fe84ff1fff8bcb9fb93c1bbabf592efa49e1e4f630dfe05f10499cbd33ad7c297b717cf4779e0e9eb656f
12385dfb1950fa27248b6be40ba431c1a3b1e7a820d31c1d3173e30c47de593fddbef72c2dd0dcbf718751a277cfbd98bf51cbb780debb52ce8e46b68f6ff3f1
083000c1fd0c20bebef7e307a1070ffcc40c1e103ef9421e834df634fd221d769f5f02b08f191a24462af045e008cb7d0d147602e54bfc44a64f72c2feb203e7
a1b3b5eb9b287e0cbd3e8fa63d9a216a07f49eef5edc5156818d0c940473a1760baf624ebffac523ae2eef593d04ca28fcead9ebc1bb70d121e6dceeb2a30a47
105dbc997f6471c5ff7222feb071e323f7f1300467625e0c1e109fff387ac1f313ed660905b2b30feb3af757d1bfd285f7faef7df7546fd3101724d7eb482fea
ca2ba308cbdd7c35c89e45e9bb4193b7abee5ef21fe3b5df73aafe7df631c077b401fedd400f8ff7bb51b7fc29bdb5a5c0c78c1c1a3d797d14aba42fd346c759
ed07c4af0eea86eba86fe76ddf59668badb33848b84ed040e1671cc5c99ff916afd4df618c7c12e1c5fab3160a9738c3fae9cfaf494eb83ebedc4e2e924c4fba
7242f676c4ff73ab7069fb3bd747738ae4b914d77798dfc95cf1f7dfbddcd46ddd379e8a3b7f53897e7471d6e6c1c55714f1c9211697776ebcbbc051659f1051
3ccbd139b731a792e3e21432949f1b08c13e28fefce47f0d0ae0c5c7672838850b40d27b7d905edee237bc0ded36794fd3d5f73c216c0717182fefd0a36b83e5
853a87f4364b7784e20fa420573c10767fe4d82958461ed18f48383c3c30715fd9e3ca162ef0ddfbf3fdeb9fd0af140e880addf02ff73420b52ca01d76f9700e
252b30daf3713b04360c1c7682f5a1fd83ec460ce0a1fdcf4dd33270bdd530f2e8de697009f8d1399bb311e3559f6209bb19fff36236cd498ff03efee50876fb
ceefde72297f5620596837a0cdfcbb4a3d70450ebb9ce50c33e20483b7fb08afe8733fc5acffb261098a01798e29abe2758bab9368874436127fa92ed7752f5d
ffe410345ef7b02fb5a38526a7f017ceccd9ec30b31616530708e021c0fe652ff2430fb588fefb17ffd140c9cf582eb3bcb1226bb7687c7b01bc1c9184ffe94b
fef2ba0e14c96bbb765638eddd7c2937d029087d787b1f1eba548dfc0aad4cdc8befb18a79bcb2056908f1027082197401bfe53ee8f09fb2783f12f3f84fd5fd
edcfa0628704afee68099c3edfe2e0731d7f76b707bd9d176e26f76ec847f0afd27d4e01c5cbed4edf89fe0327f5e5a8cff108c8e2ffbf5df4f48dfdfe5649fd
18cb7139b4e87fc5fdff8ecff36d773f0372bcfe98b013e229c5f5530bf017641dcf7df113fd79dbc707fc993c701118cd46fc9c712e3cdc5d52ae3c146c9080
3d7b784f6c78f602157000bf601efa26f2094ed8779ab3081e17de423037f7378fbd1eaf2e1cb671b87dffc8de771bf54b8e30c02083e5cf50c657d1df6ca2ed
509507e7f986ebf41fe3958f5c9caf086fb6714aebb406f77ef5e6fd83528547e012613e572fc50eddd74407904e971cb1a988f761bbc51fd08380ec8f87444f
83f2675e2d1bd46ef1870001effac3206f8bc5d9c2fd9e288939b0bf7579f357f6e7ab075f005db6edf77241b913b774ffdf00c871412e60debf29dfd3beb835
6172450bf7860f26d7fe2c577f28b76fe9ef727d79f7db6aafef283db37f17ccae0482ec76470a348c95a3b3385459c377f14d346ceaaa8eea19d6badf42869f
c049e01fd4dfe608311047161d827dddf4784bff2025effa0770ae834580aefc1538e931cb48e97c0e14af1eacb3887fb48e10efd8c85f0f5d10d9f30fdf6f5b
317beda17fb12603fec0e9975b8fb4276a8f297cf5a772ae10efce22bc231a01fef546a4f2e833e3b13aeee3399095ed713f0996577f4b771f205a4059a93bf3
079af00bd3341fa1c5d344bdb49df930e734ce598fe8efeddb0c7f92edf7f8d0e5ee7eedc553ab16d7f4e65cda7cefbd96d671cbe01a475aaf070dd547e1411f
74a7080ab8c8dd50ed70af6e33ab0d5a28799950044fef3397749ce8d1b8d99d8f390eb8607a55887d89c5f35197eb1ce7d04bbe0bf5706fd6ded52b37250948
2ed3443105002ff1be7b13c7711027e0bd0785f394c7eb6e032f9daf10aa308e304bd74bab32f76904fda83c71258b8b07027f96bb0ecabd5b6fdb8f2e2c9506
75a79a69ed28134efefd1ced0c629df248efe28552bc79a630f1f1ea17c8dcc1adfa30f70f0c6f37f90441f605b8f27bfd06afd461e205141ed875fddb0a122d
38a2cfddcf5bae70acb71f50538baba2fd8139b25bf60e8ed61acb1161e7133853adf8184f095edbe4c1f7a2ef0e69ab17f711df0c4e106fb196ffe0aa9776ee
e077e3f720b3a37b8d3f9cec2b751e2db65c4fbba81c150ef1e81c3e0a25cb2c402e0e095f388c58b0e8069ce0711836ec0aac4edfd5e480f0ce8d164eaa3076
25411c10f3ac6bff94df183702061826fee416e10bfb70b7f5bbcbcfba378e0dfdb97ae7eab92f2f6ea12604f1df5e0a2d4a1d51860396b306b04e17e6ffd1d7
5e1f0cf3f8c475e60f8d0402f6991d3cb9bd3cc6113c5f358a706d06cad0c3870873411cf1ca364e8b0caeb85f5cd5076de9db3a3197cc4d5f3c8d960c1c4ebf
dc7122ed542a6c90c56aac397971f6fd303f9b70276ff7973fb6291a208b290f87d02f18528080b94bf577d41e00cff3adbb7f7f3f4bf7781fe798c10c7fc82d
5e1f53461871dd949ef2785ce3273f2edc3df97b780f9f5f3c5f4e082abeb371fa7d06cb882066f7026feff99dfdf53cefddb3ad1d1ca7c267e12e22887fe24d
fa36ebf7077f4f7f14f13468d8348fe82f53ad26774fb39136dfee410c9d7f13afff334b777af002feb4c66e0e3eff88efe53ed76a1fe92fdf6c550fdfccf040
3c4cd341ead7eb6b4fbcadbe484eb91820ca24d70fa9251b5a7a2bf778bf9bfe0b2c787fd5680137f7fcce70dafa1860cbe2f56f3718beb9b93eb00d089729f1
4d38f0032cff314c30f6fe76c7e5be2ffa871e104f0906207a527d758eded4cbf5bdcbebc3eb1edfcbfca1c581f405306105e782f58de67c490e405d344b38ae
108afe2b77e7ffe42ed701fe03fdf5ff214efb609ea57360d083beeb088fe7c45fb3f7f9004f18dedf106d782efefcec43edfd07cbf0cfdf393ebcbc29c77e37
20761feae0c814302649f35dfe8bf57b4fb0ae3cf91d30c20fe7dbbafee0fd1d993d03ed7eebf79ba876dfeb40072277eaa9af3702dcb2c8707685fb94e770e0
186bb44cfdfcbe7fb46d0c4d1fdf0dfdfa594ebff9b108708570520c87d7b7bc1f0ed16c378b949ccfb3ade067a01909fbf77e3edfdeb1c87f939771c9709fc1
10a23ff9eafaef3d5f510df7906dcebe7f72e4f16f86fb5eb7ccdb1cfd773cafee983d29b6cefe5831795db3f9b104338ef50c90ca38031449c91d16ea8787b7
813740081a3f7ff68430ed9adbfa14cbf73ec90c72321edf0c95aa3720e2510c68f085876a9fc2c8ea0f4c60d9f144f7f905d77a1fef904cbfbef212ed713043
201bf18010e7d83e9f22ac77d141307781d4e7f7d93f7fb60dcd9bdf212ed791ca15f309297ff9023a3eafd03fbbd379d187f77f40bebb6469d7181febc06d0a
f374b1c60aa00edc9ae7f5b72ecedf5f1e1cb3de823e99dd7d051eb5af7de8fb4987f5a08d0d38e9ebb87e7c02374af1ded14f143fbdd4cafec5d10f566cbf25
853ad0b2cc7086fbe8e23c587d1f1c58dafe0674fef69397f7921fe68104b18029afb2a3e914dfc9beb2befee983f7ff15aebff430bebe29f00e8c56700af0ef
cfb2a1b7cf6eb07b7f270887ef403f10002b7fb9b804edf4c5660f598eb7f30fe7d9e18b8b2754efa789fdb3affb47f7f30142f10407e91d9e34ecedfafb4e87
f341c7e30907e7794ededfb09afe624836ec7081c1b02f6feb5f53bcf31dc70870729c79c9fdf4401c71c7cfefdffdb2cad75d6fe3c1eb69cf67a0f7f10bd36e
8fb470b4f4c543e6683efac02f42d6fe5360f83d662f55140afc5f281f9af161ae3c71ecf01a73e8bf9e34af97cde672dfcf94ebc62f184634f4d147dd8eb733
a4349f7a50affdef2c81093df6f4f73a143ede06cd65e743b958aff5b42c1f76e01b5f761b51f212fdadfaaf17cbddc6eed00bf708f2dcf1aa8714ab0edd779f
200db7ab7a4fb32ba9034b4f7d9570a86e318fca9d1bd6dcbb182efaa5af1cefd014d6740bcd6cb9d4433068e3a43fca9163ef4201313009a54a5590c67d3240
e1832d350e74bccbb09f04e3e38912cc09e704cdfd712edbd3ef1a19ce129fbb24008220ab2746a0212d02903dd75aa5dd1623cdf16e0e31b9a43c15d6058dbc
993ceee12f4ce81d9f331441c0b9d6ba4c6f1f662aab5a0f9b5c643ece0f7cd394000c1f55142f13b30c6f63b3341b6861ef102f56a0ef1b19318b09cdecd8f3
5300da2e3e4d1d5a0442f8b6b7980f588ed8a12f8a81206a30edf10a8cbd1af3ce3197d9f3bd6f9a0f6d78307a0eaa1ab72255148aed40197bf4570ed42aa67c
9860283552faedc01df6e8640d747568640a2f2e2f212b6f63a7cf359138227bbe8a1fd46d60f90210b90531c62cc5d6789f27bdff8af39fb6f1b16f2634f63c
e81e3356df6424b1499d7cc4f3efdbb648a575f38c7dae6fe42524f6339112948f05006fed0d5d6f47c8e6d3622952ebd6311ea4f6baa986eb3008484c57f308
969c44808699a7fd87f27c0882784a9b9de7f0a5b016bd322988d136ac7c1ade414591d98385b38b5013af63aa6801d7a2e4ea94435e40ed05cd9b080fe4027d
e1867042e70f4608ded53fdba6d3ea2d5e405df920f9c8b14a4124f5da1a2344f70d61d87199735c8db4af768f6b1f290b47f3f6242afe03f56b98b42c4e86c3
3af132f9edd9e963be23e653453bdb1973d672421abce8f71028e474aa2be1e8bd3e0d477d5b243cef482a6f9afa81b3028cd3f0dc4f8e78a78af2d2a4ee037f
3fe61ae1acbbd4f348667e9d1d8cd5746e6b3c7e2f63039e1591943707e0e6b60bae5c2d3e1d4bd8b7e1bf0f289c1145308feb03667b99873af668ee03742924
b7825277b6df14e1eca9bad7e38a1e282ae97c1bebbbb94a15e016fd5e8837eff20f9fdcef400df44dfe1f6cd289745e263c67972ca9ebd97af07cde0abcd045
446ee3c5835336f51473d66c46ee3ae781f7009384f7ab8e1ad5e4b87a260243d56abc06a2a594fe0d8835680b765bfdc01d372f4bee24d6525336beadaf4354
e7815c3a5e9aacf87453b0a2ce53e9b0312229d7ccd6d009805517de0f57bb9c10afc9b17336068517e83ef65b3f42ee5fd83c56d47a46c6fefcf087587f7bc9
3b1daa53928d3b867054c19b5b8cb60ce72c1f0d77809de1675f97317bbaaab43c2edd02a1bd388932f4f63827b57c5e48aeb445150f648a34cefe94b952510b
affec683fd6b8aa646bd3fd712336f82e6b57c8afe71b61377e4ac9d0de4a814c4b919b603724dcd5927560135b2797f30b1dc9f1adfe7d77eac88327a301ea6
531e04f84114a0896fdca7a68c82d89e2984858ebec185aa38b0556ac5cd95c6bf6968f1a254bd38009e5e8ed8b51a9221b026de791b545dba23709740e458f4
5802bc98639129031a80ad5ae2d3e04ed5036f48716f3eba695b130f4206362630e7d377f9270606e53cb896fd76fcc487b5294ca6ea43e6baf6867f3163036a
55b87c17ff63dcebd7c827db0cc030b4bdd42cd3f0879bfa76b93f7fbf6a13e26f662ed1a1698775eaa95538e437479737b6a4a843263b8ae60fb06cbf9fd39a
d53afb42ff870f83720f0d34432e3dc5e7416d07dc0c25bc3ef7b781189703262403694d804914fd061e7010927b9458bf519f35c0178e6b9e67b97c058f871e
86cf732f7b3592df0dc0bcf24e81d346cda0d6281f201f40c47fd8310af520c3e814e3bbd0b36ed8d120f4f7eda226b54e5356d24ffe2904807348f98bfd3181
a2ea4aa3db7d7df65fa995b68fc22c02a14b399dda974f1a727a6e7d61afdd85d8105ef12f3ad63f9f8b8bd2d2872f7aec82bfd79a02e48a8723c72a25dc1187
a9be78253117f55598b51b6b558b741fa408371f8d47da88566e122f7dd035693fe3d6262fb13bd6bbbdc08e25d6def0902450d3362626d37cf86ad210b5e70a
b550c42e67d5a656d7594d991069c6bd120876f54216dd9677553aede726bb73aef96738ef343bf6b963f51e5c9bd7b7569fe6e0fcd7379be10bdae25a60fc00
316bd87ecc5a4bcb2635be78d3ff396c7f6b9a4e259741bc831100bdf701fec6f66f41e749c25be940d3c8101372762518e305a8496226d2d6d2573aabdac08c
5fee7e6646b56b31626eab3d6f64e7c1fe9d5443d3149119f3e06cde4c8cce498c05ded60bcf374fa6e01549474c6df7ad173c439c4ff68b16c132dcce5156bb
46c1e29613b0de2aaca2ecf417df61a0bc44526afd6ad1584fa90971c93f2abfe5d16f2905d789c4257842c870962eddb96d609770a7ad73ec3df5fc9e77851a
5b3cefe451b9f6ed89f4baa460257d86b1432e420c5d3db5e2e2ed0e146b3cf0ce84b52e0599ffbfd88c7998d2b22adec9bb93dc58dfddc5a50bf1fea5f224b5
3396040a9dd92de95aac59ce64934bd93aff4d31de1a9d752078e5b129d5fb33083307174ebe48d71b8524a8390fa3ee3b7eac6f0e019ce6c16972436bbe7b38
8547a50b7a40436edfa07a40aaf016741882e67f707edb06c98f86ccc294d52c46d707c2b976d63934de9913d6335092258c9a3d03213a9eded0817d2d6ad48f
67bd6d7c9d32915d6afd7e369e97dac03fd9eba4e36d1fe27082f807214ac9bda51384cd0927346ba5aa673dce4de19184a8403de1c782b1e763d46415da648e
ff95ffbd6dc0bd94053505272c26fdfd31409a516aefe821e0be083e06b009b60655428d56636d36d7373a8243de689a35c5bc5d712dc81f31ee53c8bc57e8aa
ae35e2446adcc53260c9633ca99a11cf0172c9bdb2e614ee6c3352250387e27bd6d3a6fc511926957febb9bcdba693ef4cef0d1acd5b9dbce6eafe71e03e837d
6fbdb0bc3d67e90f3599588b85d82c2be4c5f29bc1faf0611e04ff8dfeb16b6c6dc5b1d03edab1e7ca0076c427b5be1af788371f0c6332cf8d76d5d4e39a51e6
7ddead87e55b58aee61e837b38293f7065e79b680430a624fd1a1fde4460c453c7af249e3a93932bf9fe7d5c123c0aed86602ff0e09e3d83d0e89a484f91be96
526a6b5bd4cf6a1771e3bc46b41010b90c1da03f35dcd936bcf803c9ad60dd63665de7c1ba943f89bff2a7502f30b50f6d28dea1669296099ed85b374f6ecebd
65b194e310edb64856e2bcf8622610b5f73d4b70b893d51ddaf74a7d018bfde03ef7c41f1baefa8b480cafb9dd6adcdc8b67a6722d580e2a136f7c670bd736aa
d2f80cea91bd683a8207b3812c805f1c6bbd2778a29323f6709e7581e29242a16778aaa17bd2582d3a1b6ffe3f14ebbacfea2bdd6a6a3a54f6aa30967abb2de2
79d0f5468b9c7436baece4134b954986432f2ef6de7d9b15ed63815d30d7e08741721e6599c16c80878abf3024d7aeb0379d4dc69c9fd935b8d75913ad364394
a5d7d7503e0b8391714804bdad66ab89e49c113f80f90bcf8abd006d61b7daa2b33ce728810a7972c3f1bd9fcf695de96ef4dc84f016ceee2f9651e3b80bfef4
__label__
cccc6cc6c6cccccccccc6cc6c66cc6c6cccccccccc6ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
c6c6c6c66cc6c6c6c6c6c6c6c6c6c66c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c
cccc6c6ccccccccc6cc6ccccc6ccccccccccccccccccccc6cccc6ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
6c6c6ccccc6c6c6ccccc6c6c6ccccc6cc6c6c6c6c6c6c6c6c6c66c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6ccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c
c6c6c6c66ccccccc6c6ccccc6ccccccccccccccccccccccccc6ccccc6ccccccccccccccccc6cc6c6cc6c6ccccccccccccccccccccccccccccccccccccccccccc
6c6c6cccc6c6c6c6cccc6c6c6ccccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6cccccc6cccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c
c616c6c6cccccc6c6c6ccccc6ccccccccccccccccccccccccc6cccccccccccccccccccccccc6c6c6cccccccccccccccccccccccccccccccccccccccccccccccc
cd16cc6cc6c6cccccccccc6ccc6ccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6cccccccc6ccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6
6016c6ccccccc6c6c6cccccc6ccccccccccccccccccccccccc6ccccc6ccccccccccccccccc6c6c6ccccccccccccccccccccccccccccccccccccccccccccccccc
c01c5c6c6ccccccccc6c6c6cccc6cc6c6c6c6c6c6c6c6c6c6ccc6c6c6c6c6c6c6c6c6c6c6c6c6cc6c6ccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6
c01c5ccccccc6c6c6ccccccc6ccccccccccccccccccccccccc6ccccc6cccccccccccccccccccccccccc6cccccccccccccccccccccccccccccccccccccccccccc
c500dc66c6cccccccc6c6c6cccc6cc6c6c6c6c6c6c6c6c6c6ccc6c6c6c6c6c6c6c6c6c6c6ccc6cc6c6ccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6
61105ccccc6c6c6ccccccccc6c6c6cccccccccccccccccc6cc6ccccc6ccccccccccccccccc6cc6c6cc6ccccccccccccccccccccccccccccccccccccccccccccc
d101d6c6cccccccccccc6c6ccccccccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6cc6ccccc6ccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6
510056c6c6c6c6c6cccccccc6c6c6cccccccccccc6c6cccccc6ccccc6cccccccccccccccccccccccccc6ccccccccccc6ccccccccccccccccccccccccccc6cccc
0100136cc6ccccccc6ccc6cccccc6c6c6c6c6c6c6c6c6c6c6ccccc6c6c6c6c6c6c6c6c6c6c6ccccc6cccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6ccc6c6
0500136c6cc6c6c6ccccccc6c6c6ccccccccccccccccccccccccccccccccccccccccccccccc6c6cc6c6ccccccccc6cc6ccccc6ccccccccccccccccccccc6cccc
0500136c6cc6cccc6c6c6cc6cccc6c6c6c6c6c6c6c6c6c6c6c6c6c6ccc6c6c6c6c6c6c6c6cccccc6c6c6c6c6c6c6c6c6c6c6ccc6c6c6c6c6c6c6c6c6c6ccc6c6
050551cccc6c6c6ccccccc6ccccccccccccccccccccccccccc6ccccccccccccccccccccccc6c6ccccc6cccccccccccc6ccccc6ccccccccccccccccccccc6cccc
050551c6cccccccc6c6c6cc6cccc6c6c6c6c6c6c6c6c6c6c6c6c6c6ccc6c6c6c6c6c6c6cccccc6cccc6c6c6c6c6c6cccc6c6ccc6c6c6c6c6c6c6c6c6c6ccc6c6
6d0551cc6c6c6ccccccccc6c6c6cccccccccccccccccc6cccc6ccccc6ccccccccccccccccc6cc6c6ccc6ccccccccccc6ccccc6ccccccccccccccccccccc6cccc
0500136cccccccc6ccc6c6c6cccc6c6c6c6c6c6c6c6c6c6c6ccc6c6cccc6c6c6c6c6c6c6ccccccccccccc6c6c66c6cccc6c6ccc6c6c6c6c6c6c6c6c6c6ccc6c6
61010166c6c6c6ccccccc6c6c6ccccccccccccccccccccccccccccccccccccccccccccccc6ccccc6c6c6ccc6cccc6c6cccccccccccccccccccccccccccc6cccc
5100136cccccccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6cccc6c6c6c6c6c6c6c6c6c6ccc6ccccccccc6c6c6c6cccc6c6c6ccccccc6c6c6c6c6c6c6c6cccc6c
610101d6c6c6c6ccccccc6c6c6ccccccccccccccccccccccccccccccccccccccccccccc66c6c6c6c6c6ccccc6cccccccccccc6cccccccccccccccccccccccccc
65d5165cccccccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6ccc6c6c6c6c6c6c6c6c6cccc6c6c6ccccc6c6c6cc6c6c6c6c6c6cc6c6c6c6c6c6c6c6c6c6c6c6c6c
65d50516c6c6c6ccccccc6c6c6cccccccccccccccccccccccccccccccccccccccccccc6ccccc6c6c6c6ccccccccccc6ccccccccccccccccccccccccccccccccc
6d5501166cccccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6ccc6c6c6c6c6c6c6c6c6cccc6c6cccccc6cc6ccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6cc6c6cc
65d5055c66c6c6ccccccc6c6c6cccccccccccccccccccccccccccccccccccccccccc6c6ccccc6c6c6c6ccccccccccc6cccc6cccccccccccccccccccccc6c6c6c
60dd5d166cccccc6c6c6c6c6ccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6ccccc6c6c6c6c6c6cc6c6c6c6c6c6c6ccc6c6c6c6c6c6c6c6c6c6c6ccc6ccc
d1d1d15d6c6c6c6cccccccc6c6ccccccccccccccccccccccccccccccccccccccccccc6ccccccc6cccc6cc6cccc6cc6c6cc6c6ccccccccccccccccccccccccc6c
6577d15d6c6cc6c6c6c6c6ccccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6ccccccc6c6c6cccccccc6c6c6c6ccccccccc6c6c6c6c6c6c6c6c6c6c6ccc6ccc
6c76d15d6c6cc6ccccccccccc6ccccccccccccccccccccccccccccccccccccc6c6c6c6cccccccccc6c6c6cccc6cc6c6c6c6c6ccccccccccccccccccccc6ccccc
60dd51516c6c6c6c6c6c6cccccc6c6c6c6c6c6c6c6c6c6c6ccc6c6c6c6c6c6c6c6ccccc6c6c6cccccccc6c6c6c6ccccccccc6c6c6c6c6c6c6c6c6c6c6ccc6ccc
66666655c6ccc6ccccccc6c6c6ccccccccccccc6ccccccccc6cccccccccccc6c6c6c6cccc6ccc6c6c6c6cccccccc6c6c6c6cccccccc6cccccccccccccc6ccc6c
dd77d15d6cc6c6c6c6c6ccccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6cccccccccccc6cccccccccccc6c6c6cccccccccc6c6c6c6c6c6c6c66c6c6c6cc6c6c
556761153c6cccccccccc6c6c6ccccccccccccc6ccccccccc6cccccccccccc6c6c6c6ccccccc6c6c6c6cccc6ccc6c6c6c6ccccccccc6cccccccccccccccccccc
dd5dd1dd16c6c6c6c6c6ccccc6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6c6cccccccccc6c6c6ccccccccc6c6c6cccccccccc6ccccccc6c6c6c6c6c6c6c6c6cc6c
c67761153c6cccccccccc6c6c6cccccccccccccc6c6c6c6cccccccccccccc6c6c6c6cccccccc6c6c6c6ccccccc6c6c6c6cccccccc6c6cccc66cccc6ccccc6c6c
d777650516c6c6c6ccc6ccccccc6c6c6c6cc6c66c651cc66cccc6c6c6c6c6ccccccc6c6c6c6ccccccccc6c6ccccccccccc6cccc6ccccccccccc6c6cccccccccc
d77765055cccccccccccc6c6c6cccccc6c6c6c6c61dd5d115cc6ccc6ccc6cccccccccccccccc6c6c6c6ccccccc6c6c6c6cccccccc6c6cccc6cccccccccc6c6c6
dd77771dddc6c6c6c6c6ccccccc6c6c6cccc6c5151515100136ccc6c6cccc6c6c6c6c6c6c6cccccccccc6c6ccccccccccccccc6ccccc6ccccc6c6c6c6ccccc6c
5777771dddccccccccccc6c6c6cccccc6c6c01515151510013105ccccc6c6c6c6c6c6ccccc6c6c6c6c6ccccccc6c6c6c6cccccc6c6cccc6cccccccccc6c6c6cc
0d66d6566c6c6c6c6c6cccccccccc6c6cc6c105d516751510013516c6cc6c6cccccc6c6c6ccccccccccccccc6ccccccccccccccc6cc6c6cc6c6c6c6ccccc6c6c
1677771dddccccccccc6c6c6c6ccccccc00151515101dddddd5501cccccccc6c6c6cccccc6c6c6c6c6c6cccccc6c6c6c6ccc6c6c6ccccccccccccc6c6c6cc6cc
5777771ddd6c6c6c6cccccccccccccccd1d1d15dd76d766115c5150016c6ccccccc6c6c6ccccccccccc6c6c6ccccccc6cc6cccccc6cccccc6c6c6c6c6ccccc6c
c6777711666dccccc6c6c6c6c6cccccc5dd1dd167766666c6d1d50001ccc6c6c6c6cccc6c6c6c6c6c6cccccc6c6c6c6c6c6c6c6cccccc6ccccccccccccccc6cc
5ddddd0101d6c66ccccccccccc6ccc5165d5167777777777775101011c6ccc6cccccccccccccccccccc6c6cccccccccccc6cccccccccccc6c6c6c6cc6c6ccc6c
6677771d7c5c6cccc6c6c6c6c6c6c5515101dd76666c6657cd661010105c666c6c6ccccc6c6cccc6c6ccccccc6c6c6c6cccc6c6ccccc6cccccccccccccccc6c6
6777771ddd1c6c6ccccccccc6c6cc60551d7767676767657cd66601515156cccccc6ccccccc6ccccccc6c6cccccccccc6ccccccc6c6cccc6c6c6c6cc6ccccccc
76767655dd1c6cccc6c6c6ccc6cc01d15dd76d76d76d76d76dcd3d05105ccccc6c6ccc6c6cccccc6c6c6c6c6c6c6c6cccccc6c6cccccccccccccccc6c6cc6c6c
666666666656c6ccccccc6c6c66001d15dd76d76d76d77666661c615111c6c6ccccc6cccc6c6c6c6c6c6c6c6ccccccc6c6c6cccc6c6c6c6c6c6c6ccc6c6c6766
776666615d5d7c6cccc6cc6cccc11010d76d76d76d7676665661c65015156cccc66c6c6cccccccc6c6ccccccc6c6c6ccccccc6ccccccc6ccccccc6ccccccc676
dddddd50d7d566c6c6c66c6c67661d01576d776666666666665661153c001d6cccc66cc6c6c6ccccccc6c6c6cccccc6c6cccccc6c6c6c6c6c6c6c6c6c6c66766
776666615d55766c6c6c6cc66c6c51dd5d6d566565656565657655dd000151c6c6c6ccccc6c6ccc05cccccccc6c6cccccc6c6cccccccccccccccc6c66c6c7660
50d5dd511d167667666c6667c610155065576d77666666666565656500151c6c6c6cccc6c6c6c6c6c6c6c6cccc6c6c6c6ccccc6c6c6c6c6ccccccc6c6c6c66d0
776666615d5577666666667661151d5dd76d76d7566d65d55656c63155dd1c6cccc6ccccccccccc15dc6cc6c6cccc6c6c6c6ccccccccccc6c6c666c6c66c015d
dd5d56d50551d77667777777775101d56666566d65566dddd167d167d1dc0cc6c6c6c6c6c6c6c6c55c6c6ccccc6c6ccccccc6c6c6c6c6c6c6c6cccc6c67d0d56
777777770d550551d776156766156d766d6761ddd5dd6d6056766677c5d0056ccccccccccccccc66c5c6ccc6c6ccc6c6c6cccccccccccc6cc6cc6c6ccc6c1515
66666776566c0ddd1666d157760055d777666666651555116167d677d1c501cccc6c6c6c6c6cc655d5ccccc6cc6ccccccc6c6c6c6c6c6cccccccccc666d75001
6666666611511d16766765566d500057776676ddd505d51157766cd511575d6c6c6c6ccccc6c6615016c6c6c6cc6c6c6c6cccccccccccc6c6cc6c6cc676d1d00
767777765ddddddd7777666671015516dddd7777660001115ddddd776d55dd66c6c66c6c6cc6c6111c6c6c6cc6c6cccc6cc6c6ccc6c6ccccc6cc6c666c6d1d50
ddddddd615dd5d5d66661dd77661151d6766766d510013d567767676765505cc6c6cccc6c6c6c6ccddc66cc6c66c6c6ccccccccccccc6c6ccc6c666c6d601d00
777777770d760055d777d6d657777766667761115110001ddd55dd5ddd510166cccc6cccccccc65dd5c66cc6cccc6cc6cc6c6c6c6c6c6cc6ccccc66c6c601d00
dd5d66d1015dddddd777d6d65777776666d7715d11d50013d5677677c5d0056c6c6cc6c6c6c6c6055167cc6c6c6c6c6cc6c6cc6cc6c6c6c6c6c67c6c67611111
7676767655dd5515ddddddd65777776666d76d6551566ddd5775666665165d6c6cc666c66cccc1101016766c6cc6c6cc6cc6c6cc6c6ccccccc6c6c6c776d5500
76766661000100151515151d06d66666d666ddddd566666561676655d5d60116c6cccccc6c6c1015500166666c6dc6cccccccc6c6cc6c66c6c6c6c666661dddd
dddddd515ddddddd555d5001177777777757776666d76d65d6577777116551566667c6c6c66001d1560151c6c6c6cc6cc6c6c6c6c6c6cccc6c666c666765566d
666666667777666661676d661dddd65dddd76dd5dd6665d50ddd1666d100151c6c6cc6ccdc05d5dd561d5d666cc6cc67ccc6ccc6666cc66c6666c66777765d50
77776666666555510013d5675777777777ddd510015dddddddddd5dddd11d66666666677c61d5ddddddd566667c6c6c6666c6667cc111c7666c6c666666001d1
77776650d576767655dd55761dddd65dddd76d6d76d77777777777776615566667c667c661dd56dd566d51677766c6ccccc66c6c606d51677766666676001d50
77776601551d5ddd010015151515567777c777667ddd515ddddddd55d5500117777c6c6c755ddd17566d6556777766666666666c0555156d6777c7776515d665
667760555155d5dd0155651d5ddddddd50d777666100015056d505515175d0dd6777777666565656ddddd56777666666667777c70555156d6777776601551d00
6666d155ddd5dddd0111d5d666ddddddd115501561110d51ddddd5dd617775d77667776c611111111150001d77777777777777775777d5677766666001d10001
777766666d6666666515556666d7777777666665d01555677766d51055dd5567777777770005d5dddddd55d567767677777777775777d567776666100d6dd5dd
7777777777777777610d6dd5dd515155655677776661dddd1111111111505116666666100d67776666615d55776677777777776ddd766d5dd777d105515511d5
777751d65dddddddd0155567775d10155051151d6766766666d55d55110d6d6615667d51556677d1d67766750051016677115551d776765d66d51055dd550566
667d5177777777776ddd7ddd65566d65d55656515ddddd667677765ddd05d5d5aa5666dd77777777777777771155ddd7616666115dd5d55666505515dddd1515
66666677777777776655d56776ddd5ddd1d6066d15555515dddddddd6d501114aa45556775d776677777777777766155116777775777d50d505515ddd65d0015
dd5515ddddddddddd105d5dd66155055dd5515ddddd6dddd7651d51d6d50d615aaaaaa456dd776765d6661ddddddddd56015dd6d077761110d51dd60ddddd665
dddd5577777777776ddd7d77771d60d5d05155661515dd5177656666777661d54aaaaaaa56776675155d6015ddddddd7d15555d5177761110d511676dd76d76d
6ddd5577777777776ddd6577765dddd555dd1666d1001505766167611111d754aaaaaaa4a1d505515155776677777777776d1776d777601510101676567655dd
515101dddddd66666d5665656d5575515ddd576761dddd6d65d56666d161151aaaaaaa4595dd6666615d55155d1dd56666661d5dd76d11615d677d6656665055
110150ddddddddd55055157777510101555551d65ddddd7d6665d6755d7d511aaaaaaaa55d77777666dd005555555555565165d55d5555d5dd5561665776d5dd
dddddd77777777776557d5666655d555d0000566d155dd6d6761ddd5dd7ddd5aaaaaaaaa50dd5555555555555555555555555165505d50156d5d66661d7d5155
5ddd51d667776666615d55d66dd5ddddd05656dddd01667d7dd55dd66d71551aaaaaaaaa405510155556767677666655dddd015151d5115766577d6dd675dd7d
7777777777777777610d6d577666610001565777666ddd6d6761ddd5dd60151aaaaaaaaaa5d5ddddd6d76d76d76d76d7776515d665d05517d66666665775dd7d
777777777777777765151505d5015111655156d6dd55dd7d777567666d75105aaaaaaaaaa5777766d6776661ddd15dd76dd51655d5dd6d6677677d66667d5d66
667761d666dddddd515676d66615616551561d66ddd65dd67d01661d766154aaaaaaaaaa5d5dddd6777755d677667660100d6dd5516d6657d7676676667d5d7d
667d55dd55155566dd7777d776115d7d5057d7d777d5517d77d16d5151654aaaaaaaaaaa56615ddddddd550115551115dddd1111657d666666667d77666ddd6d
7776576677777777d5d77655dd000151101665d66155517ddd656d6d665aaaaaaaaaaaaa56d55055156d0d501111dd555555056d657d666666667d77d7715d7d
777777777777777765d777501015611101d76d56751115dd6d5d666665aaaaaaaaaaaaaa5556d5666666665576766d676176677d757d776666667d7651d05555
d5ddd6777777777765577661d6d06160156677dddd5055666661d76dd4aaaaadaaaaaaaaa5655065d50055555555555d016dddd1d5dd5555555dd55515dddddd
7777777777777777777777765ddd61601566d75001515dd5666dd6665aaaaa54aaaaaaaaaa56d5555155d5dd5055ddddd0151515556dd55ddddddd5501676676
777777777777777777767775105d615ddddddd0d6000011150500015aaaaaa4aaaaaaaaaaa565555100015151500d1d6565515ddddddd6666666666655d7654d
7776d7777767777777777761dd555167651555de611111555515dd65aaaaa5aaaaaaaaaaaa4166df66dd65d7776677667777616761111155555dd55515dde4e4
55dd55156677dddd505511057511515eefd5dd1d60d515dd5d016665aaaaa5aaaaaaaaaaaaa5566dd5ddd5d677d1dddddd66d10555d5556777666666d55ee4e4
77577755777777d11555dd55e45e4155ee6d5555555555555555eed5aaaa5aaaaaaaaaaaaaa5a56dd5dd6666777766667777655655de6111115555d55d4e4f4e
761d75156d5d5d5001515dd566451515dd6555d5515101dddddd5505aaaa5aaaaaaaaaaaaaa5a45777777777777777777777605661111015dddd66ddd505d5dd
7766664d54e4e4d5444e4f4ee4e555dd55e45e41451515ddd4d4d4d5aaaa5aaaaaaaaaaaaaa5aa5666ddd167777766d567776666100175561d667766d51ef44e
6fee4e4e4e6dee45111111115551151505d65dddddddddddddddddd6aaaa5aaaaaaaaaaaaaa4a5d655dddd0151515765577661d6555555015ddd776615566667
fe4e4d5ddddddd5d055055151015554d54e4e4d544d44d4d4d4d4d4d5aaa5aaaaaaaaaaaaa5a4566ddd55550000001555676767766cdddd001555555555dd5e6
d5ddddd5dd5151511005d5dd55dddd5ddd5555555d4dde4fe4e4e4e4e5454aaaaaaaaa5aa445566c6d15e515567661d6555555d155dd6dd0dddcdd6d151dd646
d444e4e4e44e4dd544d4dddddddddddddddd50141515dd55d5555d5d65544aaaaaaaaaa5a56766c76d6d6d77dddd6776ddd5ddd100151515c6c6ccd1010015dd
ddddd5ddddddddddddf4e4e4ee4e4f4e4e4e4e4e5555defe4f4f44e454aa4aaaaaaaaaa51677c6666cc66c6666666666c66666d155ddd5dddddcdddddddddddd
dddd455d4dde4fe4e4e4ee6d555555555555ded4ddd1d66feffeefe65aaaa54aaaaaaaaa566d6d6d77ddddcdc66cc6c6ccdc666d5c77c6ccccddddcdcd6655dd
dddddd515ddddddd555d5d55155dd55dd5edeeeed4d46ff6d55515dd5aaaaaa54aaaaaaa456c6c6c6cd6ddd66dd6dcd6c66c6c6c6cc6cdcdcd6ddd6d66c76d6c
4e4e4ee4e4e44f666656ef6d5dd76dd5dd6665d5d4d566451515dd655aaaaaaa54aaaaaa411d6dd5ddd66cccdcddcdcdcd6ddd6dc6ccccdcdcdddd6c66c6cc66
e4e4e4e4eeef6f6f6776776651670055115055dd000151610d6666665aaaa4a4554aaaaa415d6c6c66c6c676d6c66c6c6cddcdcd666c6dcdddddd55c6c6cdddc
5ddddddddddddddddddddddd505116cdddd001d65511d55055156ddd5aaa1115675aaaaaa116666d667ddcdcdcddddddddddcddcdcddcdcdcddcdcdd6c6cdddd
6666ef4f6666666666666661ddddc66666d1510551015ddd6050dd5d5545d667775aaaaaa51ddcdd6cdcdddd6dd5dcdcdcdddcddddcdcdcdd6c66c6c6cdddddd
ddddd5dddddddddddddcc511677dd67c676005d5dd555555c666c65665551677765aaaaaa51666c666c6cdcdcd6dcddcddcdcdcddcdcdcdcddcdcddc6ccc6cdd
d6ddd5d77766d66d6ddddd50d76cc66666d155ddd5dd50016d6c6c66d5dd1d6677159a4a45d51d6c6cdddddddcdd6dcdcddddcdcdcdcdddcdddddcdcddddcdcd
6ddddd6c6cc6cc6c66c6dc6515d6666666151d666ddddddddd1515c6c6ccd15dc664555555615dddddcdcdcd6dddcdcddcdddcdddddcdcddcdcdcddcdcdcdcdd
cc6cdddddddcddcdc66666d155115dc6cc155dddddddddddddddddcc6c6ccddddddd6651015dddddddddcddcdcdcdcdcddddddcddddcdddddcdcdcddddc6cddc
dddcdcdcdcddcddddcdcdddddddddddd155065d5dddcc6ccccc6cc61cd6c6c6cc655d5dd6d6c6c6cdddddcdddcddcddcdcddcddcdcdcdddcddddcdcdcddcdddd
cdcddcddddcddcdcddd66cc7c6c66c6cdddddcddcc6c6c656c6cdcd6c66c6c6c6cd500dddddcddcdcddcddcdcdcdcdcddcdcddddddcdddddcdcdddcddcddcdcd
dddcdcdcddddddcdcdcdc6c6c6c666cd6c6c6c6cd66cc6cddcddddcdc6c6c66c6cd105d5dd66cddcdccdcdcdddddcddcdddcddcddcdcddcddcdcd6dcdddcddcd
cdcddcdccdcdcdddddcddcccdcddcdcdcdddddddcdcdcdc6c6ccc6c6c6c6dcdcdddddd6cd66c6c6cdddddddcdddcdcdcddcdcddcdcddcdcdcddcdcdc6dcdcdcd
dcddddcdcddddddcdddcddddcd666cc6cc6c6ccddcdddcddcddcdcddc6c6c6c666cd6cdddcddddcddcdcdcddcdddddcdd6dcdcdcddcdcdcddcdcddcddcdddcdd
ddddcddddcdddd66cdddcdcddc6666c6c6ccdc6c66c6c6c66c6dcdcdcdcdcdcddcdddcddddcdcdcdc66dcdcddcdcdcdcdcddddddcddccddcdcddcddcdcdcc666
cddcdcddcddcdcdcdddcdc6cdcd6c66c6cd66dcdcdcdcdcdcd6c6c6c6c66c6dc66cddcdccdcdcddddcdcddcdcddcdcdcdddcdc6dcdcdcdcdcdcddcdc6cddcdcd
dcdcddcddcddddddcdcdddcdcdddcdcdddc66cddcdcd666c6dcdcd6ccdcdcdcdcdcdcdcdd6cdcdcdcdcdcdd6cdcdcd66cddcdcdcdddcdc6cdc6c6c6cddddddcd
ddcdcddcddcddcdcdddcdcddddc6cddcdcd66c6c6c6c6c6cd66c6cddddcdcdcdddcdcdcdcddcddcddccdcdcddcdccdcdcdc6cdcddcddcddcddcdcd6cdcdcddcd
dcdddcddcddcddddcdc6c6ccdcddcdc6c6c6c666cd6c6cc6c66c6c6cc6c6dc6c6cdcd6c66c6c6c6cd5dcdddcddcddcddcdcdcddcdccdcdcdc6cd66c6dc66cddc
ddcddcdddcdddccdcddcddddcdcddcdc6dddcdcd666c6dcdc6c66c6c66c666ddcdcddcdcdcdcddcdccddcdddddcdcd66c6cc6cd66dcdcdcdcddcdcdc6d6cdc66
dcdcdcdcddcdcddddcddddc6c66c6dddcdc6c6c6c6c66c6c66c6666c6c6c6c6c66c6c66c6c66c666ddcdd66c66c6c66c6c666c6c6c6cddcddcd66c6666666666
dddcddcdcdcd6c666c66c66c6c6c6ccdcddcdcdc6cccc6c6ccc6666cc66c6c6c6cddcd66cd6c6c6c6cdcc6cdc6c66c6c66c666c76d6c6c6cddc6c6c676777776
__gff__
730e156e107675fa070861c69ceca9129298d46723dbdb12fefc6bf87c8698e7e7624ae116872378b64a11db919fc10dbfb273ef295638ec4ea904edf84ca28a9edbbd956a95549096dacc4642579934484e2d62bb9b1930e25b7835eb70d683f370a4736525a408dbcc4d5d0b18033475a8568ba03adc269e157636aacc69b2
f096e546f0104a03f485249dbbd3a1d9ebb9593b79e16ed30aa4637aa72af2eea470d7364771f614d0dbde6e38828959011f1903d4d9e233eddbb9f0cc26029ced4bd8aaa45b8c61246f627ec22f65ba3e4e94f2cfc08588d2469a5f28c68408e5e14c1c5d2e45a02087c46b75892aec2a2930f65b07dca2eaafe75c037afe28
__map__
ec8b2e04c55b7fc0480208bf11b167fc990a87ed09172713d3b457dc263b9d342948df1af521638b02d6f76c010de5b7d49fee2eef6ba76d6a959036fbdaab1a1622ed606b119eca6d87553536e84929de0ea8e2a00d743541ef608dd38669c0d5b9d7dcf051ac496e250dfacbdb49184e4e732a162448dcdf602591647b4f8a
0ed187b68cf7a83be4e7dfb7d4613b2129cc28fdfaad7d0daf5c16edfb8d2fd43a0ab262ecb11c9c4f450f4e7971eac49e5a83dacf6b58ae490ee3a811d803c710e3569ab29d1f494dd192c379bbbb817f61ff965bcfd26f2f346d159bf85c4f5ca4f7b34dd38ce404711fc3803f0f51c5297cffa52dcbe5f7ab6a7dfdbb46ee
18cdae96d7d4be6881fdb1b4ebea529bfbd224f5493f1d5f6a5b77de0e049eda6cc121cf074468452d3e78ece7c139b5ed164ab0612b80b828e56b07f6c0b544222ca783746ddd9f60c605f49ff2cef69eff9a5a53bca3b82d75fe61c46e064d10da3fd6a663a43e01bd9eb6b9cd894089b9fb7ccf6e72241e194fff5e14eec7
e4025478de28f66d349e8fb60d848d4c7f1a14e13ecf6936845c6d8e574377ba6d132cb65cde301082d3c67e3bd8e166f5f3654edb10ecb4a6265820fd7264b0cef4893f6df253c1363e999fcfe7557b34dec3552e42949654c7b69ee5800493db7d9c6d1fd38925060122b3c64eb595aa7b43eeb198487d6dc73dd71fb33977
439497e8f7faede98ffbf76f9260bf715b6a82d89f3f8afd5164616f64c6fc950d7fd42732f55443aa009f46e8c10976d7a9c9b377c57602f2acc4838e7483ab676129ee9857436abc436aca76552ebd6ee8db543fec9ab7d344ebccd0d3b4831dacd095c97e11a5aa32963c3f520faee24d03712b384ef058adb61a885f5356
69bad88258f339f11d48a1b17fde9f8efdf3b86d232d8f7623318234a9e77e184bfbce5f7b2b0fb634db662c7bad39e9f68d6b7138ce0d9df8c30d8aa043c909422bb4517beea16639540dfa308ddcd8cfebf2bdf0ec0623655a3185b8e6e96b2781b8e85a331c0f3b9b8112af0abd640db6934c3d8b40df837c1f9aa00dcf0f
c820f58c43bbe18b28d374e7dd357f10bf4a2d08b3fd2ae9ab472404df2436907f68540016d8ce491b4a1b9e91bd831e08849ca41ad87b1ceed7f3374dbda96c7b93f04d526a33d58dac9496bcfc3e30c43e6304d0e6078de4db418a5433c8f7a88cf3db7f92cf4b1ad490f3c66c3e3059157e3c059feaf7d4797b615ff67879
2ddd80e74de176928c74de783ca0a4d91cc908c66d330ef64f133d7f14dea7024be8a78c952b8f449b0a55a751383f72a38fbc53835e71d159a4eb797751e43efa81fb7be804fcf74908cc1890435fb3ef5dbe761263b375d93619442ede058ec2a949de57b54b7e9e0046a39d00db7b82ea5e23fcaed7765d1ca07e9fae1e24
6054a329fd8d7db38da9f19d12658b598aedbc209d6f0f13203f7ad72ea211c7211354c31b9c3eb7cda198edf0d838a6224e77f47e33e1144833c576bd59cfed0da0a2a4e049f28a1cd45a4940eb9048a6502d982b3faedaeb71c387510c067593ba37a449def60710eba6cb42f9b77a8c369d6948cc01a0bad632926455ab75
575b0707418bbe856b7b79e6d181e349a0d1d03284104e78a3927d0314f9aad871f8d57ae9f918fda999f34566472a8d72477cd3740433ff10f4162c62fb5a0d9fb1d26d6720a786ac66dd566efba4eefe4b63a9b88ad86c1fe28491089572a1ea6988054fa0e9e59d7f1dbf9c97f013170a0d3a05c22d2aad309bdab96a73cf
e754b0a8d6256b6cd8a3a3a6f58db55bd3670eedba290b68920f22d751819220f99e281a7cddfefe0039fd4824e3a9a6d87e5b30da0b830835a6027a6bb9713b199eef57f9b344d0d5e2cb9341dcb0e744dcffda88e3e8975655fe01bdc21fdb96a8d1b1275f7a52a0dbcba5ed237fdfeae340aceb72cb8606d4585413e786fe
b6a9e68825daaaaca6fced7cb3ed43fd75e3ff612a9c8e532f55013dc84c73c90fedbba7b70f64d7c07800e3dffd66821aae38301724777d7c3b9524c08ca1e0315f44247a73fe0defb4f907feace6eeb7cdbd52c390fb93aa518337827802bf29c8264fc7baf6cc392d4e0179ab0ace7134adbdd782730bed52e24af2e1415f
3ff870e5a269ec48639be8a7adf7d88ef7eaa69fc37b4bed6067a0dde8efcd344b0793436e7b248031f421b6ce30fcfd4abc4f15ef27fef7ad70296beb5b7fd223a74e86ad8d30f34bf1634006fcd100935c33deaeef85070afdb68e6f03e5c86a87e7950bbe229da3ccdf6f97a13564fcbe105418c1ef9b8973f457234b3f1d
6b32febf0d9fa1bd370bbe895e42868cabfcd92e798ee1c32848a391ef8b877da2463df8ea6d30e6ae41d0df6af67fbdbe68d9516b60850fe900ede250f46ceb92d87f0f5a418de0246b2b8c77da08e31368b9f867f3c1410e0c1e1ab50abe6b68d8a32d0d7f905e50aa37cd6184bedf1fd1d7128a93b0d507106c2ecb8b253f
97a239c233a342d05bdfcbed7d45e141f86a6aedbb953bc816f0034f33b6bd74e5adb64eee7f0218dec167c045c2efd70de5c718e6638ff6053d9386ede726be97e4efefb2cac8cb6dfc289277c23d44c1dfc247e90594c3de08673fec78e0d1efc48c5de4a4829fc76d79a09ebbf02952010303bf77d6cc7f13b53f6c85af2b
400f7970afaf3da475517ce7cec1fb83c25db73897c00c18d78aef0f31d67cc2f4b1a14c7f19866d45c6f1b071a34f7a55fe6c164dc8af0d19b78b5eba13c8f3636fc8fd34bc4c666f8e1b3103252da41d220b93c8bf3ac13b23429ebe56380cc455f0adacb61d171403552349dcfeaf86633b01be3d8cffede463417e65da2e
28ab771a05e4b4fd135123749d504f4a65510403b63d78f2b16014073bd1928da19f939bb6bff3e9dc8359aa9f1fd5a43cb76d94bdd42cbe9107e1f61d2bc20784c05e0a7605c7c6b48a7fdf99aa0e830994ac1aae1d2440edd1363fab23e3f77980e5ca4862a8f7bf57341e65be3cff3eaaee57c7743b1fd3677d2e8cba033c
06a5fe1f9cccf759e07ddf6d8ffd561f98337f93e3320886bc3792ca374a6e7ee150404e70a96d071fc91eab1f67190f63078710daf6b976f9735f1494d1fd95e9ff7bc367d6289cc228700711e74bb7ef0130aa4ab7edc5af901f85a6fb5927fbef0753ab180f06d949f52be4c434948d06b6993812cfaac3ba6a53f888f069
d4bc61fefe3b86ddfaa77733bbf40b6de8b7b3ec0e3902010fed8ef0d0170af167a092e32a44fd236b10fe5217d49691f5e093ebf80782ed46df2f09ff04a05ffea8ee6d6f8f804de3eb0dc08d24fc92eda74041be5f50844581781af9bdf40f0e7bfccddb51748560d871992f018a7c5554ab55f3d73f8dafc2dffed1bf7489
838d270fc093bcf91ecb4db2d2a7fd825a3ddc0addb5370b025e78baf6a3007c4d3a72d1779c57c679d8c22776a68939a2df8f88634394e7fd5ef0cf5a7d1c88fbbe5f275072b99a3fb5f421a1f1f1769890aea1872b3f2cc4416d19fe0ea6ed3e7519ede8f6ddc276d4728a3b960a54b7a3e10f15c2a736df842db8211ec848
2072f1b7ef9b899fc0fb57a35abdd08b17b94d7cac408ffc4bf4cb004be888c70e18bb0357bb53c05fd959fff4d57d5dd4602f0e0270d4af2ef2fc47847a2dadd5c6ec81f4072a030354023570bc0aff8e2bd2467838d4fcecc26fab93c3fb933450aa2de750b7b7fbb9542df2f780e040710c8a970dac9cc622721b161bbfc8
1bfa46413e044b0ddbb1cbc307f0b7d88b2858bb1ab5fac2183e521d36db5d82c3a2958eeb52abfd981b6834facea133b8cbdbd5d10b6d80bbf6f6d86296a4d8fc9b1349b5564b7bb5bed5ea8358fe21a2731ca5250ed5f9fb0203de2db9e11f70217850142b8bcdc5006b45e3d74ff1e08c2dfc056c04d5fe7c6828a6135776
83a06457228ad21cdbe37abc5bc7dfa33160b601f778a1b134be5a4bd33c1e76c692976a03b6a81d0dc5efc1efd1ac8f9711f53594de0fe2bc359a2fa1baf0dbe9f716039d8d2954efceafb61c1455c0d5ed5681db8c1be8824bcd23deae26b96f40fa7bf04bc2e057d38e8e3cae55569f039478ee6a34d8808b667202c92d35
ccd554ebdb03b1980caadce1cd510df95a9ea8067cf7de5597850c72f320059cd5153c13c7a3effb336ca3ba94615e7423de46152b95a1d38ae2100b657375bc4a3b8e8a4b0cfbc8782e17fe356cf80d07d46830783a6fdfebe5dc12eee5946b8d4b68e5d6dd39fe2ad4334554bb7894d60a04b2eb304f0bfc29b9a246b55e97
aaadcf3939fcebd158f50c623780d6323b8da2328f4fabc78d82f0dbcbe543f8fdbf01e8c6113f5f5469e4571c1daa7537df6e9c635f017e72c3e5fd85fb1b105fa9a26f94d816acb13b962ac1a649491d8e5c2fb8baeb120727c60173162758d8201a6a8f1620e4c0e7a0f85056fce93f071f02d86c037f095de8485cd5d9ea
6479874abfb9b35162c2db1027c92d6f8f1f5f4a2002e75828fee20401312f78457a8c2efe56b7b7918579d7091566351aacecf959c1db0f781e9aa1056f6d47254425684e86bd2a6a27be56d64a8296ee60cb73e4f01ad1601cc71415fdd2f87c4c726b14caa38a4f17db7502fe34a17ff875bb9f1fd56a35d976f63dc69e07
08bfa00e97150bf940efb472df3a57f2e097e6e7730d04af9955ba304c6f20e2a4cdc1fd19f00951419a8dbea2c88dc471bd0a4dd4a8daf77c2f1780918d71b5c49da23faad316657560099a8ce151abce39a66941ac026638fcfafd9f73bf5803f53dde642cebc2be28ff08326920e621c0bf1a56921df00a109efbb50916ea
c3908054b59e1b13558e5cc1d4e0502fb363b70a310e2ad341383a148b488e8bf5ac8a3cca4b0412914279d0e30562c27675bc0bbfe3348e51ce7d520659d58a18580a28c1a2ec2be184ad48bad5147b3db5f0618f4431f328e1c05b116fcc0fe9ef4660f111b8d5528ae811fd673514b6f97ad13b2e1a6db7723eb21a75a2d6
7916066040cfc5ae927cc85d77b32015b85c318edbf47ee13d9c3b770b11efe41be109173acee1f7d3043c4873a983d6c48d2aee0e3692fe1c0178e6a61c503cf7211c0d72f7eca13902bbb9b783f72c51aa2db41d506d70dde715a2ead671e2e0788a8fbba7e22afe5da836a027181e206bebf495a6bab2684cff8da8a8ef00
41acd557e942b78412b6febc3f2a2a4919bb46957740b6a16d9c7fa6153176c5b8175043a1b4905844a4d32908c1557c27b34a56f58a886d9686fcd278ff08e47f446f95d3f2219b8fe8b59d372a77a731bb1f073b3bd66f812b4ee95d1cda9776eb3463e024a3ac87f1975752acea3107a942ecc0bbd5f15fb881f052f40c40
adc4a516dd8ab00c4f7b7d7339e7870ebfd7870b6629180a9ae65a24f12e921560ea7de3a83150b8b50a23663190432f88468288c311317453d6b2b4b6efefa4365855c36a388eeac80bf6ea82760fe4b14f98e22d489de8dfb42b293b53f8d5f29056a420c90214519a690fa908278945db7253a38cd25e5e20148b501c052f
a4692fc7a32a5eddc77f9fac0e5d87028da1c89d0eca887643c75325fd2f4ccb127f8f68f26104520752a5e061f9d16150c71e51d586624c50c14a6a2e47004f044e140250c97e59959c39b924e7468a2220b428c10d76d28e730d993a2ef6f7700f1ca1a1b90a151f5692003e67c0d0dbcae05a54e7d359f0fbb6b7c923b6ce
__sfx__
ddbb7a091770e1262d1457a202353073f39122015391d701190770657a340241202f36063061792c4100026f3c01527458010083e16c3a023271270e67927741014572605a3c55318121387583e0572236e3c435
c6994c8a2c22f185321334f021793201a1a3243100b0e66b0a77e080782e3701c1102c3011740a172571b34e375410302c2461e280433f473277373113f0c2050422e122320e5020830528058280683624308513
9bc233b33b36a0c425283372d5130a2762e370066053a5582976629223366623504c057171c501175360e41f1b2030b1362570d0956824755383190465d0860b2617b131613131e283072252d2226c0561005417
9012582b296213976f233482f3481e5013a1221225a0e3693115e1070f3a0443360006344325181a471047102f2030e237155481462d3161421219287370173d292732a0440361e280111c424114561474b34106
5d7ad8bb3223f0800e3035e3044f1e45b0c2452b748254672934a0a51904453196393e2460c278111163c0173806e0872512333382670e32d1245e3b523315391055e19109207122e1681c03a046691a40d2135c
8df554193c43e2e7130e40c304462a6132175d1904f1b2590637a1a374065000110f2870526574211602f46e005042d07a1a61c1b443290271f523341243805d197011c4130f2162d538267083f64d3970a03731
cb54223d3272e152642f14e13347354213e3020046b2c72d31760370322734c0e169396380b3121136f1c46a156073d33d337022753627234212091d07a046420f62a0c37c1c1153b758181513b4531906b0f361
7e6a34473d55439058187091441a28636283193506b340020034b2b649277413f76812304367561013c294121e56235043127691d03d2700605006175151a5250654a066490c226184073253c35567045620a43f
339224cf32750267531267e137603d610386430b0342910e24068015683472a073272721a0060915731234573811a0754e06062152382670c080590006a3a06d1356727121192761662b303741222d0c62f1e025
1d70a1103d7341e575015581516a235671c366015641b3130f6483b30a3240c396103655b29430201273a5490c10d0932b1641f1310e0c43e273413a3131e62916268306680b24d3424e090071a2211701b0c03c
2de5e6b93632e0d1590b1693713a0140d394152240802344276270e74e0107d3d4313746106422323271c13f0540c0846d3d13c376012f50a162070a3133e21821568161123a3463a0371774a045462234025623
bab2939d06109167433e360134172840a27355220330f669090562c46009162040450a01e307610f5222004c1c0782326c151793762d3140c2d628115380a72c1413d260551d2231c4130d2173844b055472914f
4b90409b0b1432f5473550732256215663a17a3172a0334f1143e1a11c0647136322385071a72a020141c2530a723274681453a13300277271873a3553e0820a044273c74d2910a1315b16254254223432427642
02aad64b294503806b3a0432f5440204a1844c3a134276491601e2946c1774e3416a0c4481702b1241f0f2690d438362752a714061561c0642d634011011f21f396370a57f3167b204710770e37413156351a25f
64329fce25251262001a5180005c2b7580b322275290a565224001726d1465022130033291d0513a67f2c534136201e535134300941204266266043e63e1f63137445233520532d0f248073782963d3804f3b07b
ee89fce51421d384213a7232a1540851e3a4441d66a16739346780934d1314a134391c25006663023782f74e3c0751a021313561250822340317182003a1237c3a112394011f0730f4733930b2a24f115240c267
69589a9b010242a47a2f011342632d6460f11c2d2282e769142563a4440f0231d044310300a1082974f146702655c2a152014751f3582672d18616161512c06d00414192743b1521a2343057d256323a3141640a
0ab9a5010955f3a04d1c005052291420b2642e3d3740d10a07215204682103f112742756b2015d1d259242112110b073773a568350200632d3c6190c36b057212e03812278143471043d2246a25160081460600e
6f3c15d4091652124f330371325d1642a307592167513741133780607c164350b36b2c0200971f33513262060755c1151b3236123119044203211c2d46a155370870a0961c2f3243e13a164351806e017423c607
3b4211d532231274002a3751b1393e137053481242504742397150a04c114110e72d0c6743a028277623e57b23712082202610c020761832c266121225e282440206622239163050c00908369275610e25d1203c
f848f4261614c3741224325125680e4383a0471635a010260802c0414b3d174342792b146334001e62e212420616a080781b54d3942813471054551a200301140872d3b74f395542652a2025d112780a45a16128
24fc22e50451a3352d170701f74136317246362352a117053d546295370014f1e4070613d31059274670f2392123d087103175d3176d25064274091012d11075037202812d18464360132e761113231a03909532
a93eab012833e0243d2907e0b5601d0182f378292731257e2a4671657b2340e0526d1f3703b21c2c41a2b32e3610334646031551c1683622025213296073840f153133b6512a22835434002430360a2453607569
87e7d1c01d5350147e0d07b1a7433b0723822c1555e1b2791b025272502612d3c5263c32a1d36c21408396391103619138117302b1720677b2762b0e2281f560306632d4192540e106333c67e1520d241151b402
6cf46ab2057400213233741076721c37d21247157191a5233501f0826b22020223012c6202b460081271361c1b0243812c177482301c360070406e100543d1452256009224072023111a040003b430350701a319
a7b6233d1612e315443d0392a46004706077351c6422721535444213220161e3033609454151712c61d140633d27f25149133052832a2046e3b3630c6650a54c2360e1c4173723e370603c319005132a1600a346
aa32689a140543c24b1233f090001f7033a3183f5363e022291530f704096773e43c3075c3530e3945b115401422e343132c0632541f172570406335743053213451d1c5202727d3b40b0b31d3a2181c71307146
52a552a30e47f371761e3100f67c3e2191d559046771f06312522037302e12c05256190173c34e054233050b2b0393a352043602771a2e03a047462630810378010122a5070007e200592d47d3e3782407f30077
845fe8483a6222536a2f6733904113461120403421e2335e18619042251c07b162780812a2244a3c0463147a1c4371d4242c35d2344c380483b7460a723236393242e004610e120141172776102301023512a348
535fb97b082233c0381427e2910e1307e0414a2e0611324a0f50d3176d030562d4161114d3131709560066610a1473c2303b5202d50e1e40327066303461406609103336410332d2f5250836328203246041c45d
f7396a293d5061c10b3d664125310d701063580604d0846a1757c091512922527314165580b456117043e61c295113b61631545243743201f0316e1a0233b57e0961a1457003504035690a1543312a2232931070
99b4c2d13f14d132443506a0e3231543e0a178113320804f0a02000761325252831a1c3441a43938103250602006d2e02301670030260a6671f15e2b21b1f324373661605a09656176473c16332725205640905e
52a9ec511a6201800d2c06f291161c47a235550f64a24652125182756b0c63d0753f1f6442317b1623d346232f07a1b6613822f2a02b2233b356292034b23267220583d37c22629305643b311180180427409135
eb444e241a04d2700e0a7391630a104210c7302f36e20336391363060c1f2130c575084382c5321372c18177354012525c2300a2e42a252670534c2b62a3e0000b56b2a73f145103114c0c26b02433146441f605
e8a452033326213468213770862906674183560a6011f5253d50924629380012a75025066226101e6573e27e070161971c341470f4192a751296133d37215233384230822a323240b67e3610b353523e4492a372
c55112ad102173f57b0646c1344f1145f2b46e197273a059257540415c382330131517503082410711f271010c04d191583317e10516330191236b0376829150254691d40a030130d4311031b335713e5122d60c
4dd31ed61a32606206005000c51318248161630f77b2346f0127006213265033b6151d775253091331a1b7610a024340061e7043a02232303212102852d0c0581b6391943f1c01a166760b1261a7630750335226
2da6a199386213154e2b66411364366173d50f077682354a374531d4662a315035510a65d1d26c0a51c37570185063445e0b3020555635226371612e01e1e51030004247072e6293b47a202500350a3a62a2d331
60a80e790b45d104421760f326011e7091452a1374e282291b11c2f40d1451c0316715601204260301f0863011129172341435e132382f1532b742092702b5242b62e3b75d114132841924328370220443011432
16d6634a072180006e3e5070472e205222755a04742081433137505455172511c0561a5112a1231343f3961a21142152410756e27359052252a4581e2270754c396163b54b0637c0e2522114b396150b2632a057
89d4a39b3b35d12565021682575e3e5721160b213632345e091241072f345081477f0c700282382157c1064c157193840f1a2433c568250653d6420e21c39411244261e271353702422f320443a176252111022e
815464e90937a371562470c340483343a14034301291a7742e22d342112507c093602e7420e23c38366260422237b2a41e2e0643401d30041242643743a1f17f0e6442314b0e7140602d3c2611257f0c26a05769
1f063aba393441d347037561160a1013612321263402b5272a0630c56c0a3280766435228135230f733117640a00a1121a1862f023650817936041106220a4652943f1f637361600f3472b5320320f1d7090d674
8590c88c0b24c3b2763e3001567a2112d271541074e286152153f284232b46d1730009374182780152b3c37c302433e4272721919046105731743c1370914102033501015e36407281551c25e337611f3742435f
73384bde0303f015441012f0e31b23746357212c25b1317a251290e270070373f439272252b617257180907d2d461341213f2683610c23058051153d34e3b76a0e67e041412e73b3415a1c47c292341515a14411
613a11d23634733549077410245e00530133000a5091a1291404d1610b2c66d3121c3075322318026780915b0901212303187240c2190170b2360c09348230642f3672421b0c10c1440c2f0762470e2b01d0c77a
9cab8b931970f1a501290301e4340d14d0c37b3755412031126742a06a3f43d205762b72f335090622b1d602334010b4263d72d347341c309386002f721123593876a007053117e0d377041181022d1b10106156
8d13867a0932c1721e2b70c2a44a362053b161244263d0271614d1052a1731535125321250606b141351b70f3b4261913a3b2560c21a094533a27626638252232655c1e5522f0352b74f064360d118336420334c
202dfb5a0732b2e418047181f7482a11b0736a074463c50e256060871f30423351131f2021323a2927e2661f072250254a340792b54a0f150245321443d0b54f086693031c14768220122d17d0b1243031536051
0c99b0070f65d3164a064720a1382456611238090661a51f0a42b1a5763736f0274a0f6231254812412232592a5090f4771a46d32225196122136c3233d0b71c2b3142605d216481e2161125a3e2400d04f32422
41959ea2130310a102280683636a2672a26742023092451a180572e2201803009674381652b6393917b396703517f223402006b2114a3b4782420510534057211f23b3842c0d00f175273c6530d50d0f21b13323
e398a346200510916c1065a122300440e2d4293611b3132b1c0082344d17233272551475d32142360762f41d2722d1f41d08735214492f157227162230f057012b70d1a5582164d097660943b0c5241c7092257c
d66a8574193361f71e30042096103e5630a317073033b4191a74d15157365781d514396463975904552337440b1320e473003653a4691e1341a41124273156531c631082633c42a054440c2760602e3266026326
65febddc2a0341143b191283f50d3953c06622122492c15f3a326086392071c321692e620123011a153162573e216150380375a2664a1155c3c47634368123343f1523e004240131b721214690267c0e12e25609
af686bea336611c3400852c053493c75b2745f26523296113226213767071371d2730a72d242332874f0006a0e63d3b2441a6123507226232334593962b2a36c380603532b2e121175220505a2214d0b34f1c65a
d3e8ba3f0e52c39548136162a5181440c17235196601e27d3b6170620b336121577b2017e1f00c200761d0470f5111b03a3463c27567334662f559075152e16f2b70724070295460d33133546284602126428529
069fa3342c7030c52f10109161791923809761057031330a2301d0f5222520a1a16834034307112c0570a7413e22a38059273283742e1a41d2b70f261772d23e2730309455046651944937021110732c64a05665
aac3b0c12541f211641401d2f579287593d07c2b21339152136142f132295133425f037073e31a2667a3507801328232383a529306251826837431143330c72b1a2711d519037353001b1e14a250701a15d0222e
d932151f25764072701825803539121053c109384041c76f32706097381a1371831e1e113353491a1610172c14107093182a62d176773a32a0f2421a5093010a2830703743305193e27d017320230b2f62311235
d268f9c02623f396342664e0847b122151115c115142b0351e6291c15a145370643425375280701d7700f322067201230f350520961c2f760325723341a1022a3b07c361343e22401233206790b5652266d23130
5a41a7262f5522d16d32205097270242a122581d02c0963a2666f3e46720603122300524b0845d3a01d2276e0b130032782c0330a024073181e1003e3072e55a0852d2912e202502342f0424d2046c2a6420770f
a61ac6303376c3e5263b74b2e276031072704f3e6040b5593236a304451e6103617d001312426b1e70c28749265793953d2427822161297403c72919055155473f17e1f32e10119193010c7251e2612444431757
3ad0c14a1402d3825d0a527262293e4000305d132322763e2b6223e7080e62d30148206461217f2023d35220232292b5561c5181f7312744e315091d3330a019216162617918357063281622d223420e15527336
d3063a6a114490a02d3c1072354718153382140f00b24629243602f4740270a2c23c217630b3681c16b1036c012421a316082660d5701c4640943c1e47e191542d43a0165c17349022290a7182932d2427424469
__music__
0c 11771f62
08 5b1c3048
05 3d704023
03 570e7312
02 41604d33
07 1e270751
02 7b572c21
0d 616d5f2e
0a 4d17531a
09 0e1c5d68
0f 0b253864
09 6a14664d
09 214f6f41
03 3d267d45
0c 714b0249
0d 081a3c07
09 13453b6c
05 2c215a10
0b 7d7c0e33
08 0e566d3a
09 017b1c5d
02 36074066
04 7755564a
0d 31345d45
07 4d471c01
00 573d094d
00 0e21357e
07 2b4f6147
0e 11576708
00 23325231
0e 72011109
00 1269006e
02 69222e0e
07 09003755
02 22351e33
00 025e0129
0f 3a08406a
08 22320d4b
05 1f480217
08 6a545a20
08 312a4d16
06 732f3753
0f 73166765
07 140a3628
0d 7d690f55
02 427a1822
05 0e1a2f03
0e 332b3c11
09 73747d5f
01 4f2e1271
0a 6a1f5036
01 11065266
05 6e224569
07 2d380910
0f 291e3105
04 30762c7b
08 613a5c43
09 59197760
0b 19580727
04 20294927
03 727a427a
0f 08190564
09 06694f52
02 58610361
