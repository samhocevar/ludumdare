pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
--  the chamber scrolls
--  copyright (c) 2016 sam hocevar <sam@hocevar.net>
image_list = {
  { file = "data/pano.jpeg", w = 600, h = 252, tolerance = 5000 },
}
current_image = image_list[1]
facts = {}
rom = {
[0]=
0xad1c.9d96, 0x53e5.c3aa, 0x71e3.dabf, 0x598a.cb50, 0x092d.f171, 0x2295.84b6,
0x54a0.a1f5, 0x878e.fe2c, 0xac03.3e5f, 0x6a18.4b10, 0xbac7.343c, 0x0aca.292a,
0x1ee1.efd5, 0xb62e.8a49, 0xc87f.4f3c, 0x8f11.87da, 0xe5d1.b688, 0xeedd.1595,
0xbd31.6fe9, 0xdabd.5606, 0xe22f.fe2a, 0x7c78.64f1, 0x5a8a.bfb7, 0x3729.034d,
0xd6e4.8e07, 0xd4ee.0cb8, 0x0d5d.1a1f, 0x141c.cb37, 0xbd22.1f15, 0x14d0.5c11,
0xb07e.04a5, 0xf3d2.b19a, 0xebab.598c, 0x0b29.46d2, 0x45c0.5812, 0x2ab9.8d27,
0x46e4.7e3d, 0x4356.0aa1, 0xb524.331d, 0xb927.a288, 0x5be9.4a35, 0x3853.7022,
0x0957.1457, 0xc0b2.33d5, 0x7889.a035, 0x0dbd.023e, 0x0719.2513, 0xbf17.eadf,
0x1940.3bb3, 0x5ac4.a5cc, 0xc97b.f38c, 0xa92c.bbb3, 0xd5a7.8671, 0x5625.bece,
0x8b56.aaa4, 0xdb12.84a3, 0xb8f5.2620, 0xadaf.4be0, 0x5035.09f0, 0x1ed1.a4ae,
0x2b2b.ea14, 0x234f.8a02, 0x740a.bad2, 0x9cac.cdb4, 0x7c24.31ba, 0x59d5.43e0,
0x96c7.646e, 0xca7e.b439, 0xf4f2.556b, 0xa02e.52d5, 0xab2c.6a9a, 0x9959.8d6a,
0x56b8.ebdb, 0x8e73.f11c, 0x9fcc.b302, 0x07a0.8da5, 0x27e5.e2aa, 0xf23f.6eea,
0xf490.05cd, 0x0b67.912c, 0x3677.e20c, 0x3700.b6f9, 0xaf5e.2b04, 0xcd59.8cfd,
0x98d6.c0b7, 0xdc8c.7a57, 0xd744.48d6, 0xbc58.0647, 0xe9e5.5c59, 0x86c5.9c2d,
0x0e39.0dc8, 0x0da6.309c, 0x8ab0.e31c, 0xe159.6c24, 0xac31.b307, 0x3066.b7f8,
0x15fa.6a5b, 0x7934.9d23, 0x3c21.5948, 0x9645.986d, 0xe38f.96f9, 0x2c14.07c9,
0xc210.5c56, 0x1031.15d0, 0x02a5.644f, 0x3a3a.5eb1, 0xb48c.f00c, 0xe3f5.4cf5,
0xb155.069b, 0xd8e1.6e68, 0xa301.6891, 0x27eb.5a85, 0x1f1e.43ea, 0x77bb.d7b1,
0x3574.4ac1, 0xd108.c082, 0xbe15.1113, 0xd5fc.2610, 0x9cca.e866, 0x7158.5d57,
0x942e.0d80, 0x8588.fae1, 0x662f.1598, 0x0a1a.74a3, 0xf645.d06a, 0xd8b2.48b2,
0x0368.0a95, 0x7964.ae51, 0x9f35.6a44, 0x29d6.728f, 0x98ac.6237, 0x959a.6478,
0xaca6.749c, 0xfd88.f3aa, 0x40fb.b995, 0x5212.5e45, 0x4337.2306, 0x4df2.e320,
0xabfa.90d1, 0xc539.62ee, 0xa642.84b3, 0x90a0.ce9a, 0xbd13.f579, 0xb8d0.8235,
0x4977.c7ef, 0x9961.7753, 0x9e48.3560, 0x53bb.a99f, 0x358f.6aaa, 0xbe14.9627,
0xaacc.c68e, 0xc187.8cb4, 0x5ab4.3895, 0xa354.00e2, 0x2fd2.e8a2, 0x225d.8c70,
0xb06d.5d2b, 0xd20e.1a1c, 0x874f.2daf, 0x2a66.e210, 0x60d3.2932, 0xd895.24af,
0xf90a.8465, 0x05a4.5ddc, 0xf0d5.5c7b, 0x8127.4e6e, 0x7c65.9533, 0x3438.4dd0,
0xe767.034f, 0x8df4.8c3d, 0x32f8.8823, 0x7451.2e49, 0x5206.7c3a, 0x4995.424d,
0x8653.54b4, 0x3937.00d5, 0x236d.e992, 0x0db1.2461, 0xc97d.79e4, 0xa384.6599,
0x996f.87bc, 0x58f1.a32f, 0x7e4a.2acb, 0x930d.45db, 0x8d7b.d590, 0x5eb0.a93b,
0xcfa3.f3af, 0x4023.0d8a, 0xac80.8a22, 0xc5e7.2bab, 0x6af4.5754, 0x63ef.d1b1,
0x2ab0.a6ad, 0x9a4c.c602, 0x18e2.d7a5, 0xc2cc.efbf, 0x878c.37ca, 0xb12b.a47e,
0x695e.7c89, 0x7916.c9c4, 0x4f7c.bb2c, 0x7714.ffdf, 0x5542.28bf, 0xe8fb.0ace,
0x1eb7.8d7d, 0x6726.d9e0, 0x7b7c.ea9b, 0xd68b.393b, 0x229c.9b48, 0xfcfe.1192,
0x0d44.aeec, 0xd3a3.ab2d, 0x65c8.e263, 0x01e2.5165, 0xb1f5.18c3, 0x5d76.8be0,
0x2158.dd7b, 0xb2f0.73cf, 0x672b.6b0e, 0x5009.e503, 0x578b.e86a, 0xc981.3c44,
0x9a0a.a054, 0xd622.cdfe, 0x30a0.4b62, 0x6bf3.bd95, 0x8c6c.b620, 0xdfeb.32b0,
0x4b80.6aa7, 0x2f33.784b, 0x6b4c.a745, 0x34fc.4498, 0x8d9f.8484, 0xda54.6d68,
0x7582.c358, 0xd3d4.a837, 0x19e4.c83d, 0x400a.2c62, 0x9fcf.bbfd, 0x5273.a9af,
0x1960.0512, 0x6273.e1ab, 0x7eb3.6b95, 0x58d5.fc9e, 0x840d.3cdc, 0x1c6d.ec4b,
0x9696.85ae, 0xafac.9484, 0x7c36.7185, 0x0152.2ff1, 0xae07.29e3, 0x53a2.eba9,
0x4da6.7f91, 0x6017.a6fc, 0x7212.db75, 0xff1e.6581, 0xfd1d.2ba6, 0xdf37.0bf4,
0xd858.9a9a, 0x849c.7fa8, 0x8cf8.00d3, 0x924b.7b4e, 0xcd7a.a1d3, 0x9aac.4be6,
0x35fa.8a2a, 0x5069.193d, 0xcd76.6e95, 0xcfb7.37f3, 0x0e34.fd3f, 0xfa63.6def,
0xd731.f87a, 0x9fb9.d901, 0x62c3.899d, 0x2733.8d2d, 0x7236.746f, 0x9229.36c5,
0xb2f0.b4c0, 0xc924.b30e, 0x41aa.4191, 0x949a.f7e2, 0x14ad.f0b0, 0x484c.2c16,
0x2ce4.4b3b, 0x1594.852a, 0x8336.ea5e, 0xafaa.0020, 0x9a66.b195, 0xaacd.95dd,
0x69d5.7d9f, 0xe633.1715, 0x150a.6b28, 0xa5a5.9962, 0x425a.540d, 0xda38.f014,
0x5d81.861a, 0x341e.a7b0, 0xa3cf.bf3d, 0x4ad2.f8b5, 0xa5c5.0971, 0x9584.9f0d,
0xe9f5.00c4, 0x7e63.cfa7, 0x6f9f.5ee0, 0x3f56.10eb, 0x967c.3f0b, 0x4046.892a,
0x512d.ceed, 0xf7f6.b289, 0x281c.d45c, 0x6023.e5a7, 0x76fb.111d, 0xdf06.dad2,
0x8ff2.4269, 0xa725.4bfa, 0x5f5c.6f61, 0x195f.d22d, 0x7575.b91d, 0x2c31.439a,
0xfbf4.a556, 0x588b.bfc8, 0x1724.0d42, 0x65ce.f1a7, 0x161d.c2ca, 0x427c.e43c,
0x2b28.48c2, 0x38a7.33a1, 0x358a.690a, 0x5fc4.a266, 0x02c5.39af, 0x8434.4a8f,
0x5ce9.49e2, 0xfecb.f6b8, 0xbfdf.1377, 0x1eef.7dbb, 0x79f8.c2b1, 0x73cf.e3d7,
0xef56.66dc, 0xecfa.c8d3, 0xc6b0.ea69, 0xdd9e.d193, 0xdeea.51e5, 0x825c.fb47,
0x47eb.9a2f, 0xe339.3667, 0x92ac.93dc, 0x87c9.122e, 0xe1bd.0b5c, 0x585b.5d0f,
0x7e32.fef5, 0x59fa.6cb5, 0xc5d3.1f11, 0x61f4.5a87, 0x4afa.e585, 0xf6b9.6fa9,
0xfd47.3579, 0x0b9c.f84b, 0xbaf4.1561, 0xb3d6.c6a6, 0x9e16.1d90, 0xff27.d700,
0x02d6.e515, 0x42ae.1acb, 0xea72.b69a, 0xe459.6986, 0x408a.4ddf, 0x9def.b7b7,
0x44b5.ab13, 0x5e7e.5db9, 0x1f17.36f9, 0xfede.dfde, 0xa327.5af9, 0x09a7.e633,
0xde8a.354c, 0xefb7.f4c7, 0x4706.83a6, 0x8b4f.580c, 0xed25.c8d9, 0x4b8d.75da,
0xcc66.d46f, 0xb315.a22c, 0xe75b.b2b8, 0x2d7a.b285, 0xc197.4f31, 0xf3fb.9706,
0x06b4.cd08, 0x117b.f41e, 0x6e47.02ac, 0x7e1b.abab, 0x74ea.7f5f, 0xf672.f2e4,
0xdb4b.258d, 0xf0a9.e65c, 0x6a83.1222, 0xac2e.1615, 0x9e64.bbe2, 0x955c.78db,
0xf0bb.235a, 0x0fb3.d4b7, 0x70ef.6d9f, 0xfb6c.fa78, 0x1b91.6767, 0x9f71.f2a5,
0x6796.d7d0, 0x890e.9564, 0xab6e.2777, 0x12ad.a599, 0xf1a1.2d59, 0xfa2e.4c4a,
0xeae2.dca2, 0x76ed.a974, 0x56f4.2658, 0x0fe1.f82c, 0xa539.4569, 0x3e3d.a12e,
0xe357.81b1, 0x2bd5.ab31, 0x2758.42b1, 0x6fcc.5477, 0xb06d.8715, 0xf551.b4b8,
0x532c.3b31, 0xd4ab.68ea, 0x0cb2.e2d5, 0x2e90.52c9, 0x8c7d.d3e0, 0x0d6d.e091,
0xc7d4.67a4, 0xd516.3ead, 0x45af.9f0c, 0x51e3.b214, 0xf0d5.7774, 0x72dc.6dc3,
0xd9f8.3bbc, 0xee04.73b3, 0xc34a.2ea6, 0x79b8.ee1d, 0xfe4a.4992, 0xba79.916b,
0x07c5.50a6, 0xf8b2.e868, 0xa4f9.9eb2, 0x1b65.00b8, 0x63da.ee4e, 0x7077.a3af,
0xb82b.75d3, 0xd83c.d33b, 0x0e60.ab8a, 0x4ebc.a32a, 0xa2c9.87b3, 0x3767.96f9,
0xab04.8563, 0xab04.595a, 0x2ac1.3920, 0xe4ab.738d, 0x8f73.713d, 0x4bcb.1c04,
0x28fe.bd0d, 0x2c70.5563, 0xf5fc.4854, 0xd056.d1c4, 0x7ec4.2248, 0x3fb1.bf64,
0x1f53.5b3c, 0xbcb9.0d9f, 0xf67b.bbbc, 0xc687.cfbd, 0x0822.46ec, 0xd263.6db7,
0x63aa.12df, 0xab03.0afd, 0x229c.89eb, 0xcee8.8ed6, 0x9d24.2562, 0x74f3.bb78,
0xefd0.fbcc, 0x7561.f3c7, 0xe767.5182, 0x46f8.715e, 0x3292.b646, 0x86cb.410d,
0xbfba.e2c5, 0xb005.acad, 0xae32.5648, 0xbbb3.31f4, 0x9b79.72e4, 0x584a.94f1,
0xcbd2.55da, 0x254d.f05a, 0x8cfb.2793, 0xf5e2.c306, 0x6f13.816e, 0xfc66.fd37,
0x9949.b24e, 0x5433.5aff, 0xf08c.8ac2, 0xf3ec.ecec, 0x651f.6e34, 0x70dc.bc5f,
0x11c4.a148, 0xd614.16dc, 0xb22b.965a, 0x538a.b4ca, 0x1a1f.1aa9, 0xdd27.5259,
0x6fb9.1418, 0xc917.5892, 0xd2a7.f169, 0xb956.a2f3, 0x9b6e.798b, 0x1096.2a37,
0x25f3.5693, 0x7e95.8cac, 0x0574.9f53, 0x29d0.ded3, 0x4b24.a343, 0x9d25.4a82,
0x852b.143d, 0x558f.b18a, 0xacc1.a259, 0x8bf0.7e7a, 0x4a58.21c0, 0x530b.5c79,
0xc135.624d, 0xe314.2c5a, 0x163a.26cf, 0xb93a.a135, 0xc857.5371, 0x9763.f247,
0x72c0.52a3, 0x8d1b.7c8d, 0x34c3.be7a, 0xdbaf.d0a4, 0x2a15.0b13, 0xa54a.dd37,
0xa8a2.ccbe, 0x83f8.aeb3, 0xc35f.22cf, 0xbb9a.be5a, 0x7110.5662, 0x6673.57a5,
0xeb49.c15b, 0x1acd.04da, 0x52f5.8a03, 0x02fd.2743, 0x03a4.e8ab, 0x1564.deaa,
0x20da.5856, 0xf585.bac7, 0xc948.7e78, 0x061b.baa2, 0x5604.7edd, 0x9d88.50fc,
0xd613.e7dd, 0x22d5.6695, 0x6a11.3ed7, 0xd5c2.d8d1, 0x48d1.1d1a, 0x78c3.7a88,
0xcd6b.5e9f, 0xded1.fbcd, 0xbb51.04c4, 0x6c63.6083, 0xc2eb.ec95, 0x2fb3.196a,
0x5923.d560, 0x42c6.2a79, 0xaf59.1406, 0xeac3.4ace, 0x6e3a.9ade, 0x204e.9f17,
0x01a2.de27, 0xbb99.bdc5, 0xb6a9.4586, 0x0a61.f8a1, 0x5554.e584, 0x1b4b.8ee9,
0x38b7.41e4, 0xfd2d.c7c4, 0x539a.f5c3, 0x55cf.fb89, 0xc736.e1f4, 0x3ff7.83b4,
0xd9b2.4c9f, 0xa383.0c09, 0x8a23.09bd, 0x0dbe.50d2, 0x3a3e.3f57, 0x0f8d.a11e,
0x96ed.fbc7, 0x8575.6cbb, 0x1b90.80d7, 0xd0eb.fb13, 0x6edb.b6df, 0x52c3.e5db,
0xc559.52b5, 0x47ed.f269, 0x98c7.3a34, 0x2770.0a42, 0xf569.46c0, 0xda65.3f72,
0xf6ea.c348, 0x11aa.677c, 0x5563.372b, 0x8885.d86a, 0x0478.7e86, 0xd2bf.1a9b,
0xb619.56fb, 0xd561.3068, 0x80a4.5bab, 0x9cac.27af, 0xbc2f.c6e2, 0x80b0.a057,
0x1993.3d58, 0xfd64.9dda, 0xfbb1.326c, 0xc64d.1932, 0x6be0.9df2, 0xca04.ebbb,
0x8bc0.a03b, 0xc48c.734c, 0x4656.0db0, 0x62d4.005a, 0xe6d6.94c3, 0x0e63.6006,
0x5abc.461f, 0x502d.56a9, 0x8007.8624, 0xf9ef.05f3, 0x620b.7198, 0x1a97.d6d4,
0xa725.6757, 0xe852.e256, 0x636c.137c, 0x0b56.7150, 0x3c1d.eeae, 0xe969.fe15,
0x4b11.959a, 0xc52a.866e, 0x5bf3.2585, 0x12dc.7526, 0x8aeb.3156, 0x279e.3c67,
0xd733.9deb, 0x6b1c.105c, 0x2484.9f7c, 0xa113.cafe, 0xd6a6.e1b5, 0xd6ab.13ef,
0x5a21.3c68, 0xfa03.83a3, 0x6ad4.2f96, 0x6b13.21ba, 0x93f5.c713, 0xd5a7.7693,
0x31ac.8cee, 0x5ebf.2dd5, 0x3322.8ac5, 0x58fc.f752, 0xf51c.5e79, 0xae35.1c91,
0xd662.8261, 0xf277.4cb8, 0x9e65.e5f7, 0x5210.8c7d, 0xc02f.092e, 0x2691.2445,
0xc159.ab5e, 0xf7bb.38a1, 0xbd6c.1565, 0xc405.1752, 0xdba8.6be1, 0xfb0a.4336,
0xf9fe.9551, 0x7755.dc73, 0x23c4.f594, 0xd7b7.b56f, 0x3df7.0531, 0x0ead.5bc4,
0x68f1.9eb9, 0xf53f.23cf, 0xf1d3.93c7, 0xc1e1.e1e1, 0xd23c.68c1, 0x01ad.0c6d,
0x4705.88e0, 0x5626.d7f6, 0x711b.4e9d, 0x0648.d8c3, 0x3be7.249f, 0x52b3.2d69,
0x502f.23f5, 0xb62e.5e7d, 0x4be7.d33a, 0xdbd5.941b, 0x3c0e.5b28, 0x0623.ecf5,
0x6b74.17a2, 0x5ca7.2c13, 0xed4d.1d38, 0xfca1.dac1, 0x4ad8.dfd7, 0xfa56.5de0,
0xdca4.234e, 0x1ac6.9f16, 0xf3b8.1445, 0x91f6.da4c, 0xb9c4.6ac9, 0x5fdf.d9d3,
0x8d12.413f, 0xa8a2.3676, 0x6791.f88a, 0x43ad.1f5f, 0xe4a7.c739, 0xa33a.0fde,
0x45a1.43c3, 0xe1e4.8890, 0xda18.dc84, 0x3aaa.077e, 0x1762.1981, 0x1d77.764d,
0xcba4.2c3c, 0x652e.a3ee, 0xdaad.6a99, 0xaf3e.82f4, 0x242d.2990, 0x02f7.9ad2,
0xd1e5.9377, 0xa348.d8dd, 0xe4ee.4aa4, 0x1baf.f869, 0xa65d.5c1b, 0x1072.ea17,
0x3ccb.56f2, 0x2b1b.3b1c, 0x0b9d.e98d, 0xb266.adac, 0xdd28.8dd2, 0x612c.3878,
0x7ab0.8fed, 0x7bf0.b3f6, 0x1efe.dbdf, 0xb4a3.e926, 0xcee4.1d2b, 0xf21e.969d,
0x983d.935b, 0x75c2.68d6, 0xdb8c.5278, 0x7c9d.6e3e, 0x368f.0706, 0x5101.f939,
0x2909.a562, 0x7e73.bffa, 0xadda.b04c, 0x3198.db4e, 0xee55.6eb7, 0xc714.965c,
0xbe6a.d429, 0xf5d5.fa87, 0x58d5.953c, 0x0ed4.d51d, 0x1c5a.ac8d, 0x5a52.5305,
0xdfa5.4716, 0x46cb.540d, 0x3ba3.1c3c, 0xa689.f673, 0x6144.cdca, 0x5671.a2be,
0xf1be.3dc2, 0xab11.e799, 0xf7ee.f0ed, 0xe792.167e, 0x92d3.e75e, 0xc7dd.d09c,
0x82c9.04cc, 0xc111.c273, 0xa7ac.827a, 0xfb7b.7143, 0x6d05.ab49, 0x067c.9f1d,
0xa727.8d4d, 0x3e4d.9f27, 0xc07d.3d3b, 0xd7f3.eee0, 0x0f07.83c3, 0xf4f0.a726,
0x2a7a.c03a, 0x250f.ab1e, 0x86d8.bcb9, 0x5651.1517, 0x6e8b.560b, 0x49b0.bcda,
0x95f2.5fed, 0x1691.1595, 0x3a93.e158, 0x461d.6df4, 0xfbbe.da34, 0x03bd.92c5,
0x2b6b.e1fa, 0x9a4e.f68b, 0xda89.b67c, 0xa413.7848, 0xe79a.d9d5, 0x6785.6425,
0xf259.fbdf, 0x51f7.ac0f, 0x79c7.be64, 0x86fe.4b9f, 0x4690.4614, 0x45d8.b71f,
0x9427.dc4f, 0x6a47.9355, 0x5a4e.b51f, 0x4e4e.b308, 0xa727.5b4f, 0xd393.a7c7,
0x383d.acc3, 0x8826.3078, 0xd753.a9a7, 0x1b71.0b0d, 0xccaf.4725, 0x11fb.e8de,
0xe97f.2b62, 0x7f35.6722, 0xe9fa.5772, 0xad11.656a, 0xab52.b152, 0x5c42.4638,
0xc8c8.b5bf, 0x60dc.e0d5, 0x8d72.fef1, 0xa3cc.ef4c, 0xd4e4.2bd4, 0xd6fa.0b16,
0x33b3.d588, 0xbfc9.d7fa, 0x8f68.eef3, 0x3607.749c, 0xb1e4.6804, 0x9f69.d8cf,
0x8311.4fb8, 0x788a.04ba, 0x468f.ec1d, 0x83be.326d, 0xac24.e707, 0x3c1e.cfd3,
0xc39f.c438, 0xcebd.fdc3, 0xc0b9.21c1, 0xd59e.56d3, 0x8aad.5acd, 0x525c.4515,
0xd78a.c46e, 0xa636.d6b9, 0xc58e.6c3c, 0xd533.73c2, 0xacb4.1d48, 0xeaba.53e0,
0x0ccd.1db9, 0x746a.8471, 0x1174.5655, 0x2daf.1fba, 0x85be.d637, 0xd6ba.c81f,
0xf1f5.603b, 0x3c9d.87d9, 0x8f6b.66ab, 0x1a22.b518, 0x08a6.e0cf, 0xadec.7b55,
0x5c49.d7b7, 0x1092.279d, 0x901f.6fc2, 0xc94f.8efc, 0x8e1c.1f12, 0xeb95.6c27,
0x83fd.c3e3, 0x7bee.727d, 0x707e.3b9e, 0xafbb.9648, 0x3176.3977, 0xdde5.8fb1,
0xa3f2.bd55, 0x8a88.02a1, 0x85fa.b186, 0x8937.1650, 0x595c.74e7, 0x3960.bdc1,
0xa199.8d57, 0x6444.89a6, 0xeed6.b830, 0xfbcb.66b1, 0x91b5.f699, 0x9ea6.b6bb,
0x3e4c.9b3d, 0xea6c.f67e, 0xa5cb.bf7d, 0x8c98.0ef5, 0x7814.1227, 0x7273.b71d,
0xf8fb.7a0c, 0x7075.ab5d, 0x9090.e0f0, 0xaee4.264e, 0xd3b5.0fe8, 0x5523.5136,
0xb4ea.f622, 0x6b1d.5d49, 0xb750.9b10, 0x8d42.bd2b, 0x3651.4f67, 0xd7e5.4721,
0x7544.0b8a, 0xba4a.4359, 0x7abe.12dc, 0xae58.2ffc, 0xdb61.7a9a, 0xa195.2b60,
0x2566.74cc, 0xd651.99f2, 0xd5a5.c56a, 0xfbfa.e7b5, 0x9160.88e8, 0xee3e.4e0d,
0x027a.b34c, 0x4840.d12d, 0x48f1.e581, 0x69f7.4072, 0xc244.7da7, 0x1a49.20c2,
0x478e.61a3, 0x8edd.53c2, 0xb7a8.118f, 0xb92e.075b, 0xc481.642a, 0xdd1c.f38a,
0x3d89.743a, 0xbdb9.4362, 0xcf8f.07dc, 0x474f.ea56, 0x45da.f338, 0x2c8b.c3a7,
0x2d70.b35c, 0xf9e5.afbf, 0xf346.8c5b, 0xccbf.3c14, 0xfa86.68d1, 0xbd3c.23bb,
0x3673.ad78, 0xedd6.f239, 0x4a32.a15e, 0xedac.8a6e, 0x36ad.3909, 0x6b98.d759,
0xa135.1d0b, 0xfc84.e190, 0x4efd.393e, 0x04f8.f8eb, 0xf1f1.e0e3, 0x93d3.93f1,
0x4e4e.cf93, 0xede8.c4e0, 0x8f1e.9f98, 0x3ca5.288f, 0x7e95.dcb2, 0x0249.41d2,
0xfaf5.df69, 0x8dc5.91fc, 0x3e62.edcb, 0x2098.96ab, 0xe558.65d4, 0xbcc4.d41c,
0x2103.26cd, 0xebd6.cb5e, 0x11a1.9d26, 0xd6f3.dd7b, 0xa68a.c9d6, 0x8423.44ca,
0x4806.e857, 0xd132.ce51, 0x84d9.ea21, 0x49e0.51f8, 0xf13a.c341, 0x4875.9722,
0x4a7b.a399, 0xbc49.6a9a, 0x68eb.514e, 0xbfbf.b874, 0x5ee9.8147, 0x0e7e.43b6,
0xa794.b7c9, 0xf37e.8260, 0xe1df.3ee3, 0x74e2.2141, 0x4cef.30b8, 0xabb2.d7b2,
0xae5a.62df, 0x02f0.f39b, 0xd90d.1b83, 0xd5ec.9eec, 0x64e4.2d3e, 0x4aee.7559,
0x8f72.b0cd, 0x63ef.75a2, 0xd1f1.f582, 0xc345.9451, 0xc5bf.ff6e, 0xa5ac.3b9e,
0x34dc.5b8f, 0x8da2.da2c, 0x0604.d622, 0x1e61.26d7, 0x39f0.481c, 0x6b41.3e39,
0x814a.9453, 0xddbe.08d8, 0x935e.573a, 0x26c7.c3d0, 0x07e2.9e07, 0xa7c3.e15b,
0x0bdd.5637, 0x92f9.566b, 0x2334.4e6c, 0x3d70.81ed, 0x929e.02f5, 0x1e2d.56f1,
0x6eaa.ed7c, 0x3737.7b4b, 0x7575.345d, 0x5843.4656, 0x22ba.4c80, 0xd7e5.ed9f,
0x9071.3720, 0xa630.b2bb, 0x446f.4183, 0x8a2c.41e2, 0xd6f5.bd9f, 0xcdab.7e08,
0x4d1f.185d, 0x6ac4.fbc6, 0x1321.d074, 0x7b4e.a904, 0x3da6.4f9d, 0x83bb.a71a,
0x1531.f8ae, 0x48b4.19f2, 0x8bfc.379e, 0x3894.cfad, 0x1559.8280, 0x53c7.69fa,
0x316a.d15f, 0xc9d3.fa08, 0x6394.935e, 0x4b19.df9c, 0xe3da.8810, 0x5113.1917,
0xd6f7.5966, 0x761c.343b, 0xb5eb.b33a, 0xc48d.6211, 0xc318.9118, 0x0324.b549,
0x2775.d6f2, 0x1524.7c79, 0x5c19.298d, 0x2e14.f8a7, 0x722f.e24e, 0x53ba.ebed,
0x179d.9666, 0x8243.e235, 0x626e.ba28, 0x3ad5.d0fd, 0x763c.9949, 0x7314.6a53,
0xb62f.c767, 0xe234.0ea4, 0x728e.04a1, 0x96bc.339c, 0x530c.f5e4, 0xa44b.671b,
0xe55d.2575, 0x5b41.14df, 0x4b39.4451, 0xf11e.f727, 0x5285.1c80, 0xe92a.8836,
0x185a.ac04, 0xcf37.d0d5, 0x7478.b76b, 0xdf66.7144, 0xefec.1d6d, 0xfbfb.478f,
0x3850.2f14, 0x8e7e.cc76, 0x30d7.40d5, 0xddc7.f570, 0xb69d.35bb, 0x4de3.7115,
0xc2fc.bfd3, 0xc8c8.988e, 0xd929.dbac, 0xec8b.f4a4, 0xf25c.da1f, 0xe427.6e26,
0x7180.6978, 0x4e4e.6e79, 0x1597.bc69, 0xb625.911b, 0xb0bc.615d, 0xb2fb.582d,
0xb387.213e, 0xefa1.3d1e, 0x2df0.448e, 0x5b11.937b, 0xc4ef.9d21, 0xbda1.716b,
0x717d.911d, 0xfbda.3010, 0xe683.dbd0, 0x0e40.c8a4, 0xa13d.fc9f, 0x26c2.931a,
0xaded.31a3, 0xbae9.f285, 0xb58a.c467, 0xfe75.cb2e, 0x237d.0998, 0xc072.55cb,
0x1ca0.9991, 0x38ca.fccf, 0x70a6.f122, 0x787e.5845, 0x7dd4.8e4a, 0x3647.1a8a,
0x86fa.8529, 0xb2e3.1d2c, 0x30bf.d309, 0x610f.490a, 0x6ddd.e150, 0x11d6.a694,
0xa3ba.c164, 0x9e82.0fac, 0xd237.b976, 0x8885.aabe, 0x888e.45b3, 0x1d36.abc2,
0x09c1.0693, 0x2ad2.d86d, 0x9635.bf67, 0xa5db.55a0, 0x0c2e.e8bb, 0xff1d.e37d,
0x48da.98bb, 0x772d.8cca, 0xcd56.c934, 0x6a24.b065, 0x6d27.9317, 0x2ec8.c7b5,
0x1d6e.8828, 0x707a.7d3d, 0xe2c2.94fe, 0x8463.fbbd, 0xddad.a8d3, 0xd5ab.1ed7,
0x5786.e772, 0xf0ec.9cd3, 0xc31a.1f55, 0x6e59.4515, 0x15d7.28e7, 0xd3d9.3d11,
0xdc17.6798, 0xa233.a4ff, 0xb208.e010, 0x20a3.6f82, 0x3d68.7d03, 0xf057.7a7d,
0xf19f.33ec, 0x6ce8.35c8, 0xf652.1050, 0xd375.d353, 0xb6a2.7ad5, 0x336d.59a6,
0x4e9b.9607, 0xffb1.986f, 0x8522.6ba9, 0x23a0.6034, 0xc478.d14b, 0x9fb5.6c02,
0xd8cc.a31e, 0xf0ff.7079, 0xb009.7dfe, 0x7124.9ab8, 0xe490.65eb, 0x58ea.d9dd,
0x53a8.eb69, 0x7127.c8a1, 0xd2b3.6790, 0x0ac9.73ff, 0xbf32.8b3e, 0x6993.84d1,
0x6449.3b14, 0xda50.5f1e, 0x3da9.e79f, 0xc577.026f, 0xd0c7.5a72, 0xf5ca.f0ba,
0xa5ad.57cd, 0x6aab.06fe, 0xfe91.5956, 0x6c6d.57ca, 0x56cb.db77, 0xc687.6939,
0x049a.5aac, 0xe776.c15d, 0x4249.fa29, 0xe5b5.89c3, 0xf9ed.5bcc, 0xf539.46ac,
0x28d5.bde4, 0x9cb1.2183, 0x8a3e.b566, 0xfbe9.4b44, 0x3eef.ac08, 0x1aa7.b31f,
0x1346.ce4d, 0x3d61.a702, 0xc89c.3b38, 0xae9e.8330, 0xc8a5.2223, 0x09ff.e293,
0xb118.870d, 0x553d.b5f1, 0xacad.7190, 0xba74.3f43, 0x8064.5fdf, 0xff5b.3dec,
0xbee8.f491, 0xd076.067d, 0x02c6.d23c, 0x8d4e.9157, 0x70a7.a510, 0xbd83.9d52,
0x8c71.1d3d, 0x29a3.4c52, 0x5ad2.c660, 0xbdf8.6f66, 0xf9bb.0da9, 0x9a05.9277,
0x196a.34c1, 0x2397.fa7a, 0x0e93.c012, 0xdae8.6b26, 0x275c.2910, 0xec72.4002,
0x3e7e.1f9c, 0x468f.6396, 0x446d.eb7b, 0xa0c6.dce9, 0xa0ff.a6d4, 0x8f3a.a9be,
0x0b84.ca85, 0x7772.7ee6, 0x491b.94a6, 0xc5cb.3c9f, 0x5135.73ea, 0x9f5c.1f17,
0x4a41.862d, 0x9257.d81b, 0x72b0.8877, 0x39df.bc65, 0x9d19.8fb8, 0x0a29.3eb1,
0x4c8a.ad9e, 0x3239.e53a, 0x7c2f.a087, 0x6238.746d, 0x4257.1282, 0x30ec.09d8,
0x5b73.dadb, 0x325a.ee99, 0x1604.b6d8, 0xd892.5082, 0x98d4.fc3e, 0x64c9.fc49,
0x48c2.072c, 0x3c38.39d3, 0x01ce.4c9b, 0x0eea.728b, 0x3466.cfa6, 0xd575.6735,
0x533b.7b82, 0x38f5.e256, 0x528d.1d14, 0x9a97.ae40, 0x353b.28cd, 0x603b.639e,
0x7e4f.1c73, 0xbb28.8277, 0xfc25.1323, 0xcb27.4da5, 0xb23b.8cd8, 0x7dd2.8fe9,
0x88fe.748d, 0xe333.8ebd, 0xf2e7.7713, 0xcd79.34b2, 0xec35.ad73, 0x542d.d95a,
0xe01b.c817, 0x5c35.9318, 0x4364.8f1d, 0xf0e7.60c3, 0x7750.628c, 0xcea8.c69f,
0xf3e0.f3a8, 0xf3f9.f9c9, 0x8ea2.d033, 0x474d.8f9e, 0x194e.328e, 0x4df3.6596,
0x0167.e6ba, 0x6d8e.91ab, 0xa766.31c5, 0xe232.e5e9, 0x4826.8c96, 0x4608.5a18,
0xda2e.1589, 0xff78.7c64, 0xa3ed.a290, 0xec09.faf1, 0x76fc.6c72, 0x32d7.3736,
0x48a8.aa81, 0x11fe.3bfb, 0x5744.ca23, 0x133d.f824, 0x6244.209d, 0x26f7.11d0,
0x0384.1615, 0x0128.83e7, 0x3d5b.c840, 0x7609.90eb, 0x9f7b.5598, 0x01da.2ae2,
0xf1fa.2b02, 0x9cec.f27c, 0x7099.3585, 0x4ee4.78ea, 0x592f.db35, 0xa132.ccb0,
0x2347.5fe9, 0xfe13.f5ee, 0xca6f.292a, 0x2dae.674a, 0x46ae.5ddd, 0xf240.6022,
0x1fc9.ff8e, 0x694e.629c, 0xe8b4.47bc, 0x34a0.993f, 0x3246.a0d1, 0x51d1.7ad2,
0x4c89.ea7d, 0x8fbd.8164, 0xb7e9.bdc5, 0x1d73.9172, 0x0b51.f379, 0xbb95.335e,
0x3bf2.8c28, 0xda84.45b7, 0xc9b6.0234, 0x5be8.b513, 0xfbbd.b232, 0x4477.f33c,
0xe0ae.1791, 0x83ce.c3fd, 0x8b44.6e73, 0xc4d1.c72e, 0xb522.9f5d, 0xe26f.7d6c,
0x65fa.7e87, 0xcce2.bf9e, 0x9026.ae58, 0x8188.3d19, 0x97e3.353c, 0xb010.2866,
0x6fbf.0024, 0xfdc6.7ea3, 0x8eef.23db, 0x23a3.5075, 0x235b.7854, 0x625a.6e73,
0x371a.2323, 0x302d.3d33, 0xc54e.b01a, 0x7622.b61d, 0x0083.a028, 0xdfde.d5db,
0xd5f4.8d1b, 0x9770.6be2, 0x6d16.e452, 0xdc5a.8444, 0xdbbc.0c11, 0xc863.541d,
0x318e.7543, 0x1c79.8a81, 0x27cf.d178, 0xedd1.7178, 0x1a54.56ad, 0x1668.bd4d,
0x48db.e6d4, 0xa516.aae2, 0x5229.6228, 0x5a2b.d04e, 0x8e99.40db, 0x433d.2d68,
0x6984.b709, 0x8911.d1db, 0x935e.446a, 0x3e4f.b584, 0x264d.c882, 0xf395.273c,
0xa3af.6652, 0x926a.4eb4, 0x4602.4e46, 0xa184.ee5c, 0x47d7.8ed2, 0x97e2.d560,
0x3c8d.99c5, 0xb1d6.fbb6, 0x0b06.4d66, 0xcb79.4717, 0x8716.f3fa, 0xf59e.f4ec,
0xa444.b6ce, 0xdc50.fc94, 0x0c7c.7eb3, 0x3bce.d456, 0xc8cc.dee7, 0xd66a.4d37,
0xca37.f56b, 0x0be8.1b33, 0x123f.a74e, 0x928b.5856, 0x99ec.4c8e, 0x6956.3322,
0xed79.8d71, 0x29c9.c9fd, 0xe4d9.fdba, 0xc221.f1b3, 0xf73d.fd98, 0x2d32.8260,
0x30ae.4746, 0x3518.5de8, 0x3830.f48d, 0x6b39.b572, 0x193a.d417, 0xee39.8d8d,
0x3dc6.9261, 0xdc80.9846, 0x2209.80e0, 0xab2b.d4f2, 0x7b08.f15c, 0xdc3e.3560,
0x8cf6.7f5f, 0x00e7.675d, 0xf28c.80fe, 0x7273.bf60, 0xf51e.ca7c, 0x73f5.7584,
0x6cf5.c2b2, 0x66e2.6386, 0xa6a8.d9df, 0x3df8.8765, 0x23b2.163f, 0xf1ec.a3a0,
0x1a91.930a, 0xfb22.e1a5, 0xf213.3962, 0x8909.914d, 0x1eca.2646, 0x1427.3a8d,
0xc1b1.93b1, 0x47dd.ec31, 0x751e.3f5a, 0x2162.5ae8, 0xc4c1.fecb, 0x42a4.eb1d,
0x0ecb.452e, 0xaf51.23d2, 0x6a0d.0039, 0x8f3a.7beb, 0x8aff.88ea, 0xb464.85f0,
0x4335.d637, 0x5c8e.bb2d, 0x47db.d43f, 0x75ec.cda8, 0x4feb.dbda, 0x1d7d.6b40,
0xf3c9.f111, 0xb771.213f, 0xee04.07da, 0xc121.2e84, 0x0cb6.873a, 0x5aae.ed2b,
0x9cbd.8fa3, 0x4f5b.b2b2, 0x7ad5.6c66, 0xf1fe.e461, 0xec8f.7d68, 0xffbc.7f7b,
0x91a2.6384, 0x6cb2.ead4, 0x88f5.9296, 0xbd3e.2af3, 0x5837.6716, 0x1146.d026,
0x41a0.83ad, 0x04f3.b737, 0xf187.0c11, 0x44d8.c9e3, 0x5bcf.e207, 0x28d1.f37a,
0x5907.c3d2, 0x174b.98dc, 0xcac3.2e40, 0x3a21.b853, 0xc72d.6524, 0x5584.0b88,
0x47a6.b46b, 0xf87a.a78a, 0x0275.7444, 0xfd0e.490f, 0xdb8f.cfd9, 0x0f10.0034,
0xad27.5bf2, 0x56f3.f9ce, 0xad2e.eb9b, 0xeef2.7df5, 0xe9da.7f3f, 0xee3b.0be4,
0x4455.8eb3, 0x1d2f.0e06, 0xf2cc.85e9, 0x29bd.3034, 0xe70f.7cce, 0x2a7c.3e3e,
0xe073.973e, 0x2efb.09f4, 0xe234.53db, 0x8e72.2935, 0xf3ec.ea92, 0x9703.9392,
0x2384.e87c, 0x7782.5387, 0xcf2c.463a, 0xa474.8fff, 0x65a9.15a0, 0x6964.42d9,
0x8f0e.4294, 0x4396.10bc, 0xb76f.0bb1, 0xee3d.748e, 0xfd1d.2308, 0x63ba.109d,
0x2d87.cbda, 0xd475.844e, 0x2d23.0acf, 0xe3ed.efed, 0x8fb6.74ba, 0xd681.26f9,
0x4fd5.cbb1, 0x141d.51f6, 0xf1c7.29d9, 0x79d2.7e7e, 0x137e.8d60, 0x1457.396b,
0x4f35.c4e5, 0xb6df.b955, 0x91fc.8830, 0x787c.6b8b, 0xf159.9f7c, 0x878d.7795,
0x78a4.9397, 0x1621.c653, 0xfa2a.9f02, 0x342e.61d9, 0x4e4e.1e12, 0x98c7.274f,
0xb874.994a, 0xa69b.0496, 0x1ae5.aa91, 0x03d2.37df, 0xbf8e.2787, 0xdec3.35c5,
0x8da4.f268, 0x0736.d069, 0x90f6.4f98, 0xc818.b8a9, 0x9ab9.8fd6, 0xfcfb.c7fe,
0x3257.53dd, 0x766c.9e3c, 0xb3be.3279, 0x43da.3fb7, 0xd0ae.93d1, 0x00f2.7dd9,
0xd513.876e, 0xff6b.7ad1, 0x9ce9.33a0, 0xfcff.6f6f, 0xa0e0.e4e4, 0x83d9.fe73,
0x9dee.b943, 0xc9d6.674e, 0x011f.3647, 0x6c15.20b3, 0x89e2.be71, 0x0f25.8c41,
0x7b82.f31f, 0x84f6.ecc9, 0x4f12.a515, 0x1af1.91dd, 0x7384.eb78, 0xbec1.f6d3,
0x72ba.14f7, 0x274e.4fdb, 0x02e9.4fa7, 0x3a0f.b69f, 0xb518.3724, 0x9196.b2d8,
0x47c6.8ac0, 0x25a9.10b0, 0x98c7.1de1, 0x4713.dbbe, 0xb2a8.c2df, 0x8fed.3d0e,
0x6a3c.cf50, 0x5751.9bd1, 0xb551.d971, 0xe23c.7f5a, 0x9d9c.0ce5, 0x1de8.ce8f,
0xd4b4.09a3, 0x4e7d.393a, 0x3afe.f1a3, 0xb486.c07e, 0xd386.7935, 0x1393.e3e3,
0x7d16.73c2, 0x3c96.79e8, 0xfd91.5e6c, 0xe943.4b0b, 0x11c9.3677, 0xc64d.664e,
0x19d4.71eb, 0x2f0b.aae9, 0x3dae.0428, 0xf6ba.4bb1, 0xab8e.224f, 0x0ba6.cc38,
0xb384.3e3c, 0xa4bb.1838, 0x8efd.0a2b, 0x304e.9e9f, 0x1099.3267, 0xa2b1.0ea8,
0x112b.50ad, 0x47eb.a51f, 0xa727.a24f, 0x88d0.d0c7, 0x8e5f.40f7, 0x6670.9c9f,
0xa263.c2e4, 0x70e6.3c26, 0x613e.00e9, 0xe638.1d1f, 0xd08c.87fc, 0x8cf6.ef54,
0x7c38.a3fb, 0xb512.6f7f, 0xe499.2e89, 0x7d83.d9f9, 0x5d84.f8ee, 0x49e3.c22f,
0x0761.5d87, 0x9199.a371, 0x4c71.20ef, 0x0534.e561, 0x4528.65b7, 0x4c8a.fa33,
0xf7c6.b0e6, 0x1347.8ca7, 0xf375.1616, 0x9d53.4dc8, 0xc88c.8c8e, 0xdf7c.2700,
0xeaa2.a802, 0xfb4d.d14f, 0xe0f3.bd60, 0x7605.0390, 0x5827.c75b, 0xeb62.429a,
0x0920.7a20, 0x9c2b.0cb5, 0x39c3.5731, 0x3212.c0f8, 0xe94f.f8f7, 0x3a70.8fcc,
0xf72e.a67b, 0x7147.2631, 0x9e08.0786, 0x87e9.94e8, 0xb306.3f93, 0xac78.ae27,
0xcd90.e8d1, 0x2755.6781, 0x6631.d990, 0x77f5.3027, 0x5ee9.4676, 0xb03c.829b,
0x8ba2.3c3a, 0xd683.0eb2, 0x3d28.e3be, 0x8e79.34eb, 0x7759.2094, 0xeb48.89e5,
0x7d2b.d4bc, 0x273f.4d88, 0xb523.7c2b, 0x13e4.5d42, 0x44bd.8423, 0x6352.3762,
0x727f.11e1, 0xa24c.9ed4, 0xd444.5f11, 0x1202.e9ac, 0xc510.5212, 0xe48b.840b,
0x65c1.ff45, 0x8707.ba9d, 0x63f7.70fb, 0x892d.0264, 0xf7bf.f0a9, 0xe1d7.f747,
0xded5.1972, 0xeb11.6d84, 0x5339.d6a6, 0x0569.4b1c, 0xba43.a357, 0xef1c.3fda,
0x1b55.83ef, 0x749a.3ea7, 0xebc6.ae8c, 0x4ff5.3d2d, 0x2323.d85d, 0x644d.1d1c,
0xf7e1.c361, 0xeb0c.ff9e, 0x685d.f740, 0xacd8.f8f4, 0xadfa.c185, 0x9958.f123,
0x21a3.775f, 0x5469.1ebe, 0xacc8.aaac, 0xa1f8.f38b, 0x72b1.885b, 0xc7de.66e5,
0xf92a.535d, 0x3232.ba07, 0xc5bd.f542, 0x58d0.bf37, 0x73a5.d384, 0x8634.6727,
0xfe3c.da34, 0x1231.0e8d, 0xc383.ad12, 0xcfec.0ef5, 0xece7.0dc4, 0x3287.f0ce,
0xed6b.e41e, 0xf20d.29d6, 0xfb1f.a511, 0x43ef.943c, 0x3fa4.a7b8, 0x88b5.1152,
0x1ab0.4246, 0x4279.7723, 0x8fb4.ec62, 0xc3a3.c6f7, 0x2b22.9fc9, 0xac4e.b446,
0xae87.9228, 0x5d78.e9b0, 0xda3e.bd7a, 0xe46e.c8a7, 0xe6d2.609e, 0x6f44.7468,
0xfdb0.4f23, 0x5d1d.811c, 0xf0cd.2e13, 0x6827.39c0, 0xd040.948f, 0x121f.a36a,
0x8992.84c1, 0xc714.e200, 0x8838.7c4e, 0x5292.ba6e, 0x3313.77e0, 0xb196.37b7,
0x2125.0299, 0xef25.bf49, 0x4439.358d, 0x0287.4e8b, 0xe4be.ac3d, 0xc4b4.90a1,
0x0b1a.06c5, 0x9eb7.b3c9, 0x8401.729c, 0xdf23.ed40, 0x2d27.db71, 0x853c.9d57,
0xa3a3.20ef, 0x7706.8f31, 0xe28b.6a91, 0x98ef.7dc5, 0x4383.ab63, 0xb7e8.d61a,
0x20ea.ac13, 0x8bd5.e403, 0xd366.dc23, 0x7462.53fe, 0x7df3.c6b4, 0x7df3.a028,
0x040b.7095, 0x36e1.d289, 0x6697.0bbd, 0x7e8f.0ebc, 0xe74c.1a8a, 0xc15d.35a0,
0x3ddd.38b7, 0x009e.508b, 0x75e2.68a8, 0x6b74.608e, 0xc797.7c1e, 0x2052.464f,
0xa7f6.3f43, 0x48d8.fd9d, 0x9eab.d653, 0xe489.5d49, 0x5910.85c0, 0x4bab.c273,
0xdc4f.eb46, 0xe1de.f193, 0x6237.779e, 0x1f7f.7667, 0x25bb.5611, 0xe94b.0371,
0x2b39.09f8, 0x3eba.2198, 0x3ec8.b499, 0x4f27.2727, 0x27e4.88a2, 0xd166.2803,
0xe3a2.0e39, 0x1a4d.209c, 0x2963.07bb, 0xfb77.d33d, 0x3c9f.4feb, 0x4fd7.8c99,
0x4ffd.08c6, 0xf831.18ff, 0x3f97.c531, 0xbaef.ada0, 0xc116.52b2, 0x853b.998a,
0x4d9d.a9ea, 0xe0b2.4846, 0x318e.8e03, 0xdedb.3df8, 0xa6e6.36de, 0xc67d.2d13,
0xf2f5.e22a, 0x7ad4.912d, 0x76dc.9f87, 0x4f5c.a674, 0xd4f1.bae6, 0xf4f5.c8bb,
0x8b22.b763, 0x3b3f.48d5, 0x6178.2ee3, 0xb548.fd8d, 0xb1a3.ef25, 0xa755.fc5c,
0x850b.574d, 0xec98.a96f, 0x3bdf.dfdd, 0x4469.f0fc, 0xbbeb.a032, 0x8d0c.114f,
0x4024.147a, 0x2793.a759, 0x641d.ecf0, 0xd8d0.a764, 0x7f1c.9d78, 0xcc42.1114,
0xab6a.0066, 0xe353.0a73, 0x0186.8eb1, 0x304f.36f2, 0x2e79.4c37, 0x9b42.771e,
0xd27e.3d3e, 0xab11.fd82, 0xaccd.6243, 0xc7a1.798e, 0xb200.4644, 0x1d46.ba51,
0xadce.4006, 0x0e7b.ca43, 0x7433.2773, 0x1119.1a3d, 0x1c1f.b7ef, 0xbe78.6792,
0xacf7.878d, 0x339c.119d, 0x56f6.786a, 0x93cd.5da4, 0x7b91.cef5, 0xa891.2184,
0x5713.7744, 0x4601.b0f8, 0x08bd.e0ec, 0xe267.5ef3, 0x23bf.f4c9, 0x65f1.1566,
0xe46e.a09d, 0x7bd4.25b5, 0xdd82.7ad2, 0x77a2.4fb2, 0x0385.e7dc, 0xf68f.9434,
0x9fcf.a1e0, 0x5901.de7a, 0x8704.64e1, 0x4e48.4075, 0x393c.1878, 0x7079.3d3d,
0xfa37.92e0, 0xeab0.33ec, 0x7942.7f78, 0x2b02.7bb5, 0xffc2.db25, 0x23ac.2b1c,
0x4ed7.a3aa, 0x398f.ef8f, 0x7c44.475b, 0x3440.3ad6, 0x1620.8c7e, 0x2848.f0cb,
0x63ed.5870, 0x88eb.53f2, 0xd561.5de1, 0x96a2.5622, 0xa3d0.9711, 0xf6f5.9327,
0xec8f.bba1, 0xe432.cb88, 0xbdfd.dd18, 0x4e25.ce75, 0x611f.7a30, 0xd134.1516,
0x7638.31d6, 0x8b5f.308e, 0x0cf4.6e7a, 0x9cc0.ec1f, 0xeb79.3814, 0x9743.a358,
0x8ab2.d3d8, 0x0923.58d8, 0xa30b.b40f, 0xc7b9.1d7d, 0xc965.949e, 0xec27.8f08,
0x02f1.64b7, 0x3ad1.b546, 0x308d.14d9, 0xb04e.fe18, 0x4fbb.c08a, 0x7dc7.7571,
0xf870.7070, 0x1c67.c9f9, 0x3936.7d5e, 0x3fdf.d839, 0x0539.f078, 0x5127.775a,
0x2734.8b07, 0xfdca.3f38, 0xf1e7.2979, 0x7c25.e398, 0x363b.ea47, 0x9fc5.27f9,
0x208e.0e4f, 0xf0c7.27ac, 0x9185.6083, 0x84a8.a5d0, 0x327d.8b82, 0x10f5.dfc2,
0x1b91.1c6d, 0x3a27.cc24, 0x8087.e713, 0x67a3.753c, 0x3a77.1a1d, 0xb3b7.759d,
0xdb30.098e, 0xa1c5.593f, 0x7548.11c9, 0x93f3.a9d6, 0x9712.5923, 0x6e22.d278,
0x7d70.faae, 0x131f.454d, 0x80f7.f643, 0x8463.a3c7, 0x7304.c4ba, 0xd045.60c5,
0x59e3.84b0, 0x5c64.1247, 0x8850.ece1, 0x725f.30fc, 0xa070.f7c8, 0x29d9.f42e,
0x84e7.f065, 0x242b.223f, 0x4eb2.e422, 0xf4e7.7cb1, 0x0cff.73b8, 0x91ce.5c8b,
0x7078.3f53, 0xeb0e.bfb8, 0xf304.c446, 0x518e.74e8, 0x771f.65dc, 0x6c84.e4f2,
0x9702.9499, 0xc169.ba44, 0x898e.4f9e, 0xa7da.b126, 0x8682.9270, 0x91a9.19d1,
0xbd7f.722c, 0xd49e.fa35, 0x58fd.e885, 0x40a3.0ec5, 0xd1de.b446, 0x3de3.fb1e,
0x9fd6.1a94, 0xc9b5.e8b4, 0xb3ac.2d88, 0x706c.2e0e, 0xf84c.03a4, 0xc3db.17b3,
0x674e.f077, 0x1aa3.4d6a, 0xe8aa.1f46, 0xb7bd.5c2e, 0x57f9.21f6, 0x7a1d.dd7a,
0xeeb8.8991, 0xfe4e.a592, 0x18ad.9edf, 0x0818.4205, 0x3c16.4e7e, 0xc1c5.f988,
0xdb19.f755, 0x9fbd.8d33, 0xb103.c111, 0x6ec0.6349, 0x3890.42b9, 0x42c3.91b3,
0xd932.1141, 0x575d.d999, 0xdb04.aa83, 0xd1e0.7b38, 0x36cd.2b38, 0xdff7.e8fb,
0x7598.381f, 0x38d8.a80e, 0x350d.bc7d, 0x53a0.9631, 0x8e96.317c, 0x2384.df3b,
0x21a5.9bb0, 0xca1f.391f, 0xa8da.8c01, 0x30fa.581a, 0x0ce5.2abd, 0xaf0e.13cc,
0xfb56.602d, 0x61fa.a651, 0x6693.427f, 0xd7ba.1990, 0x20e9.2732, 0x6bb1.2958,
0xd5b1.77d7, 0x7750.ba85, 0xbe2a.8371, 0x0e25.465f, 0x4a61.687e, 0x8dfe.4225,
0xdc74.0ed5, 0x23e2.eb4e, 0x9b22.0ef1, 0x7258.8926, 0xf161.4a34, 0xdc1c.89cf,
0xe927.2747, 0xede0.56e7, 0x5739.1264, 0x4ddc.f84f, 0x9674.12cd, 0xc4ba.310f,
0xd48a.62b0, 0x7132.662f, 0x7fcf.b07e, 0x417d.0523, 0x40d4.c150, 0xbf03.a054,
0x51b5.3a62, 0x61ab.0c70, 0x83d6.43f0, 0xce5c.3e97, 0x00b9.df03,
}
obj = {
  { "painting", 1, false, { }, { }, { }, { { 26, 95, 53, 139 }, { 53, 101, 75, 139} },
    "you look at the painting.\na beautiful painting with\na lot of emotions in it.\nyou can almost smell the\npixels." },
  { "painting", 1, false, { }, { }, { }, { { 209, 112, 228, 129 } },
    "you look at the painting.\nan impressive painting. it\nmust be very expensive.\nit must also be very\npretentious." },
  { "painting", 1, false, { }, { }, { }, { { 422, 115, 455, 137 } },
    "you look at the painting.\nit's ugly. you cannot\nunderstand why people\nbuy these things." },
  { "painting", 1, false, { }, { }, { }, { { 258, 88, 306, 126 } },
    "you look at the painting.\nthere are a lot of such\npaintings in the room." },
  { "painting", 1, false, { }, { }, { }, { { 520, 104, 544, 128 } },
    "why do people buy\npaintings? clearly\nvideo games are a\nlot better. ever seen\na 60 fps painting?" },
  { "flowers",  1, true,  { }, { 3 }, { 3 }, { { 99, 146, 118, 166 } },
    "there was a crowbar hidden\nin the flower pot!\nseriously, what are the\nodds?" },
  { "flowers",  1, false, { 3 }, { }, { }, { { 99, 146, 118, 166 } },
    "these flowers do not\nlook healthy. hard to\ntell in this resolution," },
  { "painting", 1, true,  { }, { 1 }, { 1 }, { { 107, 128, 114, 133 } },
    "you look at the painting.\n\nthere was a safe hidden\nbehind it!\n\nclassic point-n-click\nmechanism, but damn\neffective!" },
  { "safe",     1, false, { 1 }, { 7 }, { }, { { 107, 128, 114, 133 } },
    "the safe is closed.\nyou need the combination." },
  { "open",     2, true, { 7 }, { 2 }, { 2 }, { { 107, 128, 114, 133 } },
    "congratulations! you\nopened the safe and the\ngrand secret will be\nrevealed to you.\n\nthere are no scrolls, the\nscrolls are a lie. the\ngame is called the\nchamber scrolls because\nthe chamber... scrolls." },
  { "painting", 1, true,  { 2 }, { }, { }, { { 107, 128, 114, 133 } },
    "another boring painting." },
  { "pillow",  1, true, { }, { 5 }, { 5 }, { { 51,159,70,176 } }, "you found the key behind\nthe pillow. you're pretty\nsmart it seems!" },
  { "pillow",  1, false, { 5 }, { }, { }, { { 51,159,70,176 } }, "this pillow seems comfy." },
  { "drawer",  1, false, { }, { }, { }, { { 245,146,314,158 } }, "a drawer. it is locked." },
  { "drawer",  1, false, { }, { }, { }, { { 245,158,314,172 } }, "a drawer. it is locked." },
  { "drawer",  1, false, { }, { 3 }, { }, { { 245,172,314,184 } }, "a drawer. it is locked." },
  { "drawer",  1, false, { }, { }, { }, { { 245,184,314,196 } }, "a drawer. it is locked." },
  { "crack open", 2, true,  { 3 }, { 4 }, { 4 }, { { 245,172,314,184 } },
    "you crack the drawer open\nand find a plastic chicken\nwith a pulley. what a\nweird object." },
  { "drawer",  1, false, { 4 }, { }, { }, { { 245,172,314,184 } },
    "a drawer. it was cracked\nopen by a vandal." },
  { "lamp", 1, false, { }, { 6 }, { }, { { 441, 100, 452, 106 }, { 130, 90, 144, 98 } },
    "why are the lights on during\ndaylight? clearly i should\nhave downloaded another\nstock photo on google\nimages." },
  { "use plates", 2, true,  { 6 }, { 7 }, { 7 }, { { 441, 100, 452, 106 }, { 130, 90, 144, 98 } },
    "the photographic plates\nwere hiding the secret\nsafe combination! kudos to\nscience once again!" },
  { "lamp", 1, false, { 7 }, { }, { }, { { 441, 100, 452, 106 }, { 130, 90, 144, 98 } },
    "why are the lights on during\ndaylight? clearly i should\nhave downloaded another\nstock photo on google\nimages." },
  { "look", 1, false, { }, { }, { }, { { 130,118,162,152 }, { 389,114, 402,154 } }, "the weather is beautiful.\nvideo games are too." },
  { "chest", 1, false, { }, { 5 }, { }, { { 503,177, 514,189 } }, "this chest's lock requires\na key of some sort." },
  { "open",  2, true,  { 5 }, { 6 }, { 6 }, { { 503,177, 514,189 } }, "you find old photographic\nplates in the chest.\nwhat could they be good for?" },
  { "chest", 1, false, { 6 }, { }, { }, { { 503,177, 514,189 } }, "the chest is open but there\nis no longer anything\ninteresting in there." },
  { "go outside", 2, false, { }, { }, { }, { { 493,123, 501,156 } }, "why go outside? this isn't\nan escape game." },
}
function u32_to_memory(dest,src,size,offset)
  offset = offset or 0
  for i=0,size/4-1,64 do
    local first = i + offset
    for j=0,63 do
      dset(j,src[first+j])
    end
    memcpy(dest+i*4,0x5e00,0x100)
  end
