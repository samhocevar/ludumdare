pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
--  ld38 toy project
--  copyright (c) 2017 sam hocevar <sam@hocevar.net>
image_list = {
  { file = "data/skyline.jpeg", w = 1024, h = 128, tolerance = 62200 },
  { file = "data/bear.png", w = 128, h = 144, tolerance = 20000 },
}
current_image = image_list[1]
facts = {}
global_rom = {
[0]=
0x329b.a447,0xc035.53a,0xf474.063d,0xefe1.6302,0xaac9.fb0a,0x6f0b.681e,
0x7635.9525,0x3ace.7645,0xfed5.cc0c,0x16bb.b232,0x5373.f41c,0xe61c.70ab,
0xd1a3.cff,0xf2e2.dfa5,0x572d.3138,0x992e.038e,0x1fb5.a7e7,0x1603.5732,
0x9a53.8782,0x1249.b079,0x4852.fd82,0xd107.69f,0xf0c4.891d,0xc69b.e98e,
0xe22e.b22d,0x4053.c117,0x8504.78a2,0x783.29e1,0x5d8c.1f4b,0xf0cd.a806,
0x4a1d.4704,0x8aa8.ec6,0xa950.efe8,0xbe63.31bf,0x51f2.a1c3,0x27d5.0243,
0xd9f9.3768,0xb33c.6237,0xa1e7.58ce,0x7d1a.7c34,0x18fc.304,0x62fe.1fef,
0x9138.934a,0xa7eb.7ca8,0xb978.c89a,0x803b.5b9b,0xc69.182e,0xf8ac.6f7b,
0x1e46.328b,0x7f02.efb3,0xb182.19a3,0xf5b2.9bb7,0xcba.738e,0x4068.0b4c,
0xdcf0.3ea,0x2f72.beb5,0x3125.e51e,0xa974.3c17,0x2356.1317,0xdf51.7ac7,
0x7268.69dd,0xca42.ffd3,0x681e.e68c,0xd09c.20ba,0x5dc0.f0de,0x4838.a1fa,
0x3b0.27f9,0x82ff.b19b,0xbb91.9f56,0xc2a7.4717,0x6c2b.7416,0xd09e.6315,
0x808e.6126,0xe30a.6fe8,0x9f23.0b2d,0xff57.9431,0xa276.2cdc,0xcb22.13a5,
0x4256.a1e9,0xf823.b2ff,0x4603.d532,0x33b4.47e7,0xbf15.a653,0x48e2.5a45,
0xab5a.4d49,0x6a85.d641,0x9a17.8387,0x20a0.ba1d,0x3074.96,0x77d7.2dc9,
0xdfd3.d438,0xfbb4.532,0x598f.e157,0x3b87.225c,0xf47.0761,0xb80d.fdef,
0xa0ff.f58b,0x84f4.d2a2,0xab29.c747,0x9d48.2023,0xa27f.6041,0x17c0.c1dd,
0x2a71.2f3a,0x314b.2ec7,0xb718.2c82,0x533d.9731,0x423f.1332,0xc899.cf7d,
0x21a9.5e58,0xfa65.0bb8,0x3285.0b99,0x1126.a37c,0xb123.ec57,0xa83.50d2,
0x5281.e407,0x441d.43c2,0x67d.e07e,0x942d.74a1,0x25d1.4c3e,0xd027.1ed,
0xdba6.6c9f,0x9411.9199,0xcffd.9b04,0x21f7.c32d,0xa43.8b8d,0xdb3.1f08,
0x7705.43d3,0x3611.45b9,0x3052.564,0xa3ec.b584,0x301b.c7b1,0xc52c.d835,
0xfed7.7893,0x90ef.54fb,0x57a7.3874,0x4dbd.9582,0x9299.3dfd,0xbc7f.18ce,
0x84de.fec5,0x8edd.20bd,0x8e3f.1e38,0x7883.3f76,0xc6c1.5581,0x6aa7.1607,
0x4abc.4e1c,0xbc79.c7bc,0x9c7d.9c3,0x764d.4a8,0xc074.f848,0x2f3c.2674,
0xa0c0.7fa9,0x2005.da0a,0x25fe.8467,0x243f.7a1f,0xf1e6.18a1,0xaec.0835,
0x4c10.a198,0xc16c.2fa3,0xf017.8d2b,0xfbd4.0797,0x24bf.1ee6,0x7989.5044,
0xe112.d4ca,0xb92.91c2,0x5c82.b833,0x511d.05ff,0x8a50.2831,0xbb82.4f8,
0x68a4.21da,0x8d12.8044,0xa190.f32,0x259.00e6,0xdd18.edb8,0xc159.e73b,
0x393.ac6e,0x7039.2453,0x685d.8f73,0x3e41.bf05,0xf744.28dc,0x2098.284f,
0xcdc9.cab1,0xafe5.543f,0xc284.ad96,0xfba6.3fc9,0xb38f.4702,0xa265.cedc,
0x26be.b9c9,0x90f3.121f,0x9832.f37,0x7938.f38a,0x3265.cdfa,0xac06.ec89,
0xa276.fcb2,0xff1e.477a,0xdeb3.65d1,0x3b7.eb4b,0x97a8.30c2,0xb137.eb7a,
0x4100.4957,0x6f4a.82ff,0xe0ce.225c,0xf472.01b3,0x9d49.2aac,0xc078.48d4,
0x1bc.c398,0x12ed.8dce,0xfa29.fec8,0xaa1e.6ba4,0xb115.cce2,0x47bd.88fd,
0x520d.12df,0x7600.e832,0x2e4.5788,0x425b.eec6,0xe2b7.d263,0x6820.5b35,
0x1584.8e64,0xa4fd.74a6,0xda4f.030d,0xae83.6438,0xb033.f764,0xc339.cfe5,
0x986c.bc34,0xbfc1.526f,0x3134.10dd,0x8997.d631,0x827c.4e87,0xb2c8.bd43,
0xc1c9.2f2,0xf4c8.97e4,0xc609.d984,0xc698.f968,0xf910.cc06,0x7f93.8a33,
0x5608.0c67,0x3b62.a0ce,0x28e9.b207,0xa0df.70e8,0x4840.12ab,0x9382.c0de,
0xab0e.4c41,0x9f9c.cc4a,0xca13.cb64,0xed1d.bb33,0x4154.e088,0x60d1.410f,
0xf3ea.c0ac,0xf813.b9fe,0x9ff3.811b,0x4243.381b,0xd9c2.f91a,0x35b3.6721,
0xa47c.7188,0xb643.dbe8,0x4c94.5098,0xcdd9.0e02,0xb515.14cc,0xd262.a87d,
0x80ff.b224,0xdd47.6d16,0x28f3.ac3e,0xa06d.4fef,0x1054.22e5,0xc0a8.8b35,
0x6dd2.eed4,0xff35.dcb3,0xf292.d8d4,0x23ec.6e31,0x8999.c263,0xf325.5c38,
0x7864.471d,0x55ff.5d19,0x2392.2166,0xe28e.3011,0x81e7.32aa,0xdd2.ca23,
0x5c33.28dd,0xbda8.ed9b,0x1d99.cc85,0x66a3.ecb2,0xec06.108,0xc07f.acb,
0x634e.5838,0xcc08.ef26,0x22ac.a3b,0x520.b9c1,0x4465.e119,0x7a03.f179,
0x211d.af58,0xb353.3483,0x967.91c9,0xa0e4.3665,0x4665.9e87,0x5d9.81f2,
0xeced.2e75,0x65.d304,0xadf1.124,0x511a.b89c,0x18cb.8743,0x1816.3c32,
0x1057.a065,0x1d20.2a8d,0x51bd.d21e,0xc828.8e3d,0x164f.ff78,0xd6a1.a759,
0xda3d.be28,0x80fe.029d,0x89cf.a665,0x9512.8e4a,0x2ff0.0abf,0x44e3.fb51,
0x4eb5.1228,0x466a.63f1,0x332.405a,0xc6ea.6185,0x91dd.fc02,0x8495.3ebc,
0x47ff.0076,0x3058.2393,0xece5.f83b,0xb000.f14,0x8a81.ac97,0x3155.16c5,
0x30cb.342e,0x5238.0f93,0x4283.b7dc,0xc9ea.91f2,0x400e.ca07,0x8d20.f432,
0x4922.0ae3,0x87c5.6b21,0xd03b.3724,0x91e5.c8f4,0xffba.5efb,0xe16.3b19,
0xb0bf.d9a9,0xab08.ee65,0x2a9a.b613,0x3d97.ddbb,0x719b.9657,0x9780.40cc,
0xf55b.e756,0x15b4.503f,0x6a17.72a9,0xfbbf.837,0x511f.99c6,0xff27.e45b,
0xa96b.83b4,0x9329.7c1,0x2452.8c5,0xf368.9c76,0xb708.cc65,0xb1c6.7f3c,
0x48cc.d8c,0xbcb2.1f24,0x9300.0242,0x7203.46c5,0xfa52.187e,0x8552.a785,
0x7f04.a608,0x104c.af34,0x35a0.7192,0xb291.eb6c,0x3d40.54a6,0x6cc8.e214,
0x6ce3.91ea,0xa8d2.fd87,0x2cbd.311d,0xec30.1e5a,0x29f5.81a7,0x5e8d.2ea6,
0x8a60.5469,0xdefc.f9f5,0x4528.7e7a,0x1701.45ff,0x9a62.7852,0x1902.a491,
0x89b0.b436,0x140f.4939,0x27cc.ae84,0x31a6.49f2,0x7c59.24b,0x6a62.d084,
0x90a4.eb1d,0x103b.fc9e,0x144f.38e8,0x816d.852e,0x18d0.d2ad,0x6455.d57d,
0x23de.8861,0xa984.8b3b,0x6f09.fd91,0x7639.6133,0x4eb7.efcc,0x3092.43d1,
0x55e0.00c8,0x489c.fdaa,0x3780.5784,0xeee4.3854,0x998e.300e,0x9e53.7161,
0xbba.a86f,0x419e.ba2a,0x1861.0d94,0x702f.2479,0x2d29.4ac,0xa2aa.493b,
0x5485.9322,0xd785.1dae,0x883d.d0d3,0x747c.b0aa,0x9a09.3228,0xf82.1d0c,
0xa831.1fdd,0x2085.64c4,0xd59f.0eca,0x9640.690c,0x39e.a701,0x3adb.61dc,
0x1748.df4b,0x7050.3e22,0xdbd1.e0c,0x6d6a.a718,0xa11e.cc81,0x6a94.717d,
0x23ae.f454,0x2631.6685,0x3695.763b,0x3a74.4881,0x8bce.67c4,0xa3c1.93d2,
0x126f.e773,0xc4b6.5e1a,0x89f8.f52,0x90d2.27ee,0xa997.0a46,0x409.8871,
0xdfe9.8f7b,0xd1b2.2b91,0xf846.5385,0x7214.7a6d,0x62dd.b25d,0xfc2a.ac15,
0xc479.54eb,0xc3e2.1321,0xa43a.429,0x8945.5005,0x675.015e,0xe93c.1196,
0x7bcb.f32c,0x98f3.781d,0xb43b.930a,0x3bdd.441a,0x37c.d432,0x7553.37c7,
0xba7a.e9e3,0xf543.a3a8,0x8c3d.4ce8,0x6f29.b883,0x1955.db6,0xb591.980a,
0xbaaa.a98a,0xb141.4368,0x50e4.6888,0x2830.26cd,0xc80f.4207,0xf2b5.5e63,
0xf4d7.5131,0x4bd7.66ee,0xafe0.beab,0xa63a.7a3b,0xf6e1.7b72,0x8f2d.aedf,
0xbb3a.8613,0x854f.bc42,0xd7e.cabd,0x174b.25a6,0xcb80.99a7,0xefd2.625c,
0xa889.0052,0xc8f6.e698,0x9be1.e89f,0xc3d0.663d,0x685d.fbc2,0x670c.c8f9,
0x748.217a,0x92.a8e7,0x3f18.a41b,0x1a48.ecec,0xe486.2004,0x8b36.4d22,
0x10c3.b305,0x1d0b.c268,0x8762.b7aa,0x9014.33d,0x33f4.80a7,0xedf3.8571,
0x86ff.dd7,0x695.9bce,0xa12a.322f,0x814f.50c3,0x43fa.029e,0x36d8.80c6,
0x7a54.8fcb,0x56a0.c3fd,0x6304.569c,0x121d.2001,0x9e69.23eb,0x85e2.cb26,
0xbab4.6c74,0x1470.5bfe,0x7650.49e7,0x2a06.7fe5,0x1667.539c,0xeef6.4122,
0x1dfb.9455,0xf1a5.8cb9,0xca40.925e,0x743.2c84,0x2251.13a9,0x107d.294,
0xb524.a02d,0x8762.d26f,0xf736.8fe,0x84f0.0d9,0x419a.aa42,0x3a0c.ec04,
0x958d.e56,0xb786.9f98,0x8a7a.1d66,0xca80.989,0x5e74.a07e,0xc980.8a78,
0xd09d.9dc6,0xc248.2269,0xe50a.1427,0xff3c.768f,0xaf41.5b4b,0xb479.8313,
0xa407.321a,0x21cf.d3b2,0xecf9.ca04,0x40e1.21a,0xfb09.a229,0x217b.38fa,
0xf7df.a471,0x619a.b702,0x9c77.b852,0xf404.f1b7,0x5a36.ee76,0x299f.cfba,
0xcfd3.13ea,0x7068.2383,0xf204.995a,0xe541.d6f2,0x4cba.d933,0xf11a.66,
0x1f08.bfbb,0xbee7.c38c,0xb956.34d,0xd3a5.674c,0x94a3.7d9c,0x81aa.b7c7,
0xe81f.25d1,0x4623.df61,0xcfda.7ae5,0x3543.aa4b,0xade9.1d92,0x258d.3c0f,
0x8060.7f1f,0x78a8.7c78,0xe83.643f,0x3218.5559,0x71b4.26a9,0xc3a1.89e8,
0x6a45.c3a1,0x472.a1e,0x95b8.1cc8,0x6aa1.e457,0x6947.60d4,0x4d93.1c08,
0x4770.d26,0x7554.209e,0xfe60.3002,0x8250.b0fa,0x43bc.f3c9,0x8c48.69b7,
0xf03.f8a8,0xde28.f235,0xee54.77a1,0x632b.6458,0x413c.404a,0xf3a.a729,
0xca3c.e2c6,0xf87f.e543,0x1e7d.0aba,0xbd83.f5ee,0xbfdf.f68e,0x1435.4e6d,
0xee5d.1012,0x1a18.53e9,0x8997.c76a,0x313.0ffb,0xd6ec.1748,0xfdfc.5251,
0xe5a.d503,0x43e6.e959,0x142e.a05c,0xdff7.50a3,0xf88.9401,0x9937.58f8,
0x353d.0362,0x32e5.0d38,0xf6b3.1fe9,0x43a3.a212,0x6a15.118f,0x5598.07d,
0xc21a.499f,0xccdc.7c84,0xc764.b06b,0xf0a.7c4c,0xa360.389d,0x278.1f02,
0x1a55.1fd8,0xcf47.e67a,0x6917.b021,0x5f89.c218,0xd9df.ea28,0x1281.a651,
0xb7d7.92c8,0xff71.431,0x62a6.3538,0x4fb4.da43,0xb341.b3de,0x1d1c.bff2,
0xd402.fe1a,0xfc1b.03ab,0xde86.906f,0xb40a.213,0x91df.4409,0xfea5.fc45,
0x7b7c.b822,0x3444.8216,0x2629.96ea,0x41da.ae7d,0xe42.9a84,0x50ae.3dbc,
0xdd06.9ea5,0x35e0.7299,0x300f.4f5d,0xae4.8fdb,0x8eea.42e2,0x662b.47b7,
0xf7b.e29,0xec17.81e1,0xe7ae.52d4,0x6557.9548,0xa2ea.6739,0x107b.8b21,
0x1692.0daa,0x74cc.5e3e,0x1473.b17c,0xe5ce.20f,0xd543.a763,0xe809.dc7b,
0x533b.1575,0xa62e.18ef,0x14cc.0648,0xa141.a035,0x4bdf.d95,0x98f2.ee93,
0xe4b9.5648,0xfc09.88a,0x21a3.ff,0x1c46.f657,0x88b0.10f4,0x28bc.387f,
0xfbd.fb03,0x1bf6.246c,0xb829.ade3,0x999e.d372,0xeed4.a8f5,0x9c19.2a3,
0x60e3.e3ab,0x5ab2.ae76,0x4490.03a2,0x108c.53fd,0x75f6.02b3,0x301e.9168,
0xf23c.3808,0xa742.9fa2,0x8dc6.3fa1,0xaaf2.2d0c,0xb841.ac0c,0x21c7.ff9f,
0x46af.4cf5,0xf655.ca67,0x30df.919d,0x7730.9374,0x90c3.1214,0xbf8d.440f,
0x3524.cd9c,0x4f43.0a2e,0xce78.1d06,0xfe91.0b5f,0x52e8.7fc7,0x1c21.b194,
0xa212.f5c,0x5802.00d,0x58fa.befb,0xf688.39e4,0xe654.aa98,0xc943.dbe2,
0x2d3d.d78b,0x2b72.28a2,0xc16a.131c,0x72a.d74,0xfe3.e93,0x3727.846b,
0x1fc2.ff02,0xe79e.4e9,0x6f49.4588,0xa941.961,0x7907.038e,0xc076.ccb1,
0xcec4.419d,0x88f1.c4b3,0x9856.c819,0x2f83.2698,0x5255.fc93,0x1d2d.936c,
0x21e0.41ea,0xa468.aa2b,0x50ff.0961,0xafff.2b5f,0x1793.2c96,0xc3c5.5cb1,
0x9503.2523,0xffe.85fe,0x69d4.c477,0x954f.b0c8,0x6002.2638,0xad4b.171c,
0x8c1c.cedf,0xf280.554c,0x4950.e4ea,0xd261.1d8b,0xe7c.e543,0x5d01.9cf8,
0x5a72.8ed,0xf1f8.fe47,0x4cae.6d5,0x1c2.e119,0x3d50.e501,0x1db8.33ea,
0x71fd.7ca5,0x9a47.62d8,0xc5ff.9c73,0x8ff1.9ba7,0x5ab6.0c64,0xbc19.632f,
0x7ee0.f3fe,0x3db0.3b27,0xf3ef.67eb,0x3fb4.eed8,0x6777.d7e7,0xfe13.b24f,
0x4ee3.d9f7,0xfd76.73eb,0xf9ad.07fd,0x9078.3c5e,0x9b3d.b05e,0x9fdc.5765,
0x5e9c.783d,0xe7b6.7ff1,0xe82e.6fdf,0xfb79.ff5f,0x20f6.6cc5,0xd6fd.f259,
0xfbe6.ddfc,0xfefb.04f4,0xe7e6.9fc1,0x5a75.f3a7,0xf3b1.df9f,0xd6ff.0993,
0x9357.ffe6,0xe65f.f3fc,0xd7db.f79f,0xdf67.193f,0xf6bb.393f,0x364e.db7a,
0xcf5b.43df,0xe766.ef1f,0x5af6.56cf,0x3ddb.5b9f,0xa7ff.5d6b,0xbfce.b41f,
0x7fdc.3e76,0x6bd7.14b6,0x2044.6feb,0x9fb5.bf3f,0xb185.f3e4,0xa0c0.6127,
0x7f60.fd75,0xfaf9.f5e1,0x6adf.fa13,0x2576.0f9d,0xd77e.ebdf,0xe5e0.3f5c,
0x9d7e.7bf1,0x3db0.ff5c,0x5d5c.b65f,0xe7d7.af1e,0xeb92.76d6,0xfdcb.67ef,
0xf61e.9e1b,0xe6b5.9dd7,0x9f38.5edb,0xde9f.ab8b,0xa475.682c,0x745d.3ef9,
0xd3fb.c583,0x7fc2.70e2,0x4e40.e8e8,0x87c0.e6c,0xbf64.7ce9,0x9f6d.1b3e,
0xd90e.00e8,0xaeb4.5f6a,0x6e7d.907f,0x2834.ffae,0x1e5c.3764,0x2f92.7faf,
0xfaeb.45f8,0x85f0.ad9e,0xdfc3.bf3e,0x70dd.f5e3,0xc3b0.93fd,0x7400.9907,
0x78d9.b1f6,0xbd75.acfd,0x5fe4.f248,0x14e3.fd85,0x737f.0837,0xf5d2.d49f,
0xfdc2.b64f,0xfafc.933b,0xb63f.a75d,0xe022.c7f8,0xed9e.13fe,0x9f07.3bd7,
0x2495.afe,0x6fc7.6bd7,0x80ce.a28b,0xafc7.6c7d,0xfae9.d17f,0xbc7a.79fd,
0x66b6.075e,0x40bd.c924,0xecc9.c78f,0xc021.7677,0xfbfc.c30f,0xe3fe.fd7e,
0xbf5c.2f48,0x3f69.e417,0x8338.df5e,0xc23d.0917,0xee07.fde7,0x9b7d.6034,
0xfe5c.7735,0xce9d.8f9a,0xee8e.d87e,0xbb37.7f77,0xb794.49fe,0xfec0.498e,
0xfa5e.bf13,0x927f.af1,0x9cdb.cb89,0xce93.9a2f,0xfb8b.cebd,0x6edb.bd89,
0xdece.678b,0x44b8.95bf,0x5092.7d71,0x9c7f.afc7,0x5b03.fbaa,0x139e.bc72,
0xb94d.cb24,0xe9d4.7327,0xbad9.eaa4,0x93fa.0b1e,0xda2f.5c84,0x9178.3fd7,
0x9c11.bfdc,0xb1fa.d9fb,0xf07a.e49e,0x9a3e.bf2b,0xec63.7d93,0x9dfd.7a7e,
0x6db3.f4ad,0x3e6d.bf77,0x7782.771f,0xa73b.9c68,0xef72.75dc,0xe1bb.0891,
0x9bbf.cef4,0x9849.ffbb,0x47de.db6e,0xfc0e.9b6f,0xf908.c31f,0x5246.83f5,
0x4ff4.dbf6,0x85fd.839c,0x83e2.236b,0x131a.afe8,0x45e.1ffb,0xffcc.d2ff,
0xe7ae.ebf6,0x6144.734d,0xf921.927f,0xf48f.d9dc,0xe675.4086,0xa0b.542,
0xd337.5fe7,0x6b4f.d38f,0xdeff.937b,0xda66.e0c7,0xb746.ffff,0xaf77.e78d,
0x1fcf.d139,0xe16f.ceb5,0xad67.7bff,0xcdf3.5bef,0x5a4f.0bc5,0x6749.ff78,
0x5fdf.35f7,0xfed0.78bc,0x16ff.c73e,0x9f65.ec0f,0x539f.e5ef,0xef18.b403,
0x7d17.9f67,0x34.289f,0x73f1.27de,0xb76f.8f1b,0xcfb9.83e2,0x9b4f.1cb3,
0xfad2.7ef9,0xdd13.c69c,0x5b0f.f7d6,0x13ff.819f,0xfadd.bc82,0xc67d.6bdc,
0x7af0.e7fa,0x907f.cf1b,0xfde2.9f5d,0xdb9f.5a77,0x8be3.00f1,0xff9d.6abf,
0x1ce.7c34,0xd03c.7cf1,0x7c5e.7d6d,0xbf78.b5fe,0xcfe7.9805,0xc1fb.e16f,
0x99af.cfc2,0x5c4f.15af,0xdb9f.5acc,0xfce1.bfdf,0xfdb0.bc76,0x3cef.cf86,
0x3fbb.d7c9,0x6d37.d7cb,0x7d68.be7d,0x574.a016,0xf426.74a1,0x8020.1bfd,
0xb2ce.01c4,0xb07.1bf3,0xafe0.9184,0x7641.0607,0xad66.f9f3,0xf104.12f9,
0x660c.fd24,0xaf10.687f,0x9cdf.5c93,0x796.209,0xc11a.59b3,0x8ffc.c13c,
0x6210.dd93,0xa9fa.fc05,0x4d3f.9e21,0xd6c3.d311,0xddbf.33f5,0x214f.ae05,
0xd5f0.4761,0xec0b.f203,0x411a.45ef,0xba85.47ed,0xf5e.22fb,0xf3dc.5d12,
0x7ee3.8cf5,0x48bc.2d9a,0xea04.4fae,0x8b9b.1f62,0xebef.b647,0xdbb0.077a,
0xc793.df24,0x8194.faf1,0x45e1.f9f7,0x4ec.feba,0x6034.b201,0x7e3f.707c,
0xef70.ebdd,0xfc49.67f7,0xb690.8b3,0x1a5.f3eb,0x2008.93e7,0x4e33.2b07,
0xb5a3.fce,0xeb95.2608,0xf099.104b,0xcf8d.a76c,0x57c6.72fd,0x4a7a.fdf7,
0xf5d6.bdf7,0xfb04.1e0f,0xe5c5.78a4,0x26b3.c3d3,0x3deb.b062,0x69ff.bd6,
0xdf8a.d83,0xae29.7e5d,0xbda6.3e9f,0x16ae.010a,0x907c.6948,0x719c.4fd8,
0x3f76.61ff,0x4ed6.578b,0x33fb.f9e2,0xfbbb.9eff,0x30bf.cd3,0xe6e1.8e04,
0xdffe.808c,0xc5dd.45c2,0xdc41.fbe7,0xf787.dbb,0xd1e1.6c3f,0x6bb8.4917,
0x9430.31b6,0x9233.6abe,0xfddf.7ccb,0x8ad8.39b6,0x20b7.f8ea,0xdf5c.2f7d,
0x9bf6.0f8e,0x7867.ef33,0x3618.867e,0xa14c.7ebd,0xc6fd.d5d8,0x6460.3c69,
0xb399.6fdc,0xfd.fd07,0x7538.bbbf,0x6f8a.3f7b,0x78f4.5b87,0x9a03.046,
0x7afe.e79b,0xb9cd.144,0x3d25.427f,0x4976.fdd3,0x64df.dcf4,0xfec5.20ee,
0xddcc.2d83,0xccd1.0209,0xfd48.4c6c,0xf0cf.164f,0x443c.7116,0xdabb.a51e,
0x65e8.cecf,0xc57e.40f1,0x1c3c.1178,0x1fe9.10a7,0x19bc.7e39,0xb747.a4ff,
0x9f76.ae1d,0xcfdc.27e5,0x7eb.b63f,0x81f8.0b11,0x7f90.bc76,0xff24.fdbf,
0xf5c3.9fbc,0x4eff.fc39,0x9fbf.9f2b,0xff78.47a4,0xef0d.5f5c,0xe7f3.ce3f,
0xc786.fc29,0x339f.e4ef,0x4d68.3ffc,0x465.6dd8,0xf392.fc6,0x987a.f9db,
0x4c9e.36a3,0x3e36.87e2,0x75b1.c244,0x3a60.b27d,0x45fa.e4a,0xe6d9.fef9,
0x434f.afeb,0x7afc.fdb6,0x7cb9.e9e2,0xfbfc.b3fd,0xde1e.1695,0xfdfb.5c9c,
0xb87a.eb76,0xdeb.ebb8,0xe17e.7873,0xd25e.b1f5,0x2000.efc6,0x5ccb.7aed,
0xdd73.a0bd,0xfced.dbf5,0xbebb.45fb,0xb57.e2d,0x454f.139f,0x2680.ecb8,
0x76c9.d3c7,0xb79f.67ee,0x9e80.f55b,0x1cbd.b5d2,0x2617.47df,0xa1c0.9284,
0x17f5.c907,0x3d02.678e,0x6e85.f5db,0xefa5.3f7e,0xccce.fcfd,0x8032.4faf,
0x73f6.3d19,0xf7e9.e978,0xad9b.2107,0x3963.ed84,0x98d1.e141,0xfcf5.d3af,
0xcfd7.e17c,0x7b4a.3a7,0xf6df.f9fe,0x8069.7c9d,0xaec1.e1ee,0xd1f3.d713,
0x2f52.4676,0xf680.e078,0x6b7e.0089,0xebb9.fdc1,0x8869.a13f,0x676a.7fd7,
0xa380.a3bc,0xeb4e.b04d,0x7a76.17fa,0xc7c2.ca23,0x1f0f.fee1,0xe38f.4f7,
0x4010.acf5,0xf5f2.2f03,0x2ff.d767,0xfd61.33d7,0x83fd.7a61,0xffde.4048,
0x5196.7b93,0x5eb1.f5c7,0xfdfd.04a,0x980f.5259,0x841e.db5,0xbb87.6ffb,
0x2cee.f4e3,0x2e3a.0bd6,0x6966.4f2f,0xb2cf.f846,0x142f.07eb,0x712f.ed0b,
0xf19f.7db5,0x7d3f.1649,0x7e07.ae1a,0x1320.286f,0x1776.71df,0x2a5.8089,
0x7a29.f8ca,0x98e3.5804,0x603d.57ef,0x3427.f316,0x7afd.0f17,0xe0c4.b9a,
0x6a0f.bddf,0x8a1f.393a,0x1521.51fe,0x3df3.a52,0xaddd.0048,0x89d7.c07b,
0xf1e4.31be,0xfdb3.7a33,0x4f67.ebb9,0x7edc.b9a2,0x5487.a692,0xea04.482d,
0xbf5e.ca45,0x6706.71fe,0xdfaf.b45f,0x9ed8.148a,0x2b4c.1c29,0xb56f.2d08,
0x4fab.479f,0x763f.b3c8,0xd93d.8372,0xbc77.530e,0x387.459f,0xdbf.fd62,
0x5a7a.b30c,0xf790.f33f,0x5dff.ebf3,0x8718.0e6e,0x8049.6676,0xc8be.31b4,
0xfb31.78ce,0x967a.e49b,0x2572.d2e4,0xf52.46ed,0xce12.4044,0x7ef8.ffb8,
0xe8fc.001a,0x407c.9245,0x948f.b372,0x3fb7.9466,0x2165.a31d,0xf64f.21dc,
0x9016.ac0f,0x11ef.c67e,0x5f38.0d32,0x1fce.a102,0x209f.b727,0x18dd.78e2,
0xffdd.ede3,0xff83.c224,0x7116.8c0f,0x.0a5a,
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
local function bs_init(data)
  local bs = {
    data = data,
    pos = 0,
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
      self.b += shr(self.data[self.pos],16-self.n)
      self.pos += 1
      self.n += 8
    end
    local ret = shl(band(self.b,shl(0x.0001,n)-0x.0001),16)
    self.n -= n
    self.b = shr(self.b,n)
    return ret
  end
  function bs:getv(hufftable,n)
    while self.n < n do
      self.b += shr(self.data[self.pos],16-self.n)
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
    bs:write(bs.data[bs.pos+i])
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
function inflate(data)
  return inflate_main(bs_init(data))
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
    local rom = {}
    for i=0,0x4300-1 do rom[i]=peek(i) end
    for i=0,#global_rom do
      local n=global_rom[i]
      for j=4*i+0x4300,4*i+0x4304 do
        rom[j]=band(shl(n,16),255)
        n=shr(n,8)
      end
    end
    local tmp = inflate(rom)
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
  for i in all(image_list) do
    local data, w, h = i.data, i.w, i.h
    for n=0,#data[0]-1 do
      local off = n - 1
      if n % (w / 8) == 0 then off += w / 8 end
      data[1][n] = shl(data[0][n],4) + band(shr(data[0][off],28),0x.000f)
    end
  end
end
world_x, world_y = 0, 0
mouse_x, mouse_y = 0, 0
char_speed = 0
walk_cycle = 0
walk_dir = false
function _update60()
  rnd()
  local image_width = current_image.w
  local image_height = current_image.h
  if not btn(0) and not btn(1) and not btn(2) and not btn(3) then
    char_speed = 0
  end
  if btnp(0) or btnp(1) then
    char_speed = max(min(char_speed + 0.25, 2), 1)
  end
  if char_speed == 0 and walk_cycle % 0.5 < 0.2 or walk_cycle % 0.5 > 0.25 then
    char_speed = 0.75
  end
  if btn(0) then world_x -= char_speed end
  if btn(1) then world_x += char_speed end
  world_x %= image_width
  if world_y - char_speed >= 0 and btn(2) then world_y -= char_speed end
  if world_y + char_speed < image_height and btn(3) then world_y += char_speed end
  walk_cycle = (walk_cycle + char_speed * 0x.05) % 1
  if btn(0) then walk_dir = true end
  if btn(1) then walk_dir = false end
end
function draw_world()
  local data = current_image.data
  local image_width = current_image.w
  local image_height = current_image.h
  local lines = 128
  local dst = 0x6000
  local dstwidth = 0x80
  local srcwidth = image_width
  mouse_x = (flr(world_x) + image_width - 64) % image_width
  mouse_y = flr((world_y) / image_height * 126)
  skip_y = flr((world_y) / image_height * (image_height - 128))
  blit_bigpic(lines, dst, dstwidth, data, srcwidth, mouse_x, skip_y)
end
function _draw()
  draw_world()
  frame = flr(walk_cycle % 1 * 12)
  u32_to_memory(0x1000, image_list[2].data[0], 0xc00, flr(frame / 4) * 0x300)
  palt(0,false)
  palt(7,true)
  spr(128 + frame % 4 * 4, 50, 70, 4, 6, walk_dir)
  palt()
end
__gfx__
87c9dedbd5b64295a9628255792a6aa9a8141bbd25043926ff2cef1858ecdd88c56202225262cd5c447a7f4405de6e0e23facecb09b34d486bf754fdc0c2c434
8c7817194dd9604543bd9c296173620989494093256ee5447dc55662c09395c29456dadbfc3fcb7e3ccd5115955b71d4f8e465584e6e667cec97f3f97f3cc4b4
b4733e66cdc8b91733e66cdc8b91733e66cdc8b91733e66cdc8b91733e66cdc8b91733e66cdc8b91733e66cdc8b91733e66cdc8b91733e66cdc8b91733e66cdc
8b91733e66cdc8b91733e66cdc8b91ff8b7c2fffaffbddb7bffb3efffff0f7cffcff9df4ef9df8f6dacdaf1cda5ef1ef869e78b4f385a5e5af86979f77620e2d
2dfb8f1fdff1fbdf3e66e8f1e2fd2efef6ff8ede597bff86ef4ef71f3e5837cf9d2faff7df1c73f38faf70fffef0ffbef0fbaf1e79f3c6e7bf1c74b4f1d7f264
e7f939fa91ba7337cdcc17337cdcc17337cdcc17337cdcc17337cdcc17337cdcc17337cdcc17337cf35c93ae7dc8293e577acfe93a2fffcef7630771ff5b2e71
9cd9bc0f9ac8702939aa7dfdeac5c7249b0f8793f782f59bf90dc5eda91aa9ff53c9c9c79556fbf7fc152fec5d0aa6dda1bea0b8bcfea7dfd5ac7dc07a138d3f
ab31fbff88caf02262ee7dadb591e05cd95a7caa0478ce4e6f8821c7dc607efa3e753fb2d9ffa6e7eb5033dbe64d7deabf53ba27ab5a7f80a12b86efb69b7b85
022a4b459983d7f615db6749e3d5919771f0bff822c6cae54a5e5d265fd9fb156a9a55b4966e6a86f19271e4a901571e9991d6ba6f10f3bf7f4bda58b5b4fb96
9cbb493f3369fa522d24998c46eae5cf5cf1e329d08337d79fe7be4d4242fd4a334df60d1ba31300b86f757b725edaf5f3ae03f4e7d724ba6f48b088d5f22a9e
fe07fd8c1e4fc6e647e7e86d98b8fbf69054cf5ba6987517da42d7fa156aca319629bf44ed76a4e5dc9cb7a4bd7dddf4843cfe498e3c22a045f62df7d969ca6b
ac869fed223227d8efffe363592c619a19f4fde5efbe843b858ba85c2aacb1dfeca0efa914e249576affc5f4cbb07f25685868d9b4683ce73b5efcf005a2fd3c
cded6e6b9fab110284945bb40686c992f5755b062d6c7f599e69ed8aef9bef7e405a67c20a47c35be6f43cf571b8483d63557b542577db86db16494fa8a52691
4ff94d27e852b8f9b5a62cf873edcad375a394bf4e73afffc8aa5524c0ffd2899d9b50489fcd67dfe0b8f9b1e2a35589e270b17d30c95047c54221df542871e6
699fcdfdfcc14223c9bc859570bbfd6a869572c2f0c7faed0abae766645ac6529f6dbc2bdebb7efc997f8fd226eaff417262e7cad374ab3bfe16353bbbdc54ec
19829c86f7ea25a8d241faabe3945273bdb903fc5771e7fa19964664499b875c710dabef5fbb8cf659edd291d256954145c576d044d7dc29e4dfed3d2b54fa2b
da3a4c0f3f109cbe7b19fe661f2f618d99c7f29fdf6186bc5effc799f18a32f0ad75dc3fae77c19f213ea6ae0e90ad996954aef5e2ed1ccfdcac88d2ad398837
276c572e1dfa151c04e075be8445d94f7f3e22533fd6c3510dd4d162afdd5df30d229be21384de9d61da33fdd4e3ce37b5ff374f25fcf54fbfd8233e94bd8269
37a65fa5dff7de29cfe437767ab511d7ab5720ac71eca16dcef1ac69f408dff232702d572744dff6b14a73c634b0577965fcba4f26df7c9f14c12d937e7c5e2d
9622baeb7b037e22c2bfbfc8a2768699c6d2db75a0402bbedfc90becbe7cbe4ffbdf9fda230be4a9e9be3560d435d68890983f15a26b9970845c2c9b7fad5af2
add46319f2f2dfa2fd15d6618aa40867bde34610173eeb65e4aec6052944296b00dfef3ac0a4418adaf22859b4508301abe07658d1eb94ff54b987a72b60d8a4
6a1bb17916a237de663997844d891685ffbf4d974d9743018ce1efdf385ff3e256e4f7268adcb3560d1079fcbc7577de438604e45b47def70e8a7e9575ecfafb
e674989b06f7f0dff5c634ac4d8379d2dd86bae37dd9f602a8569c5c2e2ae79e27d960a7c3fba82d01c1dc7f7ae58d64bca3d24dff23fc2a4e42c9791bbdd93d
cdec59195f1052df1230374dad54d17b0d6dffcd9f4b7db9fe22bfeadf1236df539efbc8be5bfda711194ba9476907a6923121b2765543ef1f63578d6dfe14bc
aea54cc9ed82dd2699997ac72b6bea43bcf3bb3e7394520adb8fbe413e77b1180b18032d5a69ef75b84ffb676b791e86b4aebda309c4c37fd8b015511d27028d
5bbfa4feb576b49abcbbd7941979e2258dd5e28ca7f7f32d555557d89c079088bbb849ca6105aad2954a87db5b5a9dc7b5195faa79e2cb0fdc3a573cc6935709
6bc8cb1cf4ecdd63fd5c2edb483539b261aefbff2cb537b957be46e9057c3f8cbdc6524cf7f75a2367de0222dbe3462bae441aebfd8c9379c40955a43da0bc5b
9b6c58eff75bac247d9775cfbba49ecf4eda157881f38ef7abf4fdd4b663f5cc57aff37beba3a0a4e726d1e7179faec8ce3eaff434fb94b7dbc1e73dad7ed0b4
9ab8d876fc5bc0d7f93dcad85c71ca7fd447d8bee0b698469c8e19b8dc20affcd8669feaff55beabafbf9effbef4b2dd1d78580848110256c796722bad0d471d
e4293b39d7c24dff828e767c635fb5f1156f6ecb96b7f656d901c9fdc4a1bf95499621bba9324709a48f88fe5610237ffd64ff57e2b6b089df661985d66df2ff
7e3b4cd3757dafff9f38b062f43e2aaaa465f190290993a5e1fb02a204b6b09ce4ea95fdb14ffd7f97bd287f6470aa88673d956e6ec479cc9babb6b2ca16555e
c1742e1d0eb6ef01de7e6aaccf362c08cb895b889d37308ffe3e22558a05a3ca3ab7efe13ac50fb904542e1a2136fee90ac07caecb910f5fb9850d2d399ef7ab
8893dff6287f145c41ef289c3e7277ff56deeccdfce2ba5d523dff87fe233b611eeb4b5a5eb1c67dcf88c086faec714216c82579c65ed4affd850c6646259deb
77a2d856034d3727a98690ec86b140fbc53fad2a3b8c6adb1ec7d31755e2a99883cc9acc5faff9ec80e643ecbb1dffe443dcde5378dd188918ea17ae6cf7e047
e4de7f5f574d11b3697d56ffed860027a17b8d70257deaca7ddec35a6562c5573bcfb3fca543e971484ea0def61e79564d0ec8769aa24d161c9bdbdc6589cdef
d0b38c124ae2ea717211b47571159aaad277b508ff3f684ac4efd6bfff4f7c6eaced440b6dbd39b54d9a206a92bcfed9359b6931d2df7eeb311190725a794b96
9d0c7952f2004b1675ec796f587dd86f9a1e072b59a2776a1187afa13ede7e6feb04a16ee052716efd4910ed0c61918f5b380804b0a60856bdcd5606e9f3657b
69f9d4017e3e36599457809f2d433072e2612163ea53dd06a6e02ddd40664e1666a6e92e9f7d0d2b85d68ffcb94ec8f7d888e5b6c1eafb24d0dd55ba1ef3e69a
e485fe4fd6d6e3d3a9e7bded55d57249f54baf861064db64dfb8310c0c9f3fa69ef7b2d2592d7a18f46904f080a2dc2f5405051171459a97efddc404ebb84920
42f9f925549cbc5532ec4a90275593f3f6c104012dc8863fafc5506f5b50517fd4fee5683c162d2bc4504aacc8a64b2eabe610ff615a8129b62ed3bc4424bdaf
c98d613fad7ed33ed95504ea184357629759462aa0d130b6d8afc2d8217f59c3360e77a48d85a33139b5cb6bf007e73190149b37b956456418228ba9765f20df
f6200aed662aff55a7bb6f9d8d87d56ec6c4ebc6d1f5ccd6d262dde743299d683ce62e6838af49572fdecf6a21458daf64785835a12bdb7df189dfff871ee7be
97054568d00f0ffbcb2b1f271adeccf7619e5856637f5f77e50b982df769905def352ab856a835bc47eb50296dbd63ff55e22a8dc94c17dfab9f2094dbef3bf4
71766e909ea031f8d9cd12528ccbef70a94a7ccb20fded4428709a39d82ef55fe3890240e54b9d23878a027a08b9562677d4e7abf1520367109ecc8d38929370
aebe53fbec0e293368370fac45d34b4aaae2238cda984f3fa9ad6f5a1ffb5c78456871c8b6ebbc995904ef6d29c13a48b15c38e7bd4e60b09fd9d252be0fdabd
bfe0766b724cd91cff1cda35b628bbe6bbcb8f97aeb63270a998a8601445d20d5165757de8bfdfb2ffafafe538ce2e48419056c5713c7c3b0a6915450742e6a3
bdd785c89effad8b4e2039b169d291ec4f8a53d8f6a378fc9de8bc58aefef0f75e0fac791b04803c1dc9bb9dd8be488cb042e47c1e9c60760effb7692096fe73
723d20197e75bef3d6024e837c1b9caec9268696ece9e19c9673f77d4f6a1ebbad9c51f9171cd93c6cbdbeb23cf869698b4785af76daca35dffbedff72bfe97d
54ee32e76779f56cf7d9811e47ff1552b79a585239d4867e5c2c5a4b752a587b424ae45d1df665e9a5ae772f32371e99a95ebd3e45b04d0a649f4da182ca2005
683bbec6e2d9b1db55d9e232fdf4a67aae58e199f55928265a697b51c90462a21e6a7d4d7ba1dffb898570093a6a47fdded072a6a5e203109f1a4ca5af2abc0b
bf0c91d623e6d4730af9bc92492247abd3f5b6b7595d2c4285d57e2b16d9b772d0ff706cfff962bb8586ea7e64020e92387c97dffaaddec626d0e069b01f89bd
a8691bac86c53dcf3e73ed6d4a0343897dd6a23f7856cb7110e446fbafa9ea47a4f5baffd6f949314264cc570383b08de18648f19a16b2cf4b07e56c2f83d5a4
8993f115bb0cd24dffa283a9afe63affb50fffba9f613acf4894718e20f4cdc5b22f30147e2116b4902af7ac482e1774e394277d4676012ba26cf24d596808bc
5ec545e9daf3891e9b1db66c3b4ebb80b4e57aff3ffd5aefe3117f8944bc6f418639fe3d1c2499a6942421ed5613562b9835e64cb97acb7b36bd62df318dff87
978d58ff863f726e2bc49ea8d8e7653df877d6b4b9353a479486f3d411f34a2db56674b6b042b9b37a907a66ae56b846b5b4d46eccca3501a0c7b51cef7c87ca
e7d8effbea3282ccee45a07a58f22d352af2b4ebd0784e43317225bc2459eb9eabea372a72bac8fd5c51522f74d99a10cd30ffb59cb0f549f7845a30aac26b65
0f0255efc48627d641df23e1b80272bb960bc557417d6baf37d05c46c99ee59d0ff7dfcaece1348c6f1e46923b153cff738283897e93615b45c3811d271c8476
f0310c4a74dbd9bfe3c1a0700b6d238db4fd749572210b08bb17a94ebb44ba30f622742aeffde22092b42b52e6925611853137cf67a4faf1cbd8f9c1ead46d1d
a55611da059e2f557d1ecaab5371e3af7bee5230f7b1724585f1272bcc4c1c6b9b29de6afdcefb37cca78f5baff1c3249eb79a7ed57519ab4a61f0ae0b41fb43
166511f20750ba9f8030d608bcdbb295b9bb3f57bba614c0319c917107ba98dda74ef7d55b5513e6235af59568753d0925396ca769988268d46bcdf7510837d5
58c97402c6424948f2cc61e7777716bda1452f7bcec36811a5ff962bec82d393d62f16f9dcdf772df23bc4d622d9d6dff6d461d0574953d192a54ff48444a90d
a44eadd6949f2a541a4ef9c8bbd2b1598b8aca9a90fb42bd436d5f656c8f17c477e56e6c7b5e3b27c69240086f992ac46941ee099af7c576d3e433f11866909d
7196f601c9aa4f75f78f42555bcd9b24a1fad6e661d2621170b8ffdceff028ed622829e969171cada93b32ab28f32ee2acabac677e2729e9e0462e7a40396cb4
39db6d57edfdaab9ac6e4ab727615a618ac0d8919eeba89852f3a736cf8e7ae0a316c5cdc4063463589309c5e437a37aa83173e48e10a54c39d966562aff3765
6b628e827094bf4890167b9846aaa34591ac0c78ce2d977bd320ff377aef2ba0e69bac648d5c207ff5bb6d97d93431a3c9946549192ae4f8abec53f1a7009bec
29487918347d8efbebf8425f595aae85adf7363dbf532ff1affdf0b59c6ecc82899327bb304b721a2448d39e2a3caab60a7f68df56c080a61a1c46dc1186cc5a
2212b3e3d0f281f6d5c9ac424d9e67ba4487d561239882dcff5c200702e4765dafa931a4a67f166f9b19a8089018f69aa651bf544011bc51a04ac096d0082813
0e9dc174ed8eff33263f3682c2276baa686b340fd6ff76e9efbefb648d826d16f483e67860fc6090142c26305c231b4a1ca578a85e76647c9c9784de429c5a3d
a4e680e14e5e3f7952548ccef3201d690c68b749165799e435ff75b7987be66cb7b6b56fab8c352da2a666457844bd25df75e7bd75059c7566aff556c99c9059
8e2cb70def427c74ec4dd2958c98c55e776cf24bdc56c4897d4e36341c681f31b176ccff2f9b9d23f7197ccfa1981dc7bdd831918356317719033d0b57a87fa0
89087ed6b3ab0c469bec83c9517fc674a0ff602b60bdbc69bccba0a3556c97ac464d9f098f63cff3ea321abaa73691cff595df861a3bf5caffa556d57a4d3f5b
4454271a86feaa80ee3873a6e0f831614c6faabe4ff7ec10fc5db42d5699ad391f2ffff17a9cd8c9255abad4be5ef5e2cf96bcc7eae749f3bbf56ea0bb134e50
dacfb577d9e7fda3aef79eb4111aa808007c09fa6458b798d8d0a6fb0772e480b306630d210c92fd65ca4a17add51f6c0944a7c7b79a6ebf652a789cf6a2e046
e10c753128d004a986d2baf87c316ae021332388c7e45ffb5d2741699da786731ba3cd67118ff3a37670f4a2e5b05b6a215dd93f6e0a004ead73f07dabc496fa
833fdb17000014488b2e2d9c22a0766a68b04ed4f936b2583ddb117e62ef3be34849e5b85ffb99f4defedc8de3fd53538f821e9df4ee433e6f9633a17a29e6f3
2fe335192397e7e295d7515b717ba7ee79888ba7c4d30949f2d7a04cfef8b1bd62c08cbd16ba5401dd8ce0ee93118b29baa67d3420b6054f433df8f1bb41303a
de669d600021894ce079e8208d5c94c1f1c8f4bf96d9049f296cf067dc07d42d23e505a8ac083940b8845aa2461cb8a45d3aabc7eabfe0870d2283373ef1524e
fa313589bfff015999cdc508ffe50023b756caf7adc47dcf04b682f59609807b8cde4416a02ac0bdd4f91fb4dbe6b23b655a841c637f61aa85af6d48090bce97
02282be999c2ab014cdb9bee2fb215e1b85ffea10b4bb0db782e73677cae7b6d004dddc8e83335a9828f5a422d57ed8e47e1c0750a1b8576813cea7f7f3012ce
828aff5749adace5121545d270a4a0beee6e91c6ab1b2a2e7e1db8e370008eb5b13c9424980e398b23a445d2714edca9dcff7fc8c0964fbd1a6543bfa351604f
24e7a4d8616082d5d4aca52ae5451dd99fa72b54519f20b1bf50df3ecb0324dc8c4ff166371aef7a64ad9f0ebcac14d16d4fc22fffacef3b1fcde5582f1bbfbd
4dfb427460428722f45607353f2791fef54a43f904dd3d9ffee961eee0232760af9f7498241e31eb4cf7d09e630d6c2f1158c84f8235dff0c7a69b2c3734e847
4f29a91d9d2f66325db76db13ba04089ceb2537b55a3a4dceefd59180423b71cac7d106286f48d336f45c90d2d2a62d3e628090096c6118e4bc50cf9a230665a
b8b5dae7d3ac709d0a8d4dceef9b3fffac4610d0006d90dfc3a15ba2b75e637596f5e0a84c97510cff96ce65ab7b0da1d02a7d59c813e1c3b9890570aaa90dda
53a37ae02157d1792181f898a67b0c49a088cd0cf12286e79bd0f26df6bab548c7d61c47335dd130934414b31be70dd3cf750280c4c0b5412f44ffb93cbe9dbf
c121edf7c4af9b10f8768f1e0ce5b21648244189dbe6da5589a0b9fb40c29765e5baff1f8522781e4b44ee7dd0ed6323fb790ef74f0f472cb901495617d54dc6
dcf338ce6f6cc73a39cbd48b1559fb15025fdf8b8e4c5cadefdea10087afceaac4c824537834ac4d6282ee3a18d793102953b26f17e91386774815542d7e44b1
d3bd52ff384ac3b56545cd85bd56e3c1c189fe23e9aefbd1dd84ee31c5449e29c2bf515de3ddf4022fb43e7485643c22349475904c08b3a769a53e8aff56aee6
47b25f6c4117dc20546cff664f5affc1d748407efc2079b5f83054f9f92ec97e7a0a359992740dd2a487994d9f9abbb5b41e17318d5b6ccd636ebdad03311ae0
19f52a0c4b0243b229c11214b22ecaf9d9599cc0da7ebe4629489bdfc9d3aeff649e286ba0988b0cea0a275ec16aa8249afc5065b55bac2552f9ba7992b69ef7
0020ec0e68b2df2ee40d8be9955ceb5a563cc0ce4bea2f63eea2cad2d341464b5780be0be6fce90ff717547000ef3c02832d4363db79d63907b45278adf10230
49b235154482156ba065e660a821a65b6e665b4b7103533af7bb85bced3279a9392ae42ce82b27ba95abbd4b1b1df0d7c3a5d5b3d2a892bcab47c81830dc590e
fbf497ba151389ef6685f5cfd9765f2ac8d5eaff30a95ea3d338c3ee7e006bea33fef57de12f65005e5484c8cb5dddef08e7938af75563e0b3949046aff96efd
d57fac4e854f3adcfa0a7b986b6f9d7adff7bce94e9e4ccbcfb4fb972e97709e3ed3519c7dc429882e6910790eacb5ae7892c09551f1545e40fff92422bd7e7d
801920953cc263a981060018a6c7a001d47fe22d83989f8bc23f9f200ec07c1cef904708c1bb56c608753beb01b5b5e593b041d4dffb504beb479399a9ec963d
d900ecc2cdc2b3c2b425118e24cb2790e68ff6af7444b1ce9845daac53b9b8a22878782a59eab726452db407eeefdec4aff63ca98fa1304bcc771e29e2a7f265
016dad19da3d3c2c19d5572e8f95495a6ce744d2b01f98d20c8cd6e6579cdd302bd666ae260f12279b1e714a17514bf8fcdfd832503a901ffffe335a77a14c15
9f37c0e622beda53c6f7b995c00ac233ff4b925cb5d8759b3ec57253d55121fc28a3a76c00f5bb7b4ad81c5b4cb34510c19362f274b472d3fe3cb24169d888a8
0b282a627ae56d226405118dcd093c27dafc4b804d014d8bce06c00110820d968520f60b27eeea6a9161d4719d275f944e8a89df779e7ed6f9da1e192c14d127
f0584b1fce677014723de4d1dc830c27698cf773ba180e565e6eda6fec58a31b07307ead44eff7c55af47d65de1ec24bfaa7512798628e64a0f3ad8c3c4cc8fa
996c6823654007e8eb5c04a466042f4673a148758c461a5c89b1f00d2cd0079d27762aaab703c9ddf6caf73e3dc4fff9b354ec411e44df77b94093bed9ab4f96
d6562b61f1dcdf8aff80cd64aa10c935ffdef76af1d8fd3c6ef2e9759a9bac309417fe919ff1c8dc277eace58a5390ea22cf37ad0a1a2899533a2f1bfcc4dffd
a6431f52ab06447d461d55a5501015b632ea8e88d589bae37f8b2cb01757b74ccf2036630991a3ef1c00302c862cf32b1d50204714aa328e07764cf2a0c9aecb
0a1f5c3a59dcd2e2397f188fe9c57eb29173c1fa20ae0afd8f0cc626f4db5785f67d3d431fec5bbf38dad21943895a0ce6f820957c2758b53bce22db00c8d08f
f23486298c0e06c3805769820c85d08706e3b818a88445853268db05b629c3fe3210431ee60a1412dff53bfa7bc63cd0a1cd40ff745791985982b495740d9e23
86c7f27c4bdffc9e2cbb2df799a84d247261042156facb819b0f4320943afdcafa12447104ca1000bb5831513eda4c5b6915e9a1f768886dd9388bc30bd1f9fa
824ae0c398ecc4e2db16c57651164365255827653ffbf98ca425ad9cffc2bdeaaf72245840aa87a75ae060f28c28096046691ff103081b1731e51e5a5e30e63a
b24e22669e56448274193375e5c32d6bb8202e4562d0e12140b4baf21cfe0f973be4d0f2361d084ff502ad5f803f5411f40be0d3a922bc7ec0920ac16eff30ee
09339cda08f7b075c7c435707b7722600e73b772008a277a04c492afdaff4db1f4d1590c2251bab4627d997570bcc43690f1a029b0d9e51a22061ac2af7a8a6e
7ae168798aecd51000a19bc9a2bec4c430e79bd34d218d4c8769ab865ae02937b0debfc9acffc8520603b98007b0a140701758c7ad502af9e82dec1c43bbf8b6
69e6aabbc7154a142822cbe7c0af1b6072aea393e6b8d3b2494ee66a9766e5021b9f1c83ad810f67ea04238cfc5b9701cc6dcdc277cdac656c9052db14ffb1a3
04e4bfe4383f1885f710444b7641d66edb5b91c00c9e742756e2264b4c395b6c46ca6ed30b273a0efb017835222c27454b48fb742344fc0c2f796e790ffb33f4
3c8527e97ed0a2f446818712af6b81a6bc358a0341d8e462fc473ce763c648ec154e30ffd46c1c2739a06a3000e0e30c730e4d4247684d529aa032c61abb599a
4d6832c30638cf7bb9eb5e01e02c568007b1da51b65371d0ee738c775afb2df042c7b0b792aa0123e831e962665043d66da312fdec297a0150dc40528c2b2323
8c8eedcd4ec97d2c6e734dfd5b583180f91c82b120c0278b972d61c42ba73c2960bbaaf52dce8dfc263e953bdae1c955555a9e9b23e3f34549b92100ef444a00
bdf8829fdad800a2aae15d2f56484d50ae345034a6cb6c48295fed618f29434c225eb0d466ab797f3287f9855f5e49651c2bf5dfe25c1d65f05dcce16b84a820
4bcbc79f3409c8d2871d5135174a8eab5b237d85095b9619beb243308e4b1220c59150ad4791830348b643dbc04dea996db0e22454060ff70d775ef23a300995
eadfb0e915c6813f7da662f8c61c082cd82dfa6f486275651e80bf1e1e010ffb50c2b07f0ec0e529e960eca68ac26d92c13f3b27e52b5cf6f4de75bbe947ebc7
93068f70700465328e38bc626d18d9b6e606855d228683f8d8ea8e4f6da17c7c237ffc8f29e137944b73a4999ee887a00bb87d87d863e633338d804c21401afa
b7e971e560774da6e296ca859d3714853d46589ab24703cb5320ff751616a38f5e961cc73c604e08e20e910118375ff8c4e4297fa004a20c8c3dba85d677b936
685c66573314f97570f301dbf703106b8d7ef2b3a018c8fd4efb1602ab8a526228bb0c2bc4cdc8a7586288e05cc1b186dbbacec486c45e17b7836b45b94cbcab
c81195116c449d75aef30b73e9bc04e565fc5b6121335c627e08ba6880ca4590b2d6767742ee469b8dc04110870be6c7630b2b1b9ab9de98ff440808bb686c07
1ea36e08a8e81d22bd4c5f252a6ce315376d550421d8a4ab3b10f236781d6cffd6135b545009dab8dabb2ef365900018cdf5fa3946fece592b55ff56d55c6b3d
a891dbf79c795748aff2b65a878f3a38e962a98e095efa5712585c582abab3221c342a39410fd8c0a4655291b113d6076de2253dc1632b269cbf0d79c6b20bf3
9ecb98c874c5dfbca296977e357c666657f460c96aa60e8a5202b7841ca7f7cdab7c6a7ccead0e261b6c520707d85682a4e982a8cd0900fdda31cbcee60e8ff6
4eafff105dd7fccf18c694169d458210657038ef747ad718d4a86974f4d880a78980c166ebc73d46707c7d8b0fb34a688ff866d79ff7acb175b52d0b73eaf0a5
45bb3359eb9dd934a903851d355903b020002b70173752fe9103180d1438f20d7f23eb09ef3ac04660086afee8d6d964ce479c3c21bdbdbc81e49471aaa6d18f
50752029612dd6630183099ed69f372f52f1db79bc183a4ba2a8b0029ffb7c0fc01a4bcbdfaba86f0a135577390a11a3b726be50b16055f69d53e101692f1cfc
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
db7f3e00499bb3b2a946d6981a64648bbbee7263b7109cea7870f1057ba5417558c775cf6aac0a0cb0e956b1dc080527667b8414f62e967b315d1cf9cfecd76f2d98fa4e0faede5f832542f0f7b3bf06fff1354ea064034235369ded56415e98729d9a52fdfc502fd301ff5746728b720903f4cc15c8c3e01919c03e8fb5f742
0fa57080ba9ac47fa53c804ce546f4e4e6290dd639125a7a2d65a27416c0ae102a88ff8489f8ef8ef8bfc7ae5164e5d4c1ed6daf769713e37b2301360e0f631b6dfc4f6935f6d2abdb0a7e7725e8bd97a658dc506266441cd2a535f5028abcea99eae71355122f26ea376557ed86a7b877fde9ef8b6d3b45fd01fe72920bc95c
__map__
524ff7ff76c3a0ff00436e1c2e68bdce0810fb9af1a7b5659b2e100aa1f0aa5a591573e9cc53c08cdcdda4eb67806932b47d06fe9b31193bffe167dc52ca7e5974189186ab80bde5e9ec2cc37f2f8db27d2299dd7e8889622759950e210cf087d43ca16392fe3ff3ba0f758d9e41d3bd85b2651d1026040bd48610c347be14f3
11956e0205558cd269714ac98f81dd5b2ef7b83b5589fd385b4b6cd032fbe436650cc7cd35f9f97bab74d15bbbf0d5c6304482176bd2e26666ea3f6d001721fef7a3fdff2bde18fa6fb89744e0ca58243033dd0829aac6e0ffc776ff6d3e3b02ba3d27147bee6ec5f0e36485f161c705aa23fea3045c38fe3f25faf3a7b02b14
a7faea1d8b85360cdbcbf3c87c82b733f1bfef0a56795dadccde8e108e9e4b8b9474b175c206538b414be0f13de806bd47798b65eb32b4bc6a6d6654cd5d50fc699a611b816e7aacf11c23003f7784f35173da0a4c0ce56fcfb37fb0ff261dccccacafd1c5954c3fd09f7b8a52e0ec56ff04561beeda588474485fc6654c6fcc
b1bce9fce724bbd1fef74445e73f9302c8864f08d4d7c0ff8f95b08099828f87f13a1f7b008b7022f2df28b32d68b36280d8f83f60e2806ab6220c80fa2ffde796dc5395b53f2207764229ff5fb694241c88ff46be7e48c32632e3feb74a0a8941ffc9acee32839026ea3e770283b6a65dfe18089c42d281e9910408bc365816
75b929681fb4b84b47565309c7418a1957a9f7f622f2bfab44890166449f5cfeae2cc81e9b36025eb1b7d75821cfc67a4f6abd0d0049a576fedb5b1a07b2ff0c7689268dff9bcc414ee8ff37dd24725028ba00e9406c636202c6215af4ee367f01323dc1aec0ffde593c89f7e172213f7750f43f6164087934591745295121e0
4235a1db98b94d62d4aed2b763454123f27f52861478cdec5f99352278d5b9649247f676cd9583b5bf8ecc171f0d59626a074db3cb1f9559338beaa44dd4c098f736e21b9a6f447fcb08276b310f493d22a881f7185156a2fddf4036d9bcb201c06d25dfde62b98e27763c750f90b06d73096ac2799f5270395b63597ac45f63
ddce94119505f2bf2133df026330ff4a86403122f92f3c5ac806d02b40cd373a0effe0373105f82f0d72fe6f7b82a900d8d812c59f82051d597f615bb054f094b9cf4a3eb328ffc733b4644bcbfa8587d9ceff508b264413dc8efc4a3297d40b19c073ff17e4b12d335ab13816992cb5e73424b308400510d59ec1ffa5673075
f02306073ea251b3c087d11fb1d7aafbde35e51d371975755cff27427febb684b3c07f4b4b5152c17fd7febdbda0ff8db2f1d2135980b389ebbf03706ffb618ccfff29fe0300db9888ffcf3c1dc43ae039230d5bbe35779c2981635592b57190623b8ddb68d6bca56416e67080891d5cdcf55ca3637f48cafaee1d010366a8c8
9297455a7332a46748975512c59a9d9aefb043f484a26dd20031888937060c9ca8ace9ffcf29f424787488c0eda76e0157880b2af21f7fea460f77de51efd15d3e2b268ade3634ceb112708111e83d342943528dd6a1f8b6c72e7c53562ae9c5365233f04f8d398114239c171197b8cebb2077b0ff219f667a2dfda7865e2913
e1b9dd0ec54d201dec0174589f04fdf7d09e6c05f7b14533d79b40f506013f50391f02df0d96e0c2768b6b5dffd54e613ec480c98922d455ba4af11f1960cc2650a972a8a753982a3d6508c4ee8c4dc0b6ad4d2696e9d692673bca707911eb423003972a1992df4600595ecf8b785c2b1f4734b7b7abfc7bc9bcad6a86263a16
60a9671a6941c3888cff4842c6ccdb528fb55d0f38c9fc89fb7f49bdd9499c3781024256416caa9ef31f480f659a895cbc475ed1fe53999cccceff53a14bdee9474f2781ff1337bd728cb0241dcd00429f88ff1706c53c63e55042d2f60c132d27f61fd26d1f2f7a8a328141a961ac5ead6cf159fc49e03fb944d82c8f4d787b
1617f48c3472fdafc4eb4a02c060b25660a9b44d0800c4646afab267bba58caec44c6f59716c0fc247d8690f687893b02d6d3df423870cf009f3eac7e4124cf7806d25b4ac23216908c6f689a7d28c7eabe4dc800b62c1ecaecbe69af84ffb6fd853679c792f5fd4ffdbb2066b84a4e27fdf43840d63f18fe490c7d1fe636948
82c1b28d191121d142fdffc0f4df193a897086023ee69ac57f8143f81d262b39361587a0fab326fcd5202f99c5514c91aab00c2a6cca126eb9046db9f7bc80fe3fa7fe2b1308cd2b939c3df883fe262f7f88782b2ac430930c94893cd6ed533d0d724b8087598ff7947c63ec687ba8bd9dcf31c6a6d2f013d803a4d7fb0adc27
d1be60e5f0a07e8821b3e528bbebccdd9c7a8dd0bdc55ecaff09c205e56d95bd734cc3fa76e86a614ad93d14e27a144e46705b6eff3d7d43ed3cb92bfe3345868b591b60e2a21be3682f274ce8fb5119756373c5c0729bc61a0c0ffcdf42a4b4c52363778bd0f597aa3ee3598cb1747e241411f45ffc5f7371d1e3017ca6a67b
e51d109eff3b9701d0e25c10652c1162aca9f88170e0f940a56a3d1a14a01ae8b10492e80e9e716cc64ff045d77002830d266e684588312fa4ff056dfa85bb533da1d341d384a0c5b6d789e93c3a8aff4ee92728c0eae64ef49f9b59a279a007b8224800c16d9f3f52bdff0232e5fc97ffbfc3bc82070b60a969f2dd0e2163c2
763e4b69ed306ee42c63d2433588a8a74381dfe2663cfec70d7a7209cc43c0363de59be9469e90a7e46d7a70088b897a62d07f4559c75e56079640bea04ad3405529b41fd4a4f070761c0120cde63a37a9e731132df58487d4894fb095b15312e519cee1fb58ff00b65ec9e2ab9860b93065b910745aa62db7ef4e196a2353b8
e9fc57340e94727121f15f52f19eb19d44c49382a018aec7837f7445f097505206e0e741ffbd23a8dfbbf2106e33f0df7d45af486d96b2084fd54e16f0cb3a5fafefe6dff5ffed3bf825e8bf4900b3a8db8ce6e2ace3482a9cc12e49e6c218107968ebf8df947a2556d7149a0802b037060ea5cb283a8c9e7cd3c8b9e36f8160
94ae8584942157051374e1de39e49d00026908074b5b6ebe3b9c816586b15a6fc17f9815b019cfa340f6bd41d7f33581ff0c02907627ff4713956ac8b5aefa1a64ff112c2bc0d955c289fa2ffe0fc2116b0ab95ab972b8729b2cba3875fda79f82883c63e819dd39fd206e0641585ef1e61ed591a909db66cefec47f91df67fe
8731e533c77fe3a099942e0a0bacdcde5d42db110d4dd0ff919733b107e6cb64a4b27a90172fbb83f3a888ca6e78939a37aa33c583ecd82eddfd2e4d34332048938e289c5b4991a1f00c2e3283e7d400a59cb7f75cdcbc3446229e60b249647db435ceffae225dfd767197756ff01f6c3a817971fc0f2a3517aea8b4b147fd17
5f7755adc586cf550270d32f83724705a355150ca5ff7d3649a843c8d31e9b9e1cf074115ea4b3a9f80f68d1acf623b304db7d6fbe7a86de1d4536174f5dddc649657e7297b1748f3095e9ef658a88073c168698add9f8f8a36dbb68055d79d614661fe19c770a3228645afc09c849a85cddd2e6bbdea9cad46e11ac843d20b2
8ba00f9ed57a8662ee97cfd1164a4cb2c9961efc275428448db05e21350bc7d0216d910d82addecab94f6725fdbfa2a5633479d293d9be8de707b0f42f1fcb13781d18c846fc07235082678eb58b60674f9b59898102c396d19920db33c587a053c082541d64e5b7985454ce97bd1da7aa2720576956b9d1ce475f42ab4e1db1
aae1e89c55b4a724bb48bd7d2e0819844c88c1d318aeff634f226021cc0c3434a5675dc14b62a0933b3b3b45f0f71793c405f0e06d4fa58b74da18030549c0ca074ab681e4bbdc7dc52e3cbe8482fe9f4899b0f68a8f38aad0c418cb96fc14ea0afef3cb35de9be16048faabd68b9ccf159b3507e4ffa9f84f2743ae3f42f4da
07acfa663d79d013f65f350aa5e61b63c66760fa4422dd100881ffabf060f073db4c815c78e4b34df210982d2b3527973e09290904207be43f5a4c1f3583e51ac724d47f0a01f53fc03305c02cd16c7ab0a72e98b1a3be7e62fffbde62d6f35806f35958d6b0be61fea15e200c09f0bdbac523d74f94fd62a0728baa12dcdd08
884f98f0f659c8aa98f09d9f7862f2184e0ae98e2d794c184ff823783a13b34639accfec03658ab6761d539e2aa40b651aa891caf176f536ed3f33f456adbceded9b220036fef65f7cf5ee6ffe9a399a73e783a6621282fa7fa18603246f85adc4ff95ed65b844f824ae9b1ee68cb681511b3049239b41ffd769fcfd33e667f1
fad5d7f795e4d9f44a3bf55ae131d722fe6f51d657ba94e68eee4133f6545c7c1af1ff5a57c5e446e2557174bb55ee1c35e3c02dc0f65e772fda7fe93f3724acc584e299f782de42a422230bfe9f8192cc1ec3f81f33d58ae5d1b6ae333a67ce66b3c3fe0ecf7fad307445c5c4c82e7384ee992b11c5446c1c4406e525a4622f
c4109264c935ed5499e8c7b49a6f5b9876a5188cfa0fb40d14e1658142908ae0fd440d1c0a2eedc631c98fc6b40d925fa9f333f1ff4289e3ababf05231a5c02f2477b2a8c6ffaf5dff09fdc57fd611c57f12ca2a2b90805dd80985b14014a71791ff386896988622e2f8b1a7c09b2d1f0e0f0ea7cd3f6eff6f6fba48054f6b1d
2f4ce3afa9a70ee17a97fd8b01956e904dc4029dbdd06bc7a2d949af503f97d74f4d9bf7dcc24f42f781eaf4285ddd621ba14fbc76265b17123bdbfecfb90a29318d065fca075788211b1223e94a671e737e7d9403d5e2b36e364753d08a42af37bd8107f3d2a09eab1648c8287449eac2cc5bd5e90280dab573e23955221cf0
9f420ba0f67fa8cf4ae6a4bbab841b1ab2c6b1d1090087ce9c8fc4d100a0f1f4e93635b4e3fc677ddac1481046e49037ce1bed6fd86fea6f0640d0d2282089c21ead3dcd4b551ba41683c966f1213607632513c02ddecbb019125d23a650e9c969227b015506d7b9a6d4c51e6ba540b71baef91bc41e4bcaeb03453bf96153a3
f616de434fb611cfe3fb3f838362c990f39e24fc88e3822c90d1f4906e808070692b807c06084a26c3bc8124ece0bebda487fbf45261a68e3c44db635c6a9655febf21343a6c6c6d7b42a117a9fd9f20d079ba6da44543464f910153427be4ff1a4313f01f2d05ea3ebce3ec22b9cf4dfb87e6ff8733c197352f427a861208cd
edbf1a1ffc75403281245f9fd550a6e2977b113da0caa63412e51d165ff5ce10d5dd0ab961345d212e172564b46eab3b7653750656293ed87695deee2665dcc0cac7dc93c9be5163553125003c51bebfda483e945a097142d65169dd502d66d9b90b57a120c7c871c2886ea3bf4ee146aa8fb1dac646d07f79d00bda7ffa3e3e
1423fcc7472cfa123e7849f6b545037317ed6c4baa21a92b9af61ffa0f93ad021693084a149ebb00f415497c680680fedff5dfc089e36b7a663b60198bdbde0d7501b1e8866ac555700f06654fe4c5dced9d87754ff414c11add18fc7b08e66c4168f8b6db6cf2e9950fe0a3d638c58f4e6fb9fbefb09b84dc8afa4fa90ff9fd
2b42b187b2e78fbe7cffc293b8f89dfcdf1c0b7930285c559f554fad18b072c3a15c05ccd758fd266751ed290d9fe2c7535be692e24cbaa79e6a1c2b014145feb334fc6a8b32f454ed62c8e8ad08b1ea7d7cb1b27c8e88640fee696de4f89ff61f288309903d8fa299d017ed3d55618cdc399a9afd07000899a29e338de98c91
__sfx__
f8d8bbee2c3692415a047281723f3f5353051130779002171310b0150c234550e45f1167f1e54f384623c4310d56d321341037f1b17d084722c7191846d06022136652760d235262b606240663f7080640e0b00b
c0812f5f2100f167643d5340d6170634d2d1321442d3453a0e42a155250e64c1802d2f25b223752102a2e36f1f531322062860a0c34b0913e3851a1f775125650d16f2f7650517f0740d24553356372b4663b640
dee231733d2162a63f2143c2b060327692926c0f1480e00130720203632521a0f5200856d146413b75102361296520175b0c57c3c67d325572c7683e16a260071a674071560137d1315b2053d395793077108641
6092d073004550220a2c64f0267f2702d343683f3681f745380241b441324072a640197250f55b2c71d1f3472a2031562409470237570e6082c2583c10f0b7120873b241630854a2726f3634f1c46e074122535b
940a6c7e1c71f166252105e1e6342e51e0b4770323c2d32a041012b34c2604a2340f1f54a2452c1b0090c133131303d77e371140b11d24052102632a1481932200036267103f6512d633136323757f1d20607776
bcd7f3e41a62c2620501646061483f57037003096653647e035522c7711073c1944425462122181430d052462865a372553c7310c03e1f2353541528745225552c5320e0331e5662a0743436f1f3242f47d31064
c190f7da22603217291253432378375090b31031439147443b77a0d7512e14b3f233314183b16618656206770727d3f30e3f47b0855e3d7320e33b2d5243265a027772666c281373a6210206f156262f7450c04d
1f1452002a115316500a0663970d3554e027491a5543624f1e764255323032e06121152271c12431115287162746d1511e0e319285783e2123a7570450220467217000201b3967f0826a1a2593f453346750c31f
15fc5822255470d0612075238008067151e0713d67d0b4453123e381431f1110167807233215131901810035074341966e3217f1b1502567c2727f01664196693b1242421f186220b1733230f0c14f1f26f07464
b104a597020052652238777075263c5751b4143963c2a47a3004c3c475195482f1532c133351233366a193333f37e3c44e3f7171a5411437d0475000445374273815028068305563d12e0521d092710c27b00034
43c153e71f31c185153f07e0856b2611838224166552a05e3307f07758064152673f064423f7210c1512850a3d77f32705184753e2171d25b2f15e3e7592f37b2e3571e21d213691142d3835d3000b1107f23612
92df78a72746f167081917f03046080162371f285481c375387202476b190013f306104083e7731360e1e63a247461e5481d27d3d7500101d1f54b27257247782131a197071001f3f577013170f253097010631f
24cd2dc031271210250e3481031e1e412134262366a3522f1d13c3f6160b36f1a27f0f3593f7501a25f0b4722033e303411405a2f108311471b472333032a46a377190e62a103021505c2a43e314222730629546
93995df03f56b15510353393e67b385781d306344211b5190551e3b2352b0083906f076750647c0f6071f27c3f76d07125276043421d0526a3447a3e0430465e332413860001660290591f45f2073a3102d1437f
26487877240212073a30330071321b0190c06437429155032442b2f634306373130d010300b542227730d1601b46211459201492d31b287192a664320792967f2312a0874f2f451355311b46e125433b6721834f
7284a779092532544e226401053e1762b29477056062b76d1966e1c40c3a6230b17d2934c1c32b302333877c2c05f0867e2c0080f1400e4222474f221441c7043614f0e761075303174a067263a34e1520d0c723
1b73e672003143f52f007361d3160143f3d07b371430c36a3f7122a7600d00c3b2063b731166393143534017366511c7630c12f1634d0757f374660840f1f40c19553216023d51a3c33419645231403a46019270
ffa68aff1336f3c733036763f76b3b5570b2613e1742f2083b34d3c3000c22d3f7583666f27116096612847b3e7213a1283e31129642387421122f1c2013b67e1172f1b36c205673e728110440570c3f41a3a719
17422d5d3057e1125c3b25c0f43f3e2311d04f266100a501226163c0081636e0f40e3f51b397140054b313102a51b33206043790f0311c63715601084282e3750801c3d4300a2550b57d131172e4701b2061333a
78da47ec3c2740c1743341f3953c3560c1d330136273e06c0217d0b26d0706d3975a355423f0073d7373e0022f714382073f44d38676311713e70d370263351f2f5140841f0147f170253b64f3e6123976919278
fbf5ff243d021087180340c3c55326455267340d569280303467f0b06f3f0000f637011772576b151471a24f3362b2534913567263522b3381c5252c4521441e053241757a1e5223c7351840f09044307431e452
f117b06d0521a190231b76f34752173792906a1745c3f144030712d0201b16a3477a10476365491151f0c4491e62b084702e3280663b3f1471762c026153625b284360216d0d72e3274c3824f2c2210d73d23203
704416ef1f6052060f3975a0c77b3f52e296303c34f12126386601d44f156672b1613341e16366122793a140163642977e0c6040720f3e7201957a0804c0e2513903a0d102386760c6020d2592f7730461910123
8162122a0033822417304273f216222060532f0e45938431307751864a077380b47d3e53e33018150213e47d3e7492d566350631b27b0c57c3b7561262a2176e1702d1e7583866e2f644101303e0270423627059
28f448d01c02a224190907a3e45326550052670c35f3100c094243627b2b2021e6653120b0821730765177550e3762d23f235331d74a026470133004241052070314627413391470816e116371a21e355383f234
4cae5e3f0d360057761f5052f6252c0252e13928614252263e6591a136217563450d3d33109055086310175f141680345f096270f20a3923c2f6100967b09748042002e66f1355f3f309246490d563160611a179
ef7df7f5205041c27732260070642c17a337030f24e1c64033774176143f1733d74523221234173a47b3160f1573d123100076a2d13539173211131336f263540825a2f75b3e00215626003732a1401317926148
b8b0b7092641a2110e2e7372567f362070216d2105500168364100f34a3365d165741036d3b16a046323e441071710970807338215253702d0d72c3022f3b004267252f0101740a2745f2c07b115323a33021771
1d836d4019165257290a74f24705080191f7472777f012472976e0d4753c564051061657007651016202313a1054f290271e0781e3370b4530f17e1b61e2f1003e44d3702c2943432031263301a650152022f138
3efc26a026144261711c5330410808011227031454b1147e1074c3d77b2a3203d66c144061964c3274c3e43b017130403d3d0532c13f3f7141043605139133681d12b092420552f1e54f3835c2c2201110008634
f189c0fb270472d602363263803d3e74f333010721e011532f2573f50f1803b237063813b0870e0776a111100373f183653a2201363e2d00c2c57c090410162504417081672202713317353462e42b081782a168
433a791a3d4283377f2d64f013233e03f22142203211620529214041051f1113876b2f54d00676003502372f210683e0253213315673000600062e2b06a3a76d3c5663f0602c70d0d0001240e3f7383064104250
09f6270a3a14c167002601031307143363540c3904e3a1130d302175513f72e3930126704305432b1710d262182691b50e0b66c277760b3203e13d2842322455263270177f047711a2463c13b32727021143277d
5badf2333240f2f3273c143150162104222777062720c73c001503d4580601a3f217257112b103294023a338053580877e0d04f127322377f3b6042247e3814c0a148086213c5382a3480924d0057c1d01a1664f
8848e9382333b0455f1525835138040211d7490101e266730b6682a1013873f01450261031e734086661105b1d058251401830e3434214430000760867f0106f1036001238085162a37c114142361c2107a38004
f54e651514477214043361c027233f162241070e23a0a51f2f06e157703977c0c67f3e30d2e60811769216733e143255422a65a2661e2f1002457e0b71d0375a2a72c244111d4271f7361404f0b77e3e26812006
524ee2171e7601211e3611d0247b062050d77f0e2082e16c1704d2d6481d046247513a515375092716f04547331353133d163531b65b2c3652275034228005391857e3e72d1757d3c3662d35a3d0010715906215
828108620f3420617b1430a26361283683837818031017132461d197740335f2e6301f0340b1760825e095133e61c2843002106165670714c0747f1604434361084201e01d2a1610933a032720064c3a05720702
aec9bfd5020440d32d3944324153201683f1251657d0b74f1f07912010381620202f000302d10a3140f1f60a1c00c214363321a1c03e036183b7371b0001f36f1512e3f431303720222c2c365131301b52f1140b
8735f02339073141283175d1f35c2234f3316736200230371456f0f1200b745033042043c072112f55a1a00f1906b185713d57b1725108336330490b26a2f6453552e237121f6562b26c197281d5230303727750
bade24c93047f1f3281c271235630f52c2d30237516064610c70e270593e55d3506c036071a20d1723021305193071963720424380100534400111307000714b274660b301124200f40c261520c5270426802010
ad1b21c91c556103713045924133066582c16f25037206371230b3d6313141f1725a221093a5571e37b3b3762476b2842e0600c3e13c0734f1e76c0060623608386123712b0366e3545e350493535e111463e350
13186be81347604168067330330f2134e1b50a111613c17f0223d1a476070321f6781922a3f7763f21a383782b20f3732d34376382300301e260481d3182a7132701f1f16c3c0473657e271253677f0241d3873d
5f264ad13a2053a04f0356b065080325f391020b5701400e202760807d120012035f194220506e230000445e072091d6613a2111c310285760a64f3f50418771121502312e014011d0083e76d0516f2717211037
5ed46599276363b10d1773f2e752292690223b2f3142475b0c2231e75a3757b0a3211b01d213133137f3810e1944a2f4180f00d2914d134280e67b340231977f303080e37f1e1610f414021503a5613e05000025
ca23c89d315112f30a22432115093946b0a5342f61b2a639301752647c1800f213001643d102002a13b04223017733c54c2a7043350c2f6510063f2a0360734f3667c2f2772324713548380033c1542641212712
6ed6c6732102f032182b63e090690d03f3f147081422057f2760219050357133902c0840a392541c134253670020e2f00a0161429363122401263c0b0733823b1d6261637415770057431522930307123681625e
9f2b2f091f72f1b36c3273a0473b314442b1492741c3c7441a22c125150543a3d32f3330e00047260121f61829638364603d27f1c1393e5422914a3931c010302c6722a3303a76e2127118151397710674233232
47907bb71035e3b710083672a23c1f15a2d5770701c3d41c3147f241280a12d0f66f292320b3651e7101032b346003b04f3017e254750513f2a7330174d2a677012412d530113513835c14778271532830f2d777
0733a7a12d3003813c3274134259013713d01323014243200c67b1e63303028060223857b1074b045081042b194220e7791d5663177b2f76d3a611264710d70800323011073435a05063290280476c175043567d
e2f5eb8d3c5000b001114791235b0077c1f57f0650405224200550941921041374253f30e012373067f3b168364450f2351e6643956736274314123374111008020473277e38125064341f55e3d47e1f47133165
ff5f40c3316393410f2c2541f565021310e7182d40f0e420394503a43034016330181c4650643a32354192640671b2c47d1c01519578283450f2001137b1d60209726182710e4712620e085302877e0f0043a11c
56239b40293300e04901143106443f338266770a1082025f3046e0a3493950e1d044097002e52720277277433b772242503650f2a11e067020322514014177090a54b0a267356672e3470d450091402977b33133
82e68f1f00625086082716a1e7683677f331721b60e2c4661c7010b000007510b56924661057260165e1052f10033186262517b307442f7471145b2f22f065333716f221331f55d3417e2f112207491760f1a463
5cc862023f3540f32e1370a2874b2b56d0267e3961b0040e27573273390f446217701502b294780307a015442302e3753f0f51230425050242d10b035370722b0706b3a5300127b3b511132000162c214711e615
f655c8a63d60d114461b365347603826b0067f0311f1252b0803a1560b202100f7060b30d02540326080e418186633c721325122c44e0554c1220b064003b04212124350240e3560a10f330293b063005352b66d
40f547443d616060452d4131f2431200b0133b3717b321682c7212714c173420b40805347170682c42c251033d7040214f1567b02063046283c576147552717f3c17c3127c1527f13332026073417f0412b3435c
e1c024d83510b0b0682176d3d7191d73002378084400c33d033111a1110771f3e13623041091613a76e2872636126060040d7000b24c0315709669030591545e314462e32b1f2632a45e0130e0e4060301913210
bbac8dc407531162452f130026121f2530412a156073c2442f11f35659084762715f1416c0756517132016072064d0b424300013a13a3e5083f051102000466f2514a3026f166441656b0d217096021f4571d56c
3c600bcc0665a2236d390150b1101c33b1f15b1010f1761e1466e175622150d1f46015756291303c5642f47d311471c06c3e5490c37a14571141272a34c1d0522c1583a610192300906d1a4133d4363c27322013
eb22a08c1016f264350907d1053c0332e0c71f2d34707240125262c471100330625f12304250020e41b0655f1d6122421812365296430e14c0c02b1f4390e30c39131227661b03f244001f6623c33c1420728725
bc3d991e22302387092f47b0b66f1047e2b0302a17c393360a1041936f20545024080173d145773407f134510f3660b00f181401307525662140701734f3770f3a70a0b5133c2092101b2f3652c23f1f71825774
c811b1e53f0203d0393800f25429232533c74a1e61e10375203581f00f0374b1b110304760642b264570933c034453c70a105020c66d142112250d3f0183914b0b6612a1632b76f0a17f2a62e2b34e0854012148
c385b0342130d09254374030842c2046006459186203a1111f71618047063591b5043757c3b3472c15c380293c736025510904a2f12125305337371c16126224085062214f1b6422b141072193205c2d36819763
__music__
0b 723e2676
0d 1a126a7d
03 76373f63
07 726f5e17
09 2f105d2b
0a 3b4f7e5e
0b 13000c04
00 60603a3f
0b 476d596f
00 1e74430c
00 34656664
00 3a046904
05 373d1874
02 47435a60
02 30042062
04 682b3f08
0d 494d677f
0f 58794f0c
07 527b7050
00 5f7c0e0f
00 222f2151
04 2c5c7f2f
02 767d4511
0d 223c056c
02 44667c24
05 7e436b2c
0e 61481c41
0a 48760a5a
07 3a695877
0c 634d1872
0f 10502f11
0e 027b1f32
02 6d31061b
0f 440d6153
00 362b475e
0c 40151a5c
06 2b781c02
03 594f5865
06 4243560f
00 51711f24
0a 393f5077
02 55170e54
06 115a5e45
08 001e4c63
0d 38080a7f
0a 5e394d44
02 32683f63
01 744e7c7b
06 53233c08
0f 253e3604
00 1a7f6b06
04 094a5e3d
00 6c586f5f
07 3f4f6625
07 3c2b3319
00 470d010e
0b 4621703b
03 220c5643
0c 181b4e25
0e 3e1f056d
02 047e2b50
0f 7f10006e
0e 17144933
04 2b77417b