end
local reverse = {}
local function bs_init(addr)
  local bs = {
    pos = addr,
    b = 0,
    n = 0,
    out = {},
    outpos = 0,
  }
  function bs:flushb(n)
    self.n -= n
    self.b = shr(self.b,n)
  end
  function bs:getb(n)
    while self.n < n do
      self.b += shr(peek(self.pos),16-self.n)
      self.pos += 1
      self.n += 8
    end
    if self.pos >= 0x4e00 then
      memcpy(0x0, 0x4e00, 0x1000)
      memcpy(0x1000, 0x6000, 0x2000)
      self.pos -= 0x4e00
    end
    local ret = shl(band(self.b,shl(0x.0001,n)-0x.0001),16)
    self.n -= n
    self.b = shr(self.b,n)
    return ret
  end
  function bs:getv(hufftable,n)
    while self.n < n do
      self.b += shr(peek(self.pos),16-self.n)
      self.pos += 1
      self.n += 8
    end
    local h = reverse[band(shl(self.b,16),0xff)]
    local l = reverse[band(shl(self.b,8),0xff)]
    local v = band(shr(shl(h,8)+l,16-n),shl(1,n)-1)
    local e = hufftable[v]
    local len = band(e,15)
    local ret = flr(shr(e,4))
    self.n -= len
    self.b = shr(self.b,len)
    return ret
  end
  function bs:write(n)
    local d = band(self.outpos, 0.75)
    local off = flr(self.outpos)
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
    self.out[off] = n
    self.outpos += 0.25
  end
  function bs:readback(off)
    local d = band(self.outpos + off * 0.25, 0.75)
    local n = self.out[flr(self.outpos + off * 0.25)]
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
local bl_count = {}
local next_code = {}
local function hufftable_create(table,depths,nvalues)
  local nbits = 1
  for i=0,16 do
    bl_count[i] = 0
  end
  for i=1,nvalues do
    local d = depths[i]
    if d > nbits then
      nbits = d
    end
    bl_count[d] += 1
  end
  local code = 0
  bl_count[0] = 0
  for i=1,nbits do
    code = (code + bl_count[i-1]) * 2
    next_code[i] = code
  end
  for i=1,nvalues do
    local len = depths[i] or 0
    if len > 0 then
      local e = (i-1)*16 + len
      local code = next_code[len]
      next_code[len] = next_code[len] + 1
      local code0 = shl(code,nbits-len)
      local code1 = shl(code+1,nbits-len)
      for j=code0,code1-1 do
        table[j] = e
      end
    end
  end
  return nbits
end
local littable = {}
local disttable = {}
local function inflate_block_loop(bs,nlit,ndist)
  local lit
  repeat
    lit = bs:getv(littable,nlit)
    if lit < 256 then
      bs:write(lit)
    elseif lit > 256 then
      local nbits = 0
      local size = 3
      local dist = 1
      if lit < 265 then
        size += lit - 257
      elseif lit < 285 then
        nbits = flr(shr(lit-261,2))
        size += shl(band(lit-261,3)+4,nbits)
      else
        size = 258
      end
      if nbits > 0 then
        size += bs:getb(nbits)
      end
      local v = bs:getv(disttable,ndist)
      if v < 4 then
        dist += v
      else
        nbits = flr(shr(v-2,1))
        dist += shl(band(v,1)+2,nbits)
        dist += bs:getb(nbits)
      end
      for n = 1,size do
        bs:write(bs:readback(-dist))
      end
    end
  until lit == 256
end
local order = { 17, 18, 19, 1, 9, 8, 10, 7, 11, 6, 12, 5, 13, 4, 14, 3, 15, 2, 16 }
local depths = {}
local lengthtable = {}
local litdepths = {}
local distdepths = {}
local function inflate_block_dynamic(bs)
  local hlit = 257 + bs:getb(5)
  local hdist = 1 + bs:getb(5)
  local hclen = 4 + bs:getb(4)
  for i=1,hclen do
    local v = bs:getb(3)
    depths[order[i]] = v
  end
  for i=hclen+1,19 do
    depths[order[i]] = 0
  end
  local nlen = hufftable_create(lengthtable,depths,19)
  local i=1
  while i<=hlit+hdist do
    local v = bs:getv(lengthtable,nlen)
    if v < 16 then
      depths[i] = v
      i += 1
    elseif v < 19 then
      local nbt = {2,3,7}
      local nb = nbt[v-15]
      local c = 0
      local n = 3 + bs:getb(nb)
      if v == 16 then
        c = depths[i-1]
      elseif v == 18 then
        n += 8
      end
      for j=1,n do
        depths[i] = c
        i += 1
      end
    end
  end
  for i=1,hlit do litdepths[i] = depths[i] end
  local nlit = hufftable_create(littable,litdepths,hlit)
  for i=1,hdist do distdepths[i] = depths[i+hlit] end
  local ndist = hufftable_create(disttable,distdepths,hdist)
  inflate_block_loop(bs,nlit,ndist,littable,disttable)
end
local stcnt = { 144, 112, 24, 8 }
local stdpt = { 8, 9, 7, 8 }
local function inflate_block_static(bs)
  local k = 1
  for i=1,4 do
    local d = stdpt[i]
    for j=1,stcnt[i] do
      depths[k] = d
      k += 1
    end
  end
  local nlit = hufftable_create(littable,depths,288)
  for i=1,32 do
    depths[i] = 5
  end
  local ndist = hufftable_create(disttable,depths,32)
  inflate_block_loop(bs,nlit,ndist,littable,disttable)
end
local function inflate_block_uncompressed(bs)
  bs:flushb(band(bs.n,7))
  local len = bs:getb(16)
  local nlen = bs:getb(16)
  for i=0,len-1 do
    bs:write(peek(bs.pos+i))
  end
  bs.pos += len
end
local function inflate_main(bs)
  bs.pos += 2
  repeat
    local block
    last = bs:getb(1)
    type = bs:getb(2)
    if type == 0 then
      inflate_block_uncompressed(bs)
    elseif type == 1 then
      inflate_block_static(bs)
    elseif type == 2 then
      inflate_block_dynamic(bs)
    end
  until last == 1
  bs:flushb(band(bs.n,7))
  return bs.out
end
function inflate(inaddr)
  return inflate_main(bs_init(inaddr))
end
for i=0,255 do
  local k=0
  for j=0,7 do
    if band(i,shl(1,j)) != 0 then
      k += shl(1,7-j)
    end
  end
  reverse[i] = k
end
function blit_bigpic(lines, dst, dstwidth, src, srcwidth, xoff, yoff)
  local data = src[1 - xoff % 2]
  xoff = band(xoff,0xfffe)
  srcwidth /= 8
  dstwidth /= 2
  local dx = band(xoff,7)
  local xoff = flr(xoff/8)
  local srcoff = yoff * srcwidth + xoff
  local w1 = min(max(0, srcwidth - xoff - 1), dstwidth / 4)
  local w2 = dstwidth / 4
  tmp_mem = 0x5e00 + shr(dx,1)
  for line = 0,lines-1 do
    local off = srcoff + srcwidth * line
    for j = 0,w1    do dset(j,data[off + j]) end
    off -= srcwidth
    for j = w1+1,w2 do dset(j,data[off + j]) end
    memcpy(dst + dstwidth * line, tmp_mem, dstwidth)
  end
end
strlen = {}
function _init()
  cls()
  local s = "\151"
  for i=1,#s do strlen[sub(s,i,i)] = true end
    u32_to_memory(0x4300, rom, 0x1b00)
    u32_to_memory(0x6000, rom, max(0, #rom * 4 - 0x1b00), 0x1b00 / 4)
    local tmp = inflate(0x0000)
    local u32_offset = 0
    u32_to_memory(0x0000, tmp, 0x4300)
    u32_offset += 0x4300 / 4
    for i in all(image_list) do
      local u32_count = i.w / 8 * i.h
      local pixels = {}
      for n=0,u32_count-1 do pixels[n]=tmp[u32_offset+n] end
      i.data = { [0] = pixels, {} }
      u32_offset += u32_count
    end
  music(0,0,1)
  for i in all(image_list) do
    local data, w, h = i.data, i.w, i.h
    for n=0,#data[0]-1 do
      local off = n - 1
      if n % (w / 8) == 0 then off += w / 8 end
      data[1][n] = shl(data[0][n],4) + band(shr(data[0][off],28),0x.000f)
    end
  end
  for i=0x2000,0x2010,2 do
    poke(i,16) poke(i+1,17) poke(i+0x80,32) poke(i+0x81,33)
  end
  memcpy(0x2100,0x2000,0x100)
  memcpy(0x2200,0x2000,0x200)
  memcpy(0x2400,0x2000,0x400)
end
world_x, world_y = 0, 0
mouse_x, mouse_y = 0, 0
mouse_speed = 0
mouse_type = 0
mouse_shake = 0
fog_t, fog, fog_dir, fog_color = 0.5, 0, 1, 0
state = 0
function _update60()
  rnd()
  fog_t += shr(1,7)
  local new_fog = 8.0 * (1 - cos(min(fog_t%3.0,1.0))) - 0.5
  fog, fog_dir = new_fog, new_fog > fog and 1 or -1
  mouse_info = nil
  mouse_type = 0
  mouse_shake = max(mouse_shake - 0.25, 0)
  local clicked = false
  if not down then
    clicked = btnp(4) or btnp(5)
  end
  down = btn(4) or btn(5)
  local image_width = current_image.w
  local image_height = current_image.h
  if state==0 then
    world_x = (world_x + 0.125) % image_width
    if fog >= 15 then world_x, world_y = rnd(image_width), rnd(image_height) end
    if clicked then
      sfx(2)
      world_x, world_y = 170, 190
      facts = {}
      state = 1
    end
  elseif state==1 then
    if not btn(0) and not btn(1) and not btn(2) and not btn(3) then
      mouse_speed = 0
    end
    if btnp(0) or btnp(1) or btnp(2) or btnp(3) then
      mouse_speed = max(min(mouse_speed + 0.25, 3), 1)
    end
    if btn(0) then world_x -= mouse_speed end
    if btn(1) then world_x += mouse_speed end
    world_x %= image_width
    if world_y - mouse_speed >= 0 and btn(2) then world_y -= mouse_speed end
    if world_y + mouse_speed < image_height and btn(3) then world_y += mouse_speed end
    for k,v in pairs(obj) do
      local context, mouse, important, facts_wanted, facts_notwanted, facts_activated, coords, message = v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8]
      local wanted = true
      for k,v in pairs(facts_wanted) do
        if not facts[v] then wanted = false end
      end
      for k,v in pairs(facts_notwanted) do
        if facts[v] then wanted = false end
      end
      if wanted then
        local inside = false
        for q in all(coords) do
          if (world_x >= q[1] and world_x <= q[3] and world_y >= q[2] and world_y <= q[4]) inside = true
        end
        if inside then
          mouse_type = mouse
          mouse_info = context
          if clicked then
            sfx(2)
            for k,v in pairs(facts_activated) do
              facts[v] = true
            end
            message_info = message
            if important then
              fog_t, fog, fog_dir, fog_color = 0, 0, 1, 3
              state = 2
            else
              state = 5
            end
            break
          end
        end
      end
    end
    if clicked and state==1 then
      mouse_shake = 5
      sfx(0)
    end
  elseif state==2 then
    if fog_t > 0.5 then state = 3 end
  elseif state==3 then
    if clicked then
      sfx(2)
      fog_t, fog, fog_dir, fog_color = 0.5, 16, 1, 3
      state = 4
    end
  elseif state==4 then
    if fog_t > 1 then state = 1 end
  elseif state==5 then
    if clicked then
      sfx(2)
      state = 1
    end
  end
end
function draw_mouse()
  palt(0,false)
  palt(2,true)
  local x = 64 + rnd(mouse_shake)
  local y = mouse_y + rnd(mouse_shake)
  spr(0x40+mouse_type,x, y)
  spr(0x50+mouse_type,x, y+8)
  palt()
  if mouse_info then
    box("\151 "..mouse_info, -1, mouse_y - 20)
  end
end
function title()
  local blit = function(i, j)
    print("    a pico-8 game", 50+i, 85+j, 7)
    print("  by  sam hocevar", 50+i, 93+j, 7)
    print("for ludum dare 37", 50+i,101+j, 7)
    print("press \151 to start", 53+i, 120+j, 7)
    sspr(24, 0, 80, 32, 5+i, j, 118, 80)
  end
  for i=1,15 do pal(i,0) end
  for i=-1,1 do for j=-1,1 do
    blit(i, j)
  end end
  pal()
  blit(0, 0)
end
function box(text, x, y)
  local l=#text
  local w,lw,h = 0,0,1
  for i=1,l do
    local c = sub(text,i,i)
    if(c=="\n") then
      w=max(lw,w) lw=0 h+=1
    elseif(strlen[c]) then
      lw += 2
    else
      lw += 1
    end
  end
  w=max(lw,w)
  if (x<0) x=60-2*w
  if (y<0) y=55-3*h
  rectfill(x,y,x+4*w+6,y+h*6+6,0)
  rect(x+1,y+1,x+4*w+5,y+h*6+5,7)
  print(text, x+4, y+4)
end
function draw_world()
  local data = current_image.data
  local image_width = current_image.w
  local image_height = current_image.h
  local lines = 128
  local dst = 0x6000
  local dstwidth = 0x80
  local srcwidth = image_width
  mouse_x = (flr(world_x + rnd(mouse_shake)) + image_width - 64) % image_width
  mouse_y = flr((world_y + rnd(mouse_shake)) / image_height * 126)
  skip_y = flr((world_y + rnd(mouse_shake)) / image_height * (image_height - 128))
  blit_bigpic(lines, dst, dstwidth, data, srcwidth, mouse_x, skip_y)
end
function draw_fog()
  for i=0,15 do pal(i,fog_color) end
  for n=0,15 do
    for i=0,15 do palt(i,(i+n)/2>fog) end
    map(n%2, 0, (7.5 - (7.5-n) * fog_dir) * 8, 0, 1, 16)
  end
  pal()
end
function _draw()
  if state!=3 then
    draw_world()
  else
    cls(fog_color)
  end
  if state==0 then
    draw_fog()
    title()
  elseif state==1 then
    draw_mouse()
  elseif state==2 or state==4 then
    draw_fog()
  elseif state==3 then
    box(message_info, -1, 20)
    box("\151 continue", 72, 111)
  elseif state==5 then
    box(message_info, -1, -1)
    box("\151 continue", 72, 111)
  end
end
__gfx__
87c9cedbd5c6429d597e7199accead697b5ac49a25bf0bea546314acf26913a78e10cb67919547421ec4b3899945607c6fe6ce4b605c84c8dd926f20e121b3ba
e928771e72f387ced4f8132084ac04a7481105c2c206303f8336fab5f4d0459a222ad558ebd5d63869d420d3a6c8355d0630c6afcffc9b732e64e70f3aa52d81
beab555c2239911173e71ff37ee937eed8847c9f797adbdf3af1ff0e5df189f9e78f38f3cf1eba6df6f70376b8c7bf4c970ec75f746e7add3ff1fbdf56be7bf3
a93b5c47b70cf75a3373c9f1e72f506bff4e60dfbf27ef77796bb74f79ec3f7cfaaedef74faa3f3cf1fbaf9cf8f55a754ff2e7897e0ff8ff9f73ef3df3bffcf6
542f3df10dfdb1f5df4e6cf1aede77f31a71f704ff1d737febcfa2e717fe68d05d9f73ff86bffa65efedff4ff1bcf4f93671f9d72bbf367c9f8ebaecf1e7473e
78f5df1eeef8e3ab1f1d79f78f5db74c38e71f70e8d725ec72fa54dadfff3ef5ff3f47bffcd9ffb8635c7f7fe3bf8ebaf6f75e183f9e74f55c73f93eb1e7b8dd
adff3cfdbf7ef7be7fff4eb76d6ff377ef2fc9ed8f1df5e74f1d75f39facf5e9ffc1bd3eb9fa0e7135bdfff6ff4eb9bdfb8fbfff3f73da79eb26d7ff19ef72f5
6e4bf78f77e8ff9dfddf1e75e83fb9cceebced9addefdef9cf3cf75ff5cfbff76ff471cfaf2d6ff7ff3df77e763cf9eacf6bdfadf3223387571d6035dabffacf
9df39f7de7ffef32be5af3dd57e3a709fde77127e9bdefba9871ff6f7273ef1bdf66a7be749fde96bedd9fbdfff2f77ffbffbdff3ef70ff2efdbce59f48fd993
19c50bdf797cedbfff8efb9f73ef7fce59f8eedcebbeded5ee5dc9674bef3bfeefd9ff3ff3cff2da79ef06ecb371208fddffaff6ff9df71f7fffcdef5e7e7f66
fdab07bffb9f39ffca3f75fdcde98dfad7e7f060cecf8f70ece257c161c2bdfeec9378ff7e6f39f3c7de9cf3bf7b6ae074b9cfefd83c75fd6ad4e39ddf8e70cb
d302ccde3cc96bb834a38d4e609328ffe46bfb1ecbd75ddefdef10f564c9431d8f1dba2dff50a1ac7bf487bff1d7466bffc963cf2b0fbb2de085a74fe42f56f5
6c644e43e742df77ea47eff1d9fbaecbdf9e75c9fcfbabb7387bf387b5f6f0c1758def3afcfc7716eef9fd3ab268fffc94f7738ebd977dfefabb5d796969ccfb
2eb8ce086b33ffe546bf7b9e0c6efdb0d6f7386b5dffe586bfddaf2db9affdb8c6ff6eeed8523ffe5c6bfddaf3cd17690ffe5c6bf1cb2ecb95f52cfb719def1e
ecd0769eb6fa31cb71cde3420fca282cbef24bdfb2b35f2e73ebb475ff785f71adebef66dfd67ef6dd871dde98cfb2f6ff9b3f2cbd318b7dede277f6cb8e9f3c
4fa8fb5b5f2c7efb486f508ffcd675e162c17667c5bddddbe8f9b7b3b733b77d7b1f3ed8ba7708e0f73cce80d597b977175e17a0fe79de17842f1df6fbd0f9d7
d8def68600734ff4cffd5d7b77e6ceeeaedef6ceed8b14bd30fd536bfd5dd10e3b774f697d8dedcbb9afcbba7bf7b77fa7bd33b3ede9ecf98fd2e86171570e68
c5d7a3eae32f537b7d79c8eff7bd1ee0c5f6b76d0ee27f3ed6eeaf57c0007866dcceeeace2ea5af796690ef5c2848fffe5061f2bdbc6f2bdbc6f2bdbc6f2bdbc
6f2bdbc6f2bdbc6f2bdbc6f2bdbc6f2bdbc6f2bdbc6f2bdbc6f2bdbc6f2bdbc6f2bdbc6f2bdbc6f2bdbc6fb6a6585df77ddb3fff3ef7f5bf2f75ef6cfdcfb1fa
eb25e75a8fa41a473c9293547a0ecf541a075608e83da75b9faed97596f15a2cb22fdfd9b177ac77eb43bf6e6dcf569ed82c73efaa8fcb8392e969efaa4f3f2d
f5698ebb2ef583f717dab097d973f2865979bf879bf879bf879bf879bf879bf879bf879bf879bf879bf879bf879bf879bf879bf879bf8f7917f1feebbfe68f61
7b7fedd03cd9ddf5f6b03c77391eb534e3ef70a2977fddf53f1ffaed60f390fd226538fef7f1d7d773cfb69e348f6522ca2944dbb9cfabf26d5dbdbb1e7ffdd0
fddf948065fb67d417bd9012d2595b8384fbd42909bd0efa3a3633d242d5df4e72f391cb5f6decfa7545381013024418f53a6e76d262651b60614018cb84f3d0
ffad99dbb30665f390f7d98a67802134026106234d2f1a6a2c7b27f6502d4216a6861312bd9b04ef30eb40cb54ead014a77e2ad2fa0dedddd7b242454d9df24b
b9ba732c1146a49458230c8c2fe29d262f6d28d09020c0412c300b9dfd668436bcc8d816b8c59d0b3cb017f2e62aba71cd8fabd6016218fd3f9afb3b79660f61
d818fe26c4cbc6710bb5f33e5306356f36f303426ec06eb3c2ad1a073613f0faf4c8cda3dfdf5b8b570826e43ff851eb5a485d5ed591422203816929d9202d55
bf11a19adc1d7e54d804dcbbe075962eb16ad5386fc033f6e441bddd50724f652fedbb9cbb75dee780a526cc3c711ff1301261f576be1c5ff042aa73364190a3
0336d39758856c2b8560e23b5884ae2e34d0ed20ba4eddb21ba104058e1403c717390638e8fa58bea5b77abc12e99590d899e9a1da13bc08fd344a8a3479e931
17a77fdbb21b29d32deb13e9e52790e2960b7eb85fef24d8839f10b46ea66728331d6921bab2c6138094859cb779eb31a255a9d3c6bfa4b3fb86f726b8f586f1
9b612c1e017abeaf6b4208dac59c9ac08dbbf0fbf79cbb8845069e060a8eafd715950d55d0ea24bc402871405c4a9fa1e25e5fbb44254f926d4e1dae25cc122c
680f2665124741e4fb41ccd3fcd9d91cee5534d784166d2177428d840d684927994d283ce9931cd29b154c44f24a1d140ad24600c51f52e3b60880be242a308f
7a99e904a59dea77839b5ac2792f7b43f18d90707905b14eb38084a428fdc5206417c5017a8c689398142f17cf286cc48a2bb2ecd99b8d5b483c773cb82eb265
0dcbfd3d507ce95450a5c09b6421810adee50108e04b4b603039128f18fcc62d6689509ef0ccb463f927e07db60559d4999bf544b678480710ba461f0a7cfba0
7725233bbb62561efcecec2e4b09af74917a211e03d80cf9a6294499f100dc7e868867d3bec1ea1d60470d9614268dab044af619dfc2cf5287c283dcd91092bc
a08e617bd109c546e805695c04b5d904b02b7d8fd291231975ceba77e2d3af2a638dc9545ad3ec249e424ca61df231ab6eb0e840bab4e2cb809f7ff024135bcf
1a24c88a1b0b2d096a56564862ff5c93c7ef0f2d403579144f85a6d513c59e9bb1cc19b5adddd9dd543e062b07b2d72d9407da83b05264bedf438f01a1cf9c17
23ad16c20fd529b985c8c2a51f2e0418ea6eecc98434b74085cc2837b461e88838fef2aa3a58b805d0253cb4619ee614bcd806a40681745a9f0739ced892506a
1db61c43ea81343483315ac0e2dc7b1ae9d99ee29964c17e3ca1cec280888c39cc70165f360ae507cb6e0ef54b20f24cff3b4b20b8dc4db0a97dc83f754ae1be
4dea4a4723997767d8748993ff1c207a5389dbc22d6e3aa9ab26fef5fca03ddb82d38b9c0c710313d0725a3958d01c47bcbf3389cc5fa6dd4034ea1f06e7c080
d9ccb3fa54121ccb77f4bf66851e5f585418284c60c1a240ce3966078dcb6616951348812e5f069d727389ba0a50a499b1dfc0022d99717e0d351f5758580f63
0d12084cd9b004564b6e0cacb8b84a5b03a21a0f660973dc45656a74376b253f689c9fca6edb57ea20399f981e2e642aa83d0690578e837d6a1bc24565e961d0
889fb294345fcad799140764433b0a7a97e5872433b1f20dfc5fc361d88c184c200b025696a610ca58e3b6a96192b2b4d2debefb3cf7cee3cc3c037c1cf5da69
237c2071af387ffa32c26458477932584df9bfb81bc2670f330b42a92b5d48c7188ad491e046537c7af4f52f7f38b29b79953cab0c57e53c36d049451a36d122
cc5b7bc361b859cfdc7359785b362a0082b01a48e4fd3c18c73cd4bcae2b238013dba8a020f7ae4ff22a1fef593b2b1422108370b035e7a890dc1852f2c410cc
ff061ca05831821bf62468d9f2e7c06734f3037a3790da973ebdcc9df430db0583380ea81cb32b70e12e3891f8eb8069e25c4014af21764d356196938783478a
967c4504235f06044e2322d9d56113c58d16f35fad4ce1b74197aded0376553858e5dd4b4ea864890b6a47cae754851897d3d8338f5b92b5c41612ec281c9ea2
1d08bbfaba8662abf0cf7705f2437eb71d9d9e8e17724d3858e44c5f07a8d1ebf1c65e6b8bc6838106f8659e79b44e37e0c189c6645075385e3f03092b2b8f9f
1c2056949d1772b62efe1534ad5e1f15b85076d6427b85b581b09fd52338e69b9c897e29778cbac5fac241601f4f2668479138d7c5639a93e4d711c2df5cc7be
b1314daba9be4b4582a99c8595d8f571f8d30d8b4af63f5a5420d7f3e1ac496a9431c8f109f19eaaf536296465b340a6a72a5c41fc591e581209b003282289f4
b270b6a859dedbc6f869785341782bbb36aead98cc3db958564953ce81b9cd5117d06e9122a4a34f6c8579a676b0b61b9be775b904299577252e241268982dbe
9221935c49a403f969f63931069ab67df36af2ec5f9503a91036a449a9e3f36964cce2a775486bb6865eec797c60c9e5c62c66f57f853529ec986b87efaf21f8
d126e345bbbcda939657a706ac345522eb9df8f2b63d0b2565e7e95d2485a85c33f035d406ae9dd84d8293290b7a058d3e166d130d57233db03e34c4182d4157
1d3eb0a0ff06e629b91c5a321681848a0837c93e3d7e1c2f37f256ab2fd856a91913b805d851aa4d02b799a96abce5a171bb4324340b4f5c6e18e601a9d98e41
34fe623dfb44988e5602525a5431a403e3b567febf79c86094c6c55dcd100f225695f2660961a2ba664349b55e93565861e2c099127e9d2ac2e0a0601accfb5a
c88abe18e5646abf34a41e5d01969b2996dc15c489ec3fa178ea3722d36fcc2bd02595d5eca6e2c2dca27fbf503816dcfa653f072dd7c43032bc9148a3e1b189
96c8d903132321b435a66bc5ba981879e199919d4bfdaca07c9df26376bc216f8b8986b819ab2c5f169f61b2f5c779f96567c2060255da6a697c7d64955175c9
b5e0918690f16a523076a3564c9a8d4b877abbfc7c51f86ef4d21d81423fc9efbf71a3c232ba0ccc63cb0891a17de968ee200d8f1bcc5691259d146af40dc252
2d4b689f9f275a949f6296d918535dd7cafe4eed8a83f2da18a9f55bfb03c7ddc04b50ae3c4674dba3c2dcac49b1ccb696406937feef5a2d55995c6e865291ee
99900854cb209943169abf99f8f0715d4128b085d0ea81e2c500bcfc8591fd52fa9e12c37e2bea67480495863f2a2fd7d32bd50d9b96a501ba4f45fa5494616d
0473f2825f42ceb4f2d061e248533ca4fb6e7e33543649754c5658bf9745b8dd3d2cd31e67a0f57fc78b366e126e5ea9fb533ecd3555d08329cb234ac0e4e20d
7908435334da623ca6a279ebae13caa512543f16a1bffc33abb4161bfd2f5ce03eb8a85c4ecdde071672cc2f25d2ba7118535f39f9bfb1898e476ba5a7d16620
8a74e5b6183b3ffa4b73da141a54f3f2c1be826f5de0b6095c8529ad39cae5c05963b3df73babc4c6c1596fae3b129e53bdce2e8b9de8c555a50cc711c2d921e
b32597c9ea784894a35637530433caca8312b824d40956c62fb8103d3026f61d0c07d2856607e9d497c0ebdcda4beba93851e6a49d8fa2703de38614753ecc78
d49ea4fb3e5c97172f75be5ed9ab9663daba0c28f04634a077de29766e5e70fe7c29728e4dd5f2c84a712f3eac58c926bd949f6eba40ae65deaca0cac265f50d
41766cfb711a560d36744d37bae3c99327250174eeab624c6a829130c3b7c67f1e2eb2397d59980a25d5d49a925f8ff58d769e10171ef6d2a57528510716392c
6bcdd4fba70fbd918f25dd619a9e2ad2f83cf86aaf0793b2fdaf1d665e7e955e2b4cba0e8b4e7f1f2801dfa34bcc1a26e5cf30856445b31ae08b8efb02cddd19
aecacf3d73a5dc196f24e497f75eb518285638146a62d4638bc1692125ae26e53f3bfb9ae6fc5f8a3d0b8cb61cc0924cd4466a4c2fc54c620d9555216216652e
846e94bf283456172847b0b5b9bc9eb94f628cc2f25e7b03cc25c5d50ec8d8b6b2711d259317c26e5792c2db8ae26f9f6006839ad51fe4c77dfa2eef278d9c38
0825fe686241ebaf13d2f8d961f5c2d59fabc8b96e1d17ece266f04a4ac042ca490fa8f20e5716abc71d918ac25833bbaccfb78ab098b31aeb59a3b3b56311e0
be492ec3ef29e899d2d468c1bf9e8e66613770a7218c44de92b2fd8e92d3a7e149ebbed35d59a47d2aec1ca35d7ab60d2ede2f0a5b4b47a5e30105a708459fed
a446753fb77187299e8f4d4c7968988e94b6530b959f923b541726a262b0798d06c9b5ac49292df555e7727953365bace2d04aca0dd617d48b5b19dee89d81d6
893f3e354e00fe279c7aaa2fd825cc6f95b025db56aba83b28fdc2c2b8599f925d5923ede7abb33357cbba1c2665a27ac2e3e0fa6659908339288f6632c43894
1a6da39c9379176069f6cd3bf99c920d5e94e9b10f53cccbeacf9a9dbf993309bcb6eb559a6c6acfcb2d340c43bab22ca0c8c7dadc256513fd22e2630cab2ebb
a85ab4189b091b823494ffe24856c5c9645b8b5c753659b33003fcc56566f8a6a731debffaf0b2338fcd84a2e2b8a304725a4608738a43b25655ab359ff58795
c2f051f50c94e7b9e8c86dff377fbc5f42527b0100e8cfd89f53316489e7990c220597fc375685af254e2ce0936b8fa0d7f717a3842f5b2330d85e732ddfccc1
40f526d157e5809c67b59733c5c2c24f244b22e23550a155cacae492b7cbc06ab3f711c259588b6c0ed0ab8dc4d2022701f249a7c4dcace8afc645a610b296a7
2cbfac4b26df738b05756ecfdc3070201d596659a4b2802579f65441f22381a57246c6a4bbc29792b156c0aec3cd4d96c5cca66760df25a5616ab8955a6c62c1
45af0b603d92de9dc6657da03b4671a7f5189918ecc901e50b6441b256c92822dd3670b712bab08b88fef9e6c3c4e58efa23d55aca23a42a13e795e445b4dc26
5adf6d5038870ac850b1184e0f99df6ee62ca4595a6e52f9799ca6add97e3e42b08d4125b3c78937a169518290464b2d4e9d32a748c45946815a1199ed9401c5
40b2841e2f7bacb02da1daec5a27bf3b06963afcf0a7acc51b504a6a0550140979193e41a2dde985e999c3f49656169dc165ac8ea4cb6a2564e42ab25abba9e8
6f69d0a2b230eb8b8f09a98be1b38fc92bd8debc095fcc26597a5a4b8b7e3aa0c6e21844b6ebf5e23f3ad0b04c90fa71c170cb46cbc8dfc4161be0326ee934a3
ca06df7956c76a34c1cb7a4745c9a9bade0e2891fcd9b384096c49188d3bc959f6dfe5d4b4b4a76660399edd9a541f55e65ea86374ef0c8824a2d1c6ae921e5c
fea837a4433d3837859e32b6f79690b4fbc1b6f739aea2f6e81409df79a7489f7944743518ae75c75af4c2dfd7666817ef53517e25784f75b8845a2011da09c9
aed5af9c337e069d9b78fd658fda6065c687e2e390642eb13d3b099d3ce5a1b65ec575ed55d208567ea2a282bf5de5c6e4d66955c9f7d6e871f9fe8ddec0b380
438a20ac83658a113b164a4a514d5a360dc4753f3fc94389659e8182ecbc48751ba926535eca2892755b01699ff5545e878aa6551856c965e855a27d430a992f
753fa85420b2638a8eb4dd9e9fc3e84a1046ea9ed5057694b56a2b59e088719ea4b39a0c0a25a18d54ab2b1656192d581d618d775d078a28a8476c7fd0ce4949
ede35b1c91c2377ccdcace22f3a359e963af58d8961e06537abebf9d0b018f1fcd8b1273eb96555afd898ad7ebea6ab3c37223d937a9e597b4583c1e038aa6fd
b18ffcc427393ae6a37a87180c477a711929354fb0d56257108234b41b5149d9e9d51b117773de0e3d0da26910ac876f837e1e7e8ea66169485a2a9c04775666
c0b8387485dcf056555e4bcf66291f9c1ca4f8b81af76ea27e839645a74ff279b79540433d68aca74ee5ae01bce02e35f57426ce4b6ab08c9afbac636d62817a
1ed8dee4ce13dcedf4a9426c2bd5a65aa8d19a1264eda4e170840b451427fa6621d20859ee4dfb424ddc051d9e599c2a28c9782c39c9cc31d98eb2ff7af9729a
b6c2ce5ebb6849618e493e556231d0c84b4b3ca0c6d55e743c876c00596559c0e34da05eab3582795bff05993765efd197426e09abb14da783dc6ea5093e36b2
b2eccb8d50aaa4def07670f8e696a68cd43c2126cf33eb893b5d3e2294bcf47214cfc7dedd6948a413b17851befb353e39174c9d877a83a6207ae6d9adbe9da8
0704b2415871f5d3f8c1bbe7c782fd4d256ce0c6659585ba74a01f82b816953cd3be0a659ea98b025058661ba03b75d67d583117c27a51cc38518e0ee25466c1
65c9aeac2651461224ca3993ebcb58265a2e7c9d59a470b0a156a257fd7f8f01ef32d7fcf42c0b200ca6ea9fb061ed81ff8b8165c91b2ef1a0dd83325221ab01
6d41da0acdd4595210dfc15695eea205968f01c49ea2710a7a1642d035568daba5cdc7c8338da956594a736023cae72adc7e23653b0bc410ed0a26ffc6425ac2
e2463f279721cff3cc869ac871f54fa93eb59357c9b355daaa0271fa50ac449565e96330bc4ee1eb35db014173f820462bac87a859a0a0e7f7d25763330b20bc
6076175c956dbc3616523f9e98613580e4c4a4372176997c566064c1eaf0ed9640f9d4deb561865336881b636cc54e3957336d5bf57a7ef560a47f484d7c8a21
3ba418595ddefa509e8b337061e8d15ef55fd245ad00113255c63f36c460514b422c2efe3cc9912b7a73d74a650f3da550fcae4e06998095b4a4b1e98d36a167
aac7f55b7d222579a4a6ae238165275a9e822ca4e23e228535dcf4155aeb5c2459a9f989b98ea681a8aa03f09889527aca47454e3c12a33f30d381e497873112
4ae7a4ecb205654d433ea28df49379b1fdc4b49591854ca2fee16616dc0e233f9c9d5ef27733f452eac117986822677a7dbd8168352eace10ed4e44dec2c379f
e4e38153efcd40fe67a969bd8cf2fc7d4528f3ce504c576e2e4659cc2b2fa72a9f8710eac885eaf19a3b2645db4545a7cd36c32212d27a050956fdd03c958514
e069e52a365eb3a4563b63146e2d599845764ef0f9e537663d770121c52ca4967d96d0dc9467f907821b47fdb27a95becf1f0d2e3cfd4c962536277b27730dbb
f16630f969098a9294516adb5a8f0b932d21859ea7f4de4138cae74a2b8bdda8fa2e9e168256546e73ba72685ca3a1a21d55aea33d4a2c2d5916543816a6d49e
16612c2f5b90ad32b79b7abbe62c40dee9c0691689e133d634dcace0d43b7c0046668a72e03fedd5265883daef999c99c9757dca8687e91e4a27af1593b806c7
98e399c851704ad7a30773dcc246d0e953e5f41b2dfbecacae045d56bd0b36aacc8e6602958b24d365ec133c24a740330d6a3d9296e97a4fc24b9ffd43d4a4c9
7c497aa425a4e7da655bb5f6b6a646e4c2fdead365fd3517dab1bf9d9b7c96001ebe1ce2b5024650a09910a8330de3d570a0635a95555ae3e37e6b4c5840adc0
3be2563978a5a5d49c29361c165653a1694771e4db0ebde9a682cacf27af13055010551afefbb3518c4e05942e1d7836c2b93df85a6746819ef26cb6865e5ea0
d45beac0d4968f91e0f221395d21dad2b079a42533c246701bd819ad0fed7acf4df983f0b26b4856a096ddcb8a8503536a451204409c0baa65b6b5976597b141
32c6a78ed512be15c6c3a6ce709a2a2df120f3b0ba8ba99dd8d6f552134dc712dc2ba40264bdbcb6f62c2daeaf37a16e186777f9d93ee7fcc2055bd79b492b9f
701451466f7ccac7da9aa4f0dcfe9cf75ba5c9fcbe7e0a2665a2fd3b0c8e72d0622737959bb2da3eaa4d75940557541616153b2b329f4951e4dbb3f6eaf380ed
9b7bb7e7ebbf9ebfdf47dc9ad0bcc27148378e5e225844a39aa68938ba21f9a5da7db4db5ddab5cca2d1d64c607acf59b2caac358a2d2e88d61714e951af3133
ba1a130c1a63cab23ba73c7db86c5af820b4caacf9baca6e99cdc90fcaf696d2d1374f4094cc3a370a6a051f50da16267b7e73d3fcbe74d79db4f5ddab5b565a
af3f4754ddde742d9b2c477a2893fd5efb7aef88be4dabd424364875345af6c20a6158ade03b0c9176b3f855cfb83ff47777fed9b831f4f559b2a1b9e81d55c9
e0514759198551a9d7e552c663ea5dc70ba16296ee51ec1854f213ba58ef1668f4e155f83a5816aca482d55575cf0bd4d157e696b34bda07e1c22e3764eda6bb
fe956a760156d3321c7e2b1a44998dc1aba08f300dc0baa916534312f5264956bca8959e0107ee55cb0851c84c406522dd42cbab8a89962ebc9ba6a53c96169f
5d9e36af144dc6affec3b8af9dde9e62fb6bb765e87a29a94363754ca63b655665d41654ff48599016c813a536495ab20ca9ee8d52ca03cc0f818981b2fc2b3e
b26b4af0f71c3754db24d4865a0b0104d4bbca8b98eb01da4d9595ca2ec88612ecd44294ee2a959f0652aba6635eeacce5f45d8855a5a194704430b8ddb08552
a95d5065837a195888f573195d5741561baebb8bab5da41ac5deaf3d2c2a8edce366da05824f8d47895154ed41d46d4a736f44f712e83f320aa42bc92857550c
3e96a9dc5be3e0e4fd23ba44f813ce773f2c26bd43cae26b2c9b8a4784c2575f0d4901fabab282baf5de5daa5ea55bbdb8373f16ce2a5a55d191cb41a0f81963
ab022c2723fb6e41a72aef06e1a23608a2365e3c60dfef69714d899bf4e1c6bcc81e2ec42133aa78add5586cf5d542ca9959a7ccac7d1fa76175d5d220d92652
7d5b755884a6d5a376bb68400250e5442d3e8b73d85d3d5761af76206c37a02853e8375381e02c5b4f9ec8995550638d7fb9dfa1d1d336522aa4c4e431adaba4
0abac276dcb2e5281d0ececfcfc76c36193813e01277502cb6aea0eb28415d3c75aef75b0dbe6c9d4fe02780e9920eb46917a47d3f4ea6be891730a2f372ba12
75f54740007cd4133c665bb5ea1b127f13a1adaba4bb69b091425135d77db835ff051f1bf01b13d3b22fb8b7f9e9fdbf4371cc0e7d5e8dacd62f97d42757658e
72cff4f88651ab51ab4edbe2a6829af7f83ec3821239ea022517a5360cb732fb05924e155a56fc4479961ca2827557cc04ab2e89128a657bca40dcc46a46d35d
caa9df83dba8d5d3d5d91ba9cdbb74152fa99cb4d0ca43f78926541704f7beaccaa65b236de825aa1499709b42227dda0cb69d2c2f3dabbb655123d88cc49a6a
b0fa26d063ec3ba43c50d61534a1022824d0a5616548a8220016516a541137a5a9494ecadfef667df8c4fcc0a2ebd824e28d932ff2f47a5a6075f2de096efaf8
3909ff17fa3caa24b107a56534e9658a67bad52a5e72993c2145a5a3a7ed9db47ae6c494459e50ffe7e565263894262da0dcaa2553b481a6dba2f32bd23d5dc1
656c585fd5a88344958321fad75e1c95fa616fb9fb8ddebf4f37101f79466114d278a257750f5d099e5595585ba579851a7b4eaa09df7dab564c1062f398d4de
__label__
d5dd5d5d5dd5d55dd5d55d55ddd5d666dddd555555d5d5d5d5d5555d5dddddddddddddd5d5d5d5d5dd5d5d5dd5d5d5dd55d5d5dd5d5d5555555dddd5ddd5dd5d
d5dd5d5d5d5d5d5dd5d55d5d5d55dd5d55d5d55d5d55d5dd55d5dd5d5d5ddddddddddddddddd5dd5dd5ddd5dd5d5d5d5d5d5d5d5d5d5d5d5d5dd5dd5d55d5d5d
d5d5dd5d5d5d5d5dd5d55d5d5d55d55d55d5dd5d5d55d5d5dd55dd5d5d5d5d5d5d5d5d5dd5dd5d5ddd5dd5d5ddd5d5d5d5d5d5d5d5d5d5d5dd5d5dd5dd5dd5dd
d5d5d5dd5d5dd5d5d5d55d555555555d5d55d5d5dd55d5dd5d55d5dd5d5d5d5d5d5ddd5d5d5d5dd5dd5dd5dddd5dd5d5d5d5d5d5d5d5d5dd55d5d5d5dd5dd5dd
d5d5d5d5dd5dd5dd55dd55d5d55d5d5d5d55d5d5d55d55dd5d55d5d5dd55dd5d5d5d5d5d5d5d5dd5dddd5d5d5d5dd5d5d5d5d5d5d5d5d5dd5d5dd5dd5dd5d5dd
5d5d55d5d5d5d5d5d5dd5d55d5555d5d55d5ddd5dd55d5dd5d5dd5d5d5dd5d5d5d5d5d5dd5d5d5d5dd5d5d5d5d5d5d5d5d5d5d5d5d5dd5dd5d5dd5dd5dd5dd5d
5d5d5dd5d5d5d5d5d5dd55d5d5d5d5dd5dd5d5d5dd5d5d5d5d5d5dd5d5d5d5dd5d5d5d5dddd5ddd5dd5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d55dd5dd5d55d5d
5d5d50000000000000000000dd5dd5dd5dd5d5dd5d5d5d5000000000000005d5dddd5d5dddd5ddd5dd5d5d5d5d5d50000d5d5d5d5d5d5d5dddd5dd5dd5dd5d5d
5d5d50777777777777007770dd5d55dd5dd5dd5d5d5d5d5077770070077705dd5d5d5d5dddd5ddd5dd5d5d5d5ddd50770d5d5d5d5d5d5d5d5d5dd5d5dddd5d5d
5d5d50777777777777007770ddddd5dd5dd5dd5dd5d5d0007777007007770d55dd5ddddd5d55d5d5dd5d5d5d5d5d50770d5d5d5d5d5d5d5ddd5dd5dd5d5d5d5d
5d5d50770007770007007770dd5dd5dd5dd5dd5dd5d5d0777777777007770d55dd5dd5dd5d5dd5d5dd5d5d5d5d5d50770d5d5d5d5d5d5d5d5d5d55dd5d5d5d5d
5d5d50770d07770d07007770dd5dd5dd5dd5dd5dd5d5d0777777777007770dd5d55dd5d55d55ddd5dd5d5d5d5d5d50770d5d5d5d5d5d5d5d5d5d55dd5d5d5d5d
5d5d50770d07770d07007770dd5dd5dd5dd5dd5dd5d500777777777007770dd5d55dd5dd5dd5ddd5dd5d5d5d5ddd50770d5d5d5d5d5d5d5d5d5dd5dd5d5d5d5d
5d5d50000d07770d00007770dd5d5d55dd5dd5d5d5d5077700000070077705d5555dd5dd5dd5d5dd5d5d5d5d5d5d50770d5d5d5d5d5d5d5d5dd5d5dd5d5d5d5d
5d5d5555550777055dd07770d5dd5dd5dddd5dd5d5d5077705d5d07007770d5d5d5dd5dd5dd5d5d5d5dd5d5d5d5d50770d5d5d5d5d5d5d5d5d5dd5dd5d5d5d5d
155d5d5d5d07770546d07770d5d5d5d5d5dd5d5d5dd5077705d5d00007770d5d5d6dd5ddddd5dd5dd5dd5dd5d5dd50770d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d
50155d5d5d07770546d07770d5d5d5d5d5d5dd5d5d55077705d5d5d5077705d5dd5d5ddd5dd5dd5dd5dd5d5dd5d5d0770d5d5d5d5d5d5d5d5d5d5d5d5d5d5d5d
ddd51155dd07770546d077700005d5d0000005dd5d5d077705d5d5d507770000dd500000000500000000000000d5d07700005d5d0000000d5d5000000d5d5d5d
d6ddd5115d07770546d077777705d5d0777705d5dd5d07770dd5d5d507777770d5d07777770d07777770077770d5d07777705d5d0777770d5d5077770d5d5d5d
d6dddd5555077705564077777700d000777700d5d5d5077705d5d5d50777777005d0777777000777777007777000d077777000500777770050007777000d5d5d
ddd6dddd5507770456d077770070d077700070d5d5d5077705d5d5d50777700705d0000007770777770777770770d077770770507770007050777770770d5d5d
ddd6dddd550777055d5077770070d07770d070d5d5d5077705d5d5d50777700705d5dd5d07770777770777770770d077770770d07770507050777770770d5d5d
66d6ddd6dd0777045640777700700077700070d5d5d5077705d5d0000777700700d000000777077777077777077000777707700077700070d0777770770d5d5d
66d6ddd6dd0777045640777000777077777770d5d5d5077705d5d0700777000770d077777777077700077700077700770000070077777770d0777000770d5d5d
66d6ddd6d60777045640777050777077777770d5d5d50777000000700777050770007777777707770d077705077700770500070077777770d07770d0770d5d55
d6d6ddd6d60777045d407770d07770777000005555550077777777700777050770077700077707770507770d077700770d07770077700000d07770d0000d5d55
6666ddddd60777045d4077705077707770555555555550777777777007770507700777050777077705077705077700770d0777007770d5d5d077705d5d5d5d55
66d6d6d6d6077705ddd07770d077707770000000d5d5d07777777770077705077007770007770777050777050777007700077700777000000077705d5d5d5d55
d666d6d6d60777045dd0777050777000777777705555500077770070077705077007777777770777050777050777007777777000077777777077705d55555555
66d666d6d60777045dd077701077705077777770555555d07777007007770507700777777777077705077705077700777777705d077777777077705d55555555
666666d6d60000045dd00000107000500000000055555550000000000000050700000000007700000500000d0770000000000055000000000000005555555555
666666d6d6d6d6d45d4ddddd50700555d5555555555555555555555d55d555070555555550770555d5d5d55d0770d5d55d55555555d55d555555555555555555
6666d6d6d6d6d6d45d4dddd000705051555555555555555555555555555500070555dd5d50770555555555500770555555555555555555555d55555555555555
666666d6d6d6d6d45d4dddd07700550555d55555555555555555555555550770055555555000055555555550700055555555555d555555555d55555d55555555
6666d6d6d6d6d6d454ddddd0770dddd5055555555555555555555555555507705555555555555555555555507055555555555555555555555555555555555555
666666d66d6d6dd5d5ddddd0000d5ddd555555555555555555555555555500005555555555555555555555500055555555555555555555555555555555555555
666666d66d6d6dd5d5dd6ddddddd5ddd55555555555555555555555555555555555555555555555555555d555555555555555555555555555555555555555555
666666d66d6d6dd5d5dddddddddd0000000000000005555555555555555555555555555555555555555555555555555555555555555555555555555555555555
6d6666666d6d6dd5d5d6dddddddd0777777777707705555555555555555555555555555555555555555d55555555555555555555555555555555555555555555
666666666d666d6514d6ddddd00007777777777077055555555555555555555555555555555555555000005500000555555555555555555555555555555555d5
6666d666666d6dd5d5dd6dddd07777770000777777055555555555555555555555555555555555555077705507770555555555555555555555555555555555d5
6666d66d66d6d6d454dd6d6dd07777770d507777770155555555555555555555555555555d55555dd07770ff077705555555555555555555555555555555d551
6d666d6d66d66d645455555dd07777770dd07777770555051555555555555555555d5dd5dd5dd5d5d077700f0777000d55d55555555555555555555555555555
6666d66d66d66d6454555555d07777000dd0000777055505155555555555555555dd5dd5dd5dd5d5d00777070007770d5d5d5d5d5d5d55555555555555555555
d666666d66d66d64545650500077770dddddd507770505055555555555555d55d5d5d5d55d5d5d5d5f0777077707770d5d5d555d5d5d5d5d55555555555555d5
666666666d66d664545555507777700ddddddd0077051015555555555505050500105055555555555507770d5d07770515051555555d5d5d5d55555d5555d5d5
6d6666d66d66d66454555050777770ddddddddd077051505010000015555555ddddddddddddddddddd07770ddd07770dddd5555555050505555555555555dddd
666666666d66d6d555555550777770ddddddddd077055555555555ddd5dddddddddddddddddddddddd0777000d077700dd5ddddddddddddd5511111155d5dddd
666666d66d66d6d555555550777770d5ddddddd0000555555555ddd5dddddddddddddddddddddddddd0777770d077770ddddddddddddddd5d5d5dd5d5dd5dd5d
d66d66d66d66d6d5555555507777700555ddddddd5d55555555555dddddddddddddddddddddddddddd0777770d077770ddddddddddddddddddd55555dddddddd
666666666d66d6d5504555500077770dd555ddddddd5d55555555555dddddddddddddddddddddddddd0007770d007770dddddddddddddddd5d505155555ddddd
6666dd6d6d66651511555555507777005d5d5ddddddddd5555555dddddddddddddddddddddddddd6dddd07770dd07770ddddddddddddddddddd05555dddddddd
d666666d66d6551001555555507777000055555ddd5d5d5d5dd5dd5ddddddddddddddddddddddddddddd07770dd07770dddddddddddddddd5d505155555ddddd
666d666666d551010455515450777777700555555dddddddd5d5ddddddddddddddddddddddddddd6dddd07770dd07770ddddddddddddddddddd05555dddddddd
6666666666551000055555555077777770000000055d4d5d00000000d00000000000ddddd0000000dddd07770dd07770dd0000000000ddddddd05555dddddddd
66666666651000000555555550000777777777705555555d07777770d077700777701110107777700515077700507770dd0777777770dddddddddd5ddddddddd
6666666d5500000005555555555d077777777770015055d507777770d077700777700051507777701515077700007770550777777770dd5ddddddddddddddd51
66d666651000000005555555555d07777777777000010000077777700077700777700000007777700000077700007770d007777777700dddddddddddddddd020
6666d6551001500005555555555d0000000777777705d077777077777000777777770107777707777705077705507770d077770007770ddddddddddddddd4000
66d66650000155000155555552dddd66660777777701d0777770777770d0777777770d0777770777770d07770d507770d077770d07770ddddddddddddddd4502
66d66d50000155000155555552dddd76660007777701d0777000000770d0777700070d0777000007770d07770d507770d077700d00070dddddddddddddddd500
66666650000155200155555552dddd76666607777701d07770dddd0770d077770d070d07770ddd07770d07770d507770d077706dd6070ddddddddddddddd4502
66666650000155500155555552dddd77777707777700007770dddd0770d077770d070007770ddd07770007770dd07770d07770000d070ddddddddddddddd5505
666d6650000155020442445555555d77777700077770077770dddd00006077700d000077770ddd07777007770dd07770d00777770d000dddddddd6dddddd5505
666666551200500205555550000ddd77777776077770077770ddddddddd0777025155077770555077770077705507770dd0777770000dd6ddd6ddddddddd5505
6d6dd6d00205555001555550770ddd77777776077770077770ddddddddd0777051555077770555077770077705507770dd0000777770ddddddddd6dddd5d5552
6d66d6502005555555555550770ddd77777776077770077770ddddddddd0777051555077770555077770077705507770dddd607777706d6dd6d6ddddddd64520
6d66d65020055550255555507700d666676700077770077770dddd0000d0777051515077770555077770077705507770d000607777700d6dd6d6d6d6dddd5450
6d66d65020255550255555507770d667676707777700007770dddd0770d07770515550077705d5077700077705507770d070600007770dddd6ddd6dddddd5502
d6d6d6d020255550255454507770000767700777770d50777000000770d0777055055507770000077705077705507770d07000d007770d655555555ddddd5504
6666665202005550255454507777770767707777770d50777770777770d0777055055507777707777705077705507770d07770d077770dd05555d00ddddd5504
d6d6d6d025055555555454507777770767707777770d50777770777770d0777051555507777707777701077705507770d07770d077770d501515101dddddd505
d6d6d6d020055550255555507777770000007777770d50777770777770007770055555077777077777000777000077700077700077770dd51000005dddddd505
6666665020255550255454507707777777777770000d10000777777000777777055555000077777000077777700777770007777777700d55555005d6ddddd122
d66d662020255552055555507707777777777770d6dd500d07777770d0777777055555555077777055077777700777770d07777777706d5d05500dddddddd222
d6666d5020255552045555500000000000000000d6d3500d00000000d0000000000000000000000055000000000000000d00000000006d5d055005ddddddd222
d666d650202555520555555552dddd777777766666d3500ddddd6dddd6d6d1000000000000000155555105020000000d6d6d6d6d6d6d6dd60551010455566204
d6d6d6d020204d520555555552dddd7777767666d6dd500dddddd6d6d6d6d10000000000000101010111100000000015dd6d6d6d6d6d6dd605510105dddd5504
d6d6d6d0200111550445455552dddd7777767666d63d100dddddddddd6d6ddddddddddddddddd6d6dd6ddddddddddddd6d6d6d6d6d6d6d6dd55105ddddddd222
666d6620202555520455555552ddddf666666666663dd05dddddd6d6d6d6d6d6d66d6666d66666666d666d66d66d6d666d6d6d6d6d6d6d6d155005ddddddd222
666d6d5005555d520555555552dddd7d7777777d663dddddddddddd6d6d6d6d6d66d6d66d66d6d666d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d155005ddddd66454
666d6d50020444420555555552dddd7d7777776666dddddd6dddddd6d6d6d6d6d66d6666d66d66d66d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d155005ddddd66204
66d6d6d0020024550445455552dddd7d7777776666ddd5dd6dddd6ddd6d6d6d6d6666666666666d66d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d155005ddddd66204
d6d6d610020064500555555552dddd7d777777666dd35ddd6dd6ddddd6d6d6d666666666666d66d66d6d6d6d6d6d6d6d6d6d6d6d6d6d6d6d155005dddd6d6d55
d6d6d610020064520555555552dddd77777676666dd3ddd6ddddddd6d6d6d666600000666000000000000000006d6000006d6d0000000000000000555d6d6555
d6d6d610020064520555555554dddd7d777777666dd35dd6dd6dd6d6d6d6dd6d60777066607770777007700770d66077706d6007707770777077705dddddd504
d6d6d610020064520455555552dddd77777676666dd3d5d6dd6dd6d6d6d6d6d660707066607070070070007070000070706d607000707077707000dddd6d6224
d6d6d610020064020555555552ddd667667676666dd3d5d6dd6dd6d6d6d6d6d6607770dd607770070070d07070777077706d607000777070707705d6dd6dd514
d6d6d6100200d5020555555552ddd667667677666dd35dd6d6d6d6d6d6d6d66d60707045d07000070070007070000070706d6070707070707070005ddd6d6224
d6d6d610020064500455555552dddd77777676667dd5d5d51156d6d6d6d6d66d60707045d07060777007707700d66077706d6077707070707077705ddd6d6204
d6d6d6100200d5500555555504dddd77777676666dd3d51055051dd6d6d66666600000155000d0000000000006d66000006d600000000000000000dddd6d6204
dd6d6dd11200d5500555504504dddd77777676667dd5d5dd5d5d5dd6d6d66666666664115556d6d65151151666d66d66d666d6d6dd6d6dd1111101dddd6d6204
dd6d6d500200d5500555554502ddd667677776667dd5d5dd5d5d55d6d00000000066450515000000000000566000000000000000000000000000005505555204
dd6d6d500200d550055055550455d6666666d66d6dd3d5ddddddddd6d077707070d6d1511007707770777056607070077007707770707077707770d000505204
dd6d6d500000d5500555554502ddd6676d66666d6dddd3dd6ddddd6d6070707070d55045507000707077701dd07070707070007000707070707070d000504025
dd6ddd4000015555050505520444d66dd5555dddddd3dd1d6d6d156d6077007770654505507770777070705dd077707070701077007070777077001500202012
6dddd55000010510050555520453d655100005555ddddd5dd5dd5ddd6070700070d1050200007070707070204070707070700070007770707070705110104004
6d6dd550100001510512504504ddd610055555555dd5d551010006d660777077706000000077007070707000d070707700077077700700707070705110104002
6ddd6d50000105100505504504ddd61dddddd6d5d3d5dddddddd06d660000000006000002000000000000000500000000100000000000000000000d000020404
dddddd40000004100555504504ddddd6d6d6d6d5d3ddddd1dd5d55d6d666666d6d60000020002025555200005d50101014555000d6d6d6d11100002000020202
6dddd5500001051005025020224ddd66d6d6d6d6ddd5dd5550000000000000d66000500000000000000000d5500000000000000000d6d0000000000000150002
dd6ddd400000041005504040201dd66666d6d6d5d3ddd3d15077700770777066607050707077007070777055507700777077707770d6d077707770d000020020
6dddd55000010410050250202245dd66d6d6d6ddddddd3d150700070707070666070507070707070707770d5507070707070707000d6d0007000700000140020
6d6dddd000010410050202020055d6666666666d3dddddd110770070707700d66070507070707070707070d550707077707700770dd6d6077000700000d00000
6dddd5500001041005020202020526d6666666d55555555550700070707070d660700070707070707070706dd070707070707070006d60007000700000101001
6d6dddd000010555050505050504d6d6d6d661111dd5d55100704077007070666077700770777007707070d5d077707070707077706dd0777000700000100001
6ddd6d500001051005000101000546d666d66dd55d6dc11000004000000000011000000000000000000000501000000000000000001000000010000000105000
dd6dddd00001055505000000400246d666d66dd55cddd55100005000000015000000202020204000150501000045515111155550500000515550000000100001
6ddd66500001055505000200500026d666d66dd55d63d3d00000500000001502020000102020400010402050002025100500010050000051555d100000000000
dd6ddd500000020202020202000015d6d6d6d6d0dddcd5510002400000001502020020202025500550404020104101155555555550001005555d000000d00000
6dddd5500001041501000202002005ddddd66520ddddd55000022000000015000000000050000000002020202040001555555555550000000000000000200000
dd6ddd500000041505002001000015d6d6d51155ddddddd110022000000015002020202040000000002000000004d45545455555500000000000000000000000
ddddd5500001041501020202000015d6d6d544444111110000455420002050002020202020204000000002000002020202020000000000000000000000000000
dd6ddd40000004100102020200200006450000015555c10000004002442040202040020202002000020202002020000000000000005111010100000000000000
6dddddd00001055505050502001000500000001502011002020520020555555555502202020202020202020202020202002001005155d1110101000000000000
6dddddd00000150505050502001000500002050505055002050404020254425555504504d4140404040404040404040400000000515551511111111111100000
6dddd55000515555020202020020000202001000000002020202020204554545555552540404040404042404042404020200000005ddddd3d155555100200200
dd6ddd40005155550020020000055002000000000000055502020202025244545254045454240404042404042404020202000000515555515151110020020000
ddddddd0005155500120200000015550205100000000000555555555555455454555545454240404042404240420510202020000055555500020020000000202
ddddd65000010550d0000020010001d12d5015555000110510000000000000000000000004042000000020500000000002020000000000000000000000000002
ddd6ddd0015500015100002000005155555d00100050000000050777077707770077007704540077777004200777007700220077077707770777077700000020
d6d6d6511051110101000200405555ddddd555001001011111000707070707000700070004540770707704250070070705500700007007070707007000202025
d6d66d50000155000502020020202dddd6ddd0050505010000010777077007700777077704540777077704254070070700400777007007770770007000202040
ddd5d550000002020202020020055555550500200102000500550700070707000007000704440770707704254070070700450007007007070707007002052040
d6dddd50000001000001010020055555505000000101011555550702070707770770077004440077777004554070077005250770007007070707007002042550
d6dddd50000002000002020050002000000001010101111515150005000000000000000044444000000004444000000045450000500000000000000054042550
66d51000000015001100020000000000001100000100000501515154204244544444444444444444444444444445454545454555555552442040202444444040
5d010000000002002000020200120000000001555555511000055555504244544444444444444444444444444445454545454555554545402150244444444442
__gff__
6d12ab5f697c253943ff5b2b411071c59d21ecce61a57d7b4df13d5bf36d70b0c9632022ef59568d06ffeecd61fa18c6a99801ac7c870633d419e8c86015bfd6938061c84f04a0ab51adf62c69a92ae94a092b4c11fe0afd959e9c08c8fb06a86ce06e67b00ab19c009f65371868563a66205698715fa0ab01eb0aa37ebf99aa
89f1b97e7703b22ab96f0e5358d950ca3f7d8359519454267fb523ac6a5d9e7be4cce6a61f87c966af5a0d2d5685aa93b12a9596dde93efd92610534523d22d71e0649dc5cd3acd0b8460056ea3df581df8da9a7b5a0f2a85059c80a60700bacdb9c9255d7af3698953c7f87abceecdc4d37386e7fe8930d36c00a1ff3095d05
__map__
2a2b8a9adf8097a764724a267124e30ea6432b1d2f983e0aab0a5845beefd5904313ab42616b680f4f791b946208b1a2e1cf918814c22a147852df3a9c14957077159d905c8e5ea072b2e20988c42bf7dd52d9bf3aab844342fa42fea3c7b00a7412050a0172de3d4525928af41fabd0ae548e551e955e7962a21ad26f50e956
ca55c899f404070071685dcdb3c1545708eb7add28eb1907766aa671d916b5d742a16bcd9a2a63835eb3db24522a70afa3ab329b20b90fea73855875cb1562d64b63ac385b88a572cb19f2cddc1ca09d9add0c2b038158f5bb958ac3253e442a55442c4e218daf5256f6882eba8299f9b2202265358f94feaa8b6bbad7c9d017
e926fd72b3e17005e93aac48fb35b2c1b243d7b657214cddb25326af65a22c93c1f07a016f0ea4f4b558a5ac66de641b94e84a373c0db08a888558c57a3ad3d655da782a85cb224dccf7d321a2d897e98905572fe089396ba421d40dc9049232690a77d529dadb35587179b25a2ef46a4d1218b12a94cbe55a37af2b09140235
9756dae2b9ba0aca5d651b545273342b728b7d6255aba6acec3982bc0d32ae4dbfe1f79bf1ed9e126501d6bc75c3d9b1836e6682de8ae3ca689cb8d83e0895aab9fed559d52a348410a3827fb3e9352993e9951d9f9c621abd67c22256d1dc1e5900675005148a5494b20c4a587599159ec689a2688f8ecabab2a6eaf236c821
bf5fa6d1ae1fdf2e763d5faf79bb643149d04d85b7562e3acb67a22b178e15aabb1e2b1e6ee1b16ef628532157df77c8485256265630f78b78ecdb4d8b0ca958af6fd0b772a55d75305255941e08535614ad77690481b72ad8ac868bc6419155cda1b4a81fc5a4fe80d7a337172f8b9d663504aae5bb86151b60e057afc1caef
15c869607e8098610caff971adccbe5d5268132b60653ef61ec361f423d78bb8c551942be9e57445d9510149b5a3ec3a48f29ae3783e0e5ca0e4aa3ca5ab45f115067a645b60a530f8e0b3798379be7191ae4ac562637568587190ea79fef55851d8d6632bacf47de74eadd0a5ebdeeb9ac942232c7cfb1a8d417df218529ce0
728eebf6dd7e934b76192dfd5dd9a9f0a2ca5a45e9fa9a66552056bd2a8d83050c82354c51f428549af557f9717093aee10a1df7a7aae93b3406f95e105db6f626d08b083d75b3512cae6a56a166f58bdfea35af6183340e56d806a180aed3238be903566212681e0085551fb78b75bbe565405a01ab62a9e87411c2fa7a2630
300bb2a8d15ed8fd1a56265f215601d3e13ca78ae0ae77a75ca8c469fa91e9ca421562ae8c8faa822ddc67e4a7f60795d6ba344251a3a8a76b4f75f37b827ab7eee458e9e4a8774d5d157882ae425e5d82514ad11c5fd6761b563a5f45dda6e7930d919ceb38381ab9b772254b6c4c686a56ea122b279d10906392bfea757b95
82144759589a950d275792a1ef82b2b05af6d5302065757b66880b70b58850956c9a27d49c29b90565ea2d353765e5ebe7c35e8b15f204f4b740a3129d3585ed059722793f2df9e5d6d3221b7ac383e1359b4d174688bed3b956ad8ee9b70715c3aa924e080c851559bb4ffaac517022b0aa8d9af15739567959555256cf83be
f32828c4915130691859000d1585c22cab3ac44f57d56685720e1dfdbaac387d45025a2d93b29d262e74626005995214a65fbe93ae9de0670405fdfeedea1b7eca2a234bac627663fe2c2b9719d6ba05f99f9260f15717d820792b3ae126dc241e7dbee93cbaf5c81c14397fcfcc0a21488c9555b0541e58160bac2bd965bfcf
15211ac8aec5aa065d112c1a8e68d4aa34831e12449fbb6a3c500aa2f6462d7efc4eb8bd2dd37838f7edf076cd62954dc907b2a419e5802956ddae1b459d9f3d7bf62cf23c29324505edaf16ea6a13ee1cac367eaadec18377debc9db1eaa67e0263d16b0e7f97562cbd7231b5c12956c366e31aac0a4872000b43215d388a39
ee047e2f4961d92141ed8d4011ab4f4379aad9fb43a236506fa8470b58e1114c7190b19263d21052d337153b0569e401e6b1b242d18059f9c26a975e79f376da31c72cd5cb58d9ebbb3c8cc8584191b1bac94feeafc567d71807c5067d595640815581e296de9de64d8b956dfb6ff4c06a603ee07530c453a886df518f2d5669
a71d294906e58a358149675feb0a24984d4deca68698f8025649c8ba5ac12e85d54ef2c862f530b00f7c4b58a55648ba628fe62fbb99ae18d63559c938889c8c9c16067f3c35aa64ebca6ab5da6da5de095356f4dfce60f8f8b1dfcbde932ee976388ba8fa655b57c48b875b6255ae21cda14b8ef2065df5d958d4eae890583d
f4595731b30a1f7dc3626585efb1b05299cb6256a87311ab50b3829f2177f58ba67fe5827b20e3a02f66483fc448fd2997d0cbefed4697ea8d9acab11a322bf5f8766daeae7adca37237cfea356185aa550f414895a3aceabc71305b9dc8acca451a0757c06ac76235ccd920d981e84a671e096782455c900a58f12ebd7e8f63
8660eb1aacc4063172f7e4c47a155217e53be11c6111ab1e7435c0274c65ba7a2f50735955387e2256153d316858c9823e129624ce1857b016646b661cb464156e168b0fb9eedcffa9b08a7f3330c272bad6421209e8743d76a8758538907dbbecce8be4535502d5ef5f1515b3aa66ac6a20877c77d6066599594f74151a1bc4
d318dfbb9d6715a4acaaec8e9895ac62c559132b298737759391be5a1edaa872ac90546f3ac5066c3063b51934a563ca49a70a696f641d8e5ebe6474b542f945c9f95a3d63d5277f426f4778780d1b247b430997cc8058f1bd8f08e7fc695dc934fb1b8f1eab0f5857362ba51e2fb041eebfae5f092cd215d749b78d60904b05
48d8a2144cc62a4b9d93cd3a81aa1bdf0e56c977eea4bae203e149b99495fb25cd4a96c625c48a7241646360c5bb5ceb93acea0dd76d5d8b55b5d2e5c9811ec7595c29a91690e384d3ac6083c89099959e3602abe16df5b83797150ba6e2544dad4f163e272acc5851dfcf72eb7bec3b25325d8516ab089f6cbe13aa24b8a305
4fac2c136cdeb458811658f5895566836b9cf693aafce2d5c7c15bccaac7aebdea17ba0d0c4d85f28caeb0d4628b58dd32aca674358f55c5af723250e89ac989a159d9916b6761364797adf3c9f9ab04acea0f5116052b7ce82dede756c3b6c16e8d13e218ab9cf5f2096605dfbe5ae6343f8daf8855899c1fcff35c9995d115
222ca74a613b62ac02798630af2bbe954958e56cf01d66f5587d470d675861b0ab39288fd9ac20af4d1cfab9c6b06db3ca2aee36aba1b06af85c1002ab5d62f59bc19da1e8aad02d5b1f9f15050edfd18de54b3e3e616badbc4cac9ce2eb2513336c6ee076e1bea75478f5c6ac24dfbf53457da14c89fa9da5255fe64d0cab21
56a5685d257956bb6075fbd62c2be5547bbe548f42ae1970d9335634fc3709cef673a1f5dbdbca5e533034ff4dc5a2940f96f2ac92c4f8f604c52c3d04e24bdf3137c177631ff90eaa4825a7e8975cb3bfa6a7aebd024b58f9355912dcf4bb286bac2cb115b36b31ac2a4e0fac02adab81c56af8816256d30146e6ebb4f303ab
406d0d83fedd10ba6256dba1b7967627c90aeeb3ba2ac35f31ab5058dd8a337f65e2ffb2146259c7d46bbf50a1b794969b1b6095c6a22fd49815ae06ea2ad59ee3d4ca14692fd5fba1bdd27688c239ebeab6d6d520f557bb83b73eb83d47573c5eb33284942c430bd76837cdfe76aaab6d2c52b03a94ae7a9865e5ccb072e438
6483292b1ff1886342068a7abbf4fbf272b3512207e576cf7e19ac2423a4a409df2f355857e130bd6d0dfe8a58c57956db5a57b7556d565743bd863c314b37e45f7f386c4256cc8a983d3f4ba7e8127397d570d6068799bfe24f26dc0993df6456e2afb25110494857e709ea56cf89691c7c7da9d92ca17ed58de652b822ab1e
d64c91a8e4462294ccc06a6543af77b7ed6998d39534e8ea19b19af5edd60ac6740d1a4416f8ca654ac28a68a9bb5687d21abb5598e01d30ab22cafcacab9d4c57499e956f2643a8bfaff9286591275f2656e5faea1763e5fb18a86a3d730b519722ea5e59cc62c89f956bee85c4c0f20654f67dc36a27e49821d1ac4c192430
ac42b3fe335d764f3faedddd7eb6cd949eb3ae24bc4a9998bb8d734b6ba1c740b3422c3a1456df495971c5a5c7e53ececc8dae5ef10b28fbad94faab60d5f8c2acbaddaac457554c50946530092d1bd4aca8a1c0cdacecf82af940cdd7557e01a344afc9dd7bf7cecfd853b1b0402bd04442bdc443ec30cf2ad9b458bdb3c30f
247fece8a1a3a06f1b432ccd75318b15c10a8b147adea430c1ddb8fa8cfc6cf39abc1019691452d82cf695cee77405568f531bbcf7e9f9a7036d83148c5afe2ad3558a2a5b4a979cdddb3d3fdb31360c543be9dab1ec26f6e15c568161750f9fa140038e0cb2861545be5d2eea59ac9c6a0cdfceac56dcd52f802a9c7a5c549c
c2923ece652536f8e9a79feeb28717567132e5db73937dd90a4d75ff1e8d06f894de7b181b3e95508a7ef1dbe5ca30346340386383320e96b11438d6bafa4d6574a58f98ddfd6be68d6eb10d864b25b741ac9ce5e61761b5a90f635a7a7b47a8ef54480c2b6e36ab5d8bd5078fe58d96aef21595f40735d1aceec9e76a84e124
51149a369b98a1311d48a66c90da37c18a7c347cfb194a41c4aa923e83293477f665b7ac092b4758ad102bf2f05fc45d5dd28caed29b1e2c1be4cfc50877b5bf7aaca664956395363aabb166f55c3eaf250ca308feaaa93c2f7233331c4eb30a28960cf438f8ce3bc22a1e9aeb2cf7a54cdfebceac86c4aabfd1bcb9ecff8a59
e984cb1cdbd2d5ee39392c9b151acb54dfcc318f15c1f2ce77df2756c973a3ab35450e77e87a1dcff3342b9655363a308294d5468e9514782c5d0deddbdd6f218467dfde2f51d6edfe5a7465b3dab1e2ab94550137e4562a17eb0a7ea7f3d9f979085d51ccf0fcf919458a6a8bb034bd8eeb195d2562fe292bb44da7f4b05fb6
59258fe37485a5194173a44457891e073188fdea58e9a06101ab4ff101d7e464891565cf3d0a076b6fbe76a1ae281ff314178e26f42fc2925357b7d8f5b18444e945b849c8f73b5ba961f20da7f866df91fad519b3528f8dae420938a69fa140ac10b70f8764832eebeaa7db339dfaa5c19ad295b25889bfdaa16fdf275d2966
f55058e9a1686677557e7c6e9d278bba95ae53dea07c18ab9e2b58505ca85024dc4d1f05204ffd486c560f6fa29282b909fe6c721e7ccda373c2d032c3f44ef732a5fc0aaca0abc6178c192e6335340330bec6a1b258ed5aac3e50dfb1580553f19569af949d5ea1dcedf29a95e2c686d49c28daae53345cae742b05b0d24fa2
e26b34cbaac7f1d53b8695469ade4590f7f00af8a92745d464969bbf1656f4f75be4b84530d3ac42b07aec57aa7ef561396335c75d6d16505f6b36bbe4a48bce7443145979682217b9e5d7b2c1579895f657bb162b2bc73623831196eaf59c47b041b2720ab1567e95be5de2f610ab758361a017c0cc65a50afc84ea8ac56a16
d6a6f14e9ec7b337f270445df8c56aa542f5cd24839567055d95488c1b6483e14e8e15bf876498b11aa6ac0a6055745734ab5f99bf4ac461f107432955f67c0e336d56f8043266751b4fa3283c2aab74adda45ac661ad22c3a1fb7f9a6f15708c62d568a755586e16e8015f9f61d7208496274b5d68c9bfa4e024b57e813b35a
__sfx__
4e9eea573132d0936a2e2303b0571c062037573826a302792b31b0b572394272727c0b62e37231293541962f17551256792a4442914c0b1191c327016022837a345481542034254323742c5242e27b0050d2851a
7c368653023583f04d0c4072e3392455f0a13e2845b386031a112321583826a37732282132434531313203220e76c293192c23b196212d34b0f35b2a1352b4231a47f18145346681c3452055e2a146185072f010
1bd14b962e44f0511d1525e173292f2711f31a0c6783362e24446166671420c302100471e0e4393122e1570c3d24535116054652d1623f3151952238070195653f2452a7393b25f26363083502b0380d7690251d
921b84bb2e20d1e4032b26d2d155383261c11615371256001503a0b0651d452142050904e1b36a3843c3141910308056423f11615732165783745c0476a2622d2d4211f319377761604226045212342016b02431
a1f1e15b1a516161701b30e0656b3e75423529381450d42e3546732007022113b13a1e261235081e4741413c337451127a2a64228218302503043c0047d2f422351670820f2b04700149137641d453191302c10b
de54710c3d3613a07a3302a0165b117211850f3804f0d017096040d5633e6652843134566016701d5773d7273a31e215221c61c0b14c0035c2175b160393127406079347390074228712321321614b3606b2a722
7ac9203e1f2280565f1865d29456171730b35834529235213311e3b6430c4710560e0735e3b57e281351b6462a73d1d6313c6112b27e1b2341615f317312120b1235b2a7132b6792222a182223e42e3177814756
fef04c581b33a1e575195002b256056352a71b3f2193b20008625176323810726575241791e54c3d2442b2280942f1223a1c7281440e3e726154603937f0f3582c2413e12b0062d3427a1862d266310422a2b202
2b736bb60d0331b2673b04b2474c1502d1b067143612c33a19528065351a6291672d0d11f2d36a395630f11f3870135705121590a528066383a03902637315122751b06035095200b5370135a3426e337081d407
6921a1661722b047172537511013263302e64803632313031105d2927b13109220733c478042160262c3a2151336a08340374101830e107731b07e307303d5171c37d0262b397432f330365251931b221450d42e
6134c44e350251a625012690e3381a0172c254172481701e301490e6343c75f386600352f3c06d1b06e0b45a2a41b22055252552d20c057601f55721756332190441a014351e34a3754c0646d3e51d3330b2e034
42f5b80723050015481552d0767a1f65c0a447107571555f14701373661111a0d62c02152383093f4113d5360737c1d65f3543009337154780604a3631d07224096762736e371792e2560e75e0d05e2721e39024
1fbc46e72760b2506a22421217073b22c2a250165282e22c222060517018433017391d62a3a47d1f0362e3423f2383c23d3814e0670e2034f2456917519195423932e1e0191646e132453530b2833d1853e3c035
f634a72e1d17c185200f24e3c33b364012264f3306a1a6152155b291232673a3a25005535037421d5291755e353342c06a106280632d211713050e0820c0a7111d52f04535151770e2142927d383550d4370a50e
5f2439563737b3837b3e1221d72508522241760d0171255c187181f44a0d164151341151d2f15c03302225791f64125766367160a6492b521321450f4313325b1510c1a546366321a4132946d065713e6041f16b
18721123105702a6723932207640122263215b0a1151b0643d72116575370160e02d2f57b1745a2a05e205700d45a202642e51818521302312426d25244026661b0780c742300523e6390f4193d37b3e6300d573
754dc40c1f532106043124b1a30c2622e0620d334252b476347630550403473057710d71c2704d381260c665325291530a3f30f31721185430e73b2f55f3765a38362341643c7243f2053645a3e10d2327433762
089a5929325371d4610b206350511c4130850905636095602b4630e0502b2121f346182203a7402f5650d358346350630a3234c2b00e3972418145042530340b2a2430b127094580c45a0421e3520c0a5142244f
fdfa52772d27a1230b0775e3343528464226792e3542807c0a03f236230f71e2751c32374201281116e1575b3d27a3f55a175572d312165040177a1a4783d7511565d3761e1b76b2014f0644f1d154021602b478
174458702522c31042312163d40916352352180f572350510f2380356b181381740a0d54e0a7723045a0847e28606192472120d301750f2020b634385122f4090f63d0a46b1a165337573834d3402f092450174a
1df5461c303230e66a3834b3d23203035337712537c09722053283e14e254541b1453f00e345120f3553d45a022791f7343553d0b3710d13a3a3523230e0f44c1143f0a76f07617235052d6522b1252b2252352f
f4cabd2a343101505f194521807923739317711852d393352015f3f658300112822417163234092567d0351a2b2123121c2d4191b0470773b2a15e3d6330a02620174057523c56e2b521147723027f1177a1c742
dd607f052f031174512c314171600b5592146e2a5492052f0970c0a76e0a44d1207029171343271727f2c6281b22c2a0070b27b3c0040747c1161521422077652412c3c53a3716a1762f3271c0a30b2b16d2f01d
ac2235f6316401e3482345f0d0783a27625316002142563a2e55a1b7762867e0404712756386501411c0a4422c5181950d1970928242250223e177216423a21d132132465a34744373452e61a35524217153127e
ddbeb06a360731057819629133470d7091012d29614364601f4102c57a0b2050440d0905f2f43d1047b2513510431256540b3402846133253083550d4640e13f2e41b323281544e275580246c2112a1f66e1304f
ccb8873c3271814516250720b23f171041d60e1b46d1513d1510b047372e33a3e5472970a0914033446150691e76e18246054633c0202114b3300c0d270345470c136131161656d1e652257160e4080035a3b34c
814f71d42326939752147410c45a0645e2a5143d0770c302042011c1333e20d2f65a3525016631313173154b066271d772127250145710407113311d7601a32b1b54a0d51b1a0112b2430c63801148223250050f
1abd7b2c1022435238270212a47b1713e1a1641c4090232104711317383453c2a4401e4200d164252122f24b151222761c0334d325100a442357431846c2b3582e2352575d0a246296762b20e3b054215011011f
5564037d3824016654234571f10b01221263700a6510f2113d4721364e2a40b067043964029278276003f51f2125f002452d256161271e32a0f7221c31b1e304183370b73c234002a56b17341145632d34519204
4d85e2b82f553367423e07323524093661422c3417f1f3510a4521267c161112b7472216d1726c2b6203847d096431c42c2c0531f33d1c24a2f3702b117156251c5173b709177143c60c1140d0654e264093a574
908b96813f7402824a3d538121022c4510a176013153a27b115351343304309036762e21729061257493e1690832633116397522b1612c41b3f2172205f0d3500974f1120b2a10b0960c2b7432c0720717921035
48ac12ab02267291692263f344540535b23145196341974d2c24c223382b22f2f67a1e55d025630f7782247728720286603361032750021582c30914522090700c5382e403164453434c296191b74d3c61e05142
b66ec4cf2516c273390a5213572f2076b294771514a16022115250f6382406a00424260630131a0717d163260e7601447a0450a25465391480d36b0c66e2f2621d509255032b20b1630c3373b2a259154591f603
6a3754110142f0d5363a64f2b24a2776b1760e2b709185531b42c1a3602b2412c2380c35e2e3012c25931651072213d2700935c28048222272a67d073681457b0f740001292033c17045011172b33f2d42d0b40c
be8975d3226440e44e382380650b2c4613c63c175601725a0e7393321c375032f52218161397611601f30445110021464a384641347b3354d0f6742b6441773b201273542c0a1271514e176503c03e0774410365
ead623443572d255340050b2b21718422277771606127131160713a50c351590c3202d035097333e1541c2590475625406165083f5383202821144162313b16e0775c3d0632e12122318252141514a242061b755
565da7bb227181d70c1062c075363825227170355053477e1b13d0f36a1c67215050153582f27b3e34f030261f7022625c3552a0a14d1034a0b546035453e015392522b3630b44a2e238191272245a2902a3e520
60c535bd0651a3d73d3c77f352000855a0b7683a3113b4792e61906220187452525c37669271092a0312d43a0817a2b645146091114535313165590f40c0a4770c45a1a4411f5130c1033473008129294232875b
a5b042b90471d035633444f1d17e39306306582264e3005e0f52a31109080322032a2d45f1f1140f24a2b6250727f3c55b0a627082471a6031703f1a0693a435326132820f206680770d1517b1643a0b7113852e
e50980423d1490531a1503b3425421235056001130b1036d1850a00351071721a2342c342214040f05a395460911d1a7663475c38101014660520a0b625155571461635251364253344f1620b12163013010412e
a538c6590a21d051030a7330713403574313442f00b022593a121004252271920348154280a5641324c39664391500f546395490714b1257f2b3173145a1f1522031d3e334015402b6211e4233b6520d44a34006
092bf2961d077101163a22d3506a122030b71d186251202a2915804164241243e4551b0392255f0d15402176266310b662302710731b0e46b2e55b3731b167450f00b0a7273203c2556f1806e2e1630c70b22525
8bb6dc251c6523b73618061211240e57e0e067365493f47c064150301c0a64625021006190117e3675f213362226b3e6362c1050a5213d369103763e5651f55c2a73d2931c3e55b3272219111057501335434049
bc809bea314063c2453453531033111552c131383381c7180c7751145a2e5743452d25201292401d1122b50a0d20b3644b395362322d275642377a00422354733e1280716c3a4130b2170037a2a71d3564e36527
a0aadefb271450574a2e2102c0362204a0311016172207130e6673f60d2473c39712174550b545313283c46f3004d3d57b3f62b1b20d0e028155193f3471e6011665601062327100c2581f33e077483456726528
2ad1ac541a3341363624058055183a605273271a27c307270b629322452903615430050703960a270390704d152541b45a3e51d27722216222172a132731c3701272619562285211224f063381c376015401e15c
d8c3900c1c25e0a54f150740923314568204520e3493923a1e40f02024350602d1450300c3236f1d6651262d1006a3c0092a157347773e0780f52b1216a1347a1f30c335052914b2a11d1e4410c4603c7600e631
0d535da91043b173562572d2651c01540013622a0511a03522452050350a7471d2063946b1a56b2b03a247170f6091662d3b7542b06b3f05f1353908621215101e3722946c0c6382f05c0e05f3230f0121b2f145
e9200cae0806a3e53c302103f3122a147031501c02d2b1222a0162447707603130510c049164680022c2a64f3b55b3b67e1363c0a66526524202123a7773a547026401f25e0445a1e5423c54e2b3412f2423b32d
9fd355170174d1f35a2652d2b0431b46430252073301514a0c36b3330927127136641c7183630b007363f34e3530a227350476b2b75f317351a65c0205824218034143e12012347372691e21f215131b30e2d279
ad382bec1e354054412b20a207161a13b2e36621401267220f1290a57d1d05e072413b3550f11a290622104d2c1150062f3e10e0d4671771d3f1491557d2d77c0762e382262d4753a33307058386320d34e0e605
f3e516a4211510d0293c5423c53b19560131353a71a270103c074267013f06a08266270472d215287433c30e3625d0a51a29707350683652434751286182133c3937b1f1291c13a1e57c2c30b077180e52c06625
99a42ba03814a2f340220351463c0e4591b16e1b73b18777044203c4450b4042521915714182600f1032650c215203e3350645819560022400f06d0902513645391622a017185500a11c1806e10021175520b527
f6f440451a0000b02a0c11735274066383371e1c74123477093162563e311131b0261f37506564262741e6291242d325203706f170521425c2c21b32203084163607b3960c2506c2207614201181332b44826752
e2498162245263b33f2465a3a32c0a0600b7551206e1560f341380246e0a152292612d61f1d223031142675f3f6311a0453b2453516b3b04b051323865b29242173380d0132b4453613e2d02a253212b5752f26d
4d25557c3d23d132142523b053540155d20455234300621527144024791735527727057780962c3965f1810f016361141e195041467d2d25c3831b04746380681000b1650b1c1152a30a3517b1a01d1a25b38556
7bdf26af39340122450f36d22044292420a04b221082d6582e22539638076651172b3e3283a7112105d14737024052735f3e50a0722a0622e34612372432c3321f32c3a4663a72f26351085423a7302306b3862d
59e13aae125361f72b0c63110060126411206204218081590d30e09542077123011a20309024772c659207560c71f2a2690f031250530734b1d17a10433272380775603621024330c06c205281452b3121b3a608
5bf35858093190535a117740d572235252b7262c22e39530253502b5013a15f1d44521168035060671a1e3021451435539024200e2661e60c024420f5290972f1d5051506a2f53737061282023a7623021a33545
a3a35c8e331470d21533067237682a5271544d3f40b1106238365353610e17e3245f213760d77511331335342a735092673606f1014539040097421c66e3a0471e4361966d3761b0a37a0072d2c226261582c111
560ba50515368155311a54e263603121a3f44d2607126036112671213e2a0630c168195483353f3900c2b1423930a277231e15c0356d333673c0051134d2f60d152122a5101546d1d365035083055f2352f2c610
edd52bf22050e2d7330a00f10527381340e371297380241b213140c432392322d552147390c1310c2603940d3776323161342270577b0560022744384260a0260d34c020352e15c0a21409213194123b22c0c629
fee6b7b90840b2a267302442c6761b2161d5423906a167211850e1936f186782d124185241b4063d36d19301332193e4322c5551a775287511832d160450570d3001f3c60e3071c2d1130e6361124f2a6283827e
1a4b990d205243e5312c24f312221474f1b229054543f55c1d12e0366c3a56a0a2790854f026342e2541d549155363830b260772f52a18239036413054b267372916908345012092b6792971d272023560c2b307
__music__
04 3c474435
05 0a5a6f0e
02 58556a7a
08 56051b11
04 0d122b10
01 2c364a60
07 752b3341
0b 393a303e
04 6a4f7914
0a 46465802
0a 2f534411
09 42433b38
0e 1c143c27
0d 1855283a
03 35575019
05 196f0303
06 6105025c
0a 7f1a552d
0e 5771791b
08 37751e28
02 75156325
0d 6b641a44
0a 2a440723
0c 322b720f
0f 222b3532
00 7f271c6e
0b 767a7e46
04 2a49485f
04 3d2c7871
0e 71396402
07 552f4606
01 13602b0c
09 7503637d
00 2e7c103f
0b 7b072970
03 6f1b2b2b
06 5d723369
04 4a532d10
09 032e567e
02 1764316a
03 533a1a68
0e 5d153b45
0f 06302273
0a 7645064b
0a 6403057a
0b 2e146315
0c 58360859
0a 1158203d
0e 112c6835
06 5d0c0334
03 78455a57
0a 3e692a7c
06 46351a67
01 552b3c74
0d 6a0d4d2a
0b 782b6025
0c 30050045
0c 365c1361
0d 027f0c05
0f 51420a6b
04 5b7d5c09
0a 20377d47
0b 6a717b37
0c 4d695229
