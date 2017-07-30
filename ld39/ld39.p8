pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
--  ld39 toy project
--  copyright (c) 2017 sam hocevar <sam@hocevar.net>
image_list = {
  { file="data/background.png", w=128, h=96, tolerance=62200, scroll=true },
  { file="data/owl-indexed.png", w=512, h=88, tolerance=10000 },
  { file="data/owl-power.png", w=512, h=120, tolerance=200000 },
  { file="data/water-transposed.png", w=1920, h=32, tolerance=2000, scroll=true },
  { file="data/mountains.png", w=288, h=48, tolerance=2000, scroll=true },
  { file="data/trees.png", w=400, h=128, tolerance=60000, scroll=true },
}
background = image_list[1]
water = image_list[4]
mountains = image_list[5]
trees = image_list[6]
facts = {}
global_rom = {
[0]=
0x54ea.d499,0x96be.49fb,0x2236.41f3,0x6aa5.88b6,0x5a67.5ca8,0xa2bd.013b,
0x7d0e.1231,0xa0f9.cb08,0x49f7.4443,0x4cd9.e533,0xdf74.4af5,0x750b.e81f,
0x98c9.f05a,0x570b.4aed,0x3383.12c7,0xc2f0.8716,0xd18e.44b,0xab15.f869,
0xa6f7.fd23,0x482c.8991,0x97d7.792c,0x8530.a793,0xfa49.2429,0xbfaf.fd79,
0xc72f.07d3,0x1083.f37d,0x4c7e.60f2,0xa427.c67c,0xe3f3.641f,0xdc7f.73e2,
0x3a41.fb17,0x6eff.3f3f,0x66c7.57bc,0x3859.006c,0x99f0.e07a,0x74a2.6b1f,
0x59c2.426c,0xe7e6.7402,0xc1e7.c6c7,0xe806.2fb8,0xa473.b03c,0x38fc.ce84,
0x2109.9276,0xd1e8.3669,0x5820.f03e,0x33e3.3efc,0xca64.1e86,0x633a.fbd8,
0x692c.f23a,0xf804.f8b8,0x3753.6308,0x83d1.a889,0x1079.d191,0x5260.fe2e,
0xf25.de7c,0x3cb0.891a,0x4e1f.acf3,0x664c.6484,0xf1b1.f9f1,0xdccb.cd11,
0xec67.6cbb,0xa8d0.32c8,0xb8bd.14e1,0x863a.4cb8,0xe167.0add,0xa1ab.405d,
0xe931.cc8e,0x5786.90c1,0x3a4f.c7c4,0x1ef3.3e32,0xa9df.b35,0xebf.7323,
0x169.b169,0x39cf.d49f,0x579b.c1aa,0x89ba.4803,0xbf7.0dee,0xf3f7.de8f,
0x1440.ad0c,0xdd07.d3d2,0xc35d.08a8,0x3b83.c06b,0xcbfe.e7c,0xbc21.9bc2,
0xfd96.4954,0xe802.e839,0xf009.8d3b,0xeb28.6779,0x1c10.cf87,0x35de.77d2,
0x6d0c.f88a,0xb26e.186,0x7c58.e85e,0x2fb4.c1e,0x749d.e497,0x5cb2.109e,
0xf99f.161f,0x8deb.34f9,0xa665.d00e,0x2464.7acc,0x7dcf.8869,0xfae5.8f96,
0xd4f4.f8f,0x5bc7.9a1d,0x6a67.a35e,0x1f1c.a0f5,0x690.cf3b,0xa9e8.96ef,
0x478f.843b,0x593e.1df7,0x65e6.3916,0xcae.7a2e,0xba15.219f,0x9f00.733f,
0x5295.742e,0x3e13.fd9f,0x1283.e4fa,0xe854.867c,0xba34.f881,0x38f1.b0ae,
0x299a.1265,0x6a5c.0c25,0xa5d.3e17,0xcf87.8e94,0x804b.92bb,0xd94.c35,
0x8c05.3094,0xa8a7.c6ec,0x4d4b.f74,0x653e.2075,0x9bbd.8b,0x2cbc.f8b7,
0xb9c0.1c46,0xca2f.c57,0x95d.e0ce,0xb995.fd42,0xb5e3.bc07,0xa7c.59de,
0xac5.b933,0x8949.7ab4,0xa846.ee0b,0x1d.1857,0xff46.56b2,0x81fb.8153,
0xb284.14db,0xac97.c507,0xfa46.5378,0xac13.d80e,0x35d2.0ef5,0x9f1f.7137,
0x2fd2.f0ca,0x4933.8efa,0xf023.5ef7,0x13a1.e31f,0x8392.0342,0x822f.b512,
0xa338.1748,0x177b.bfd8,0xe05d.fa28,0x2658.6ef3,0xc7c5.3a33,0x32c6.d0ad,
0x57a1.71af,0xea11.e5a6,0x107d.8699,0x456b.d978,0x131f.59a3,0x8062.f5de,
0x8a8f.fc7a,0xf50.280e,0xb743.bc06,0x99d1.b1f1,0x9c14.e3ef,0x17d3.18db,
0x9d7d.004e,0x4e7d.d142,0x375f.0a61,0xf732.b0f8,0xb3de.e56c,0xc7dc.4f27,
0xb333.0733,0x71ff.964f,0x9f71.2679,0x256f.78b3,0x644c.5279,0xb4bc.708a,
0xe2ef.0732,0x9af8.cf04,0xd2e3.fc1b,0x953d.2c3f,0xcd06.cfcb,0x8c79.d6e2,
0x777e.0af,0x10d6.673f,0xcc6c.2b1e,0x6603.68c,0xf251.b47d,0xfeb2.3d3e,
0x7a3a.1e18,0x723f.cf44,0x7fe1.6c33,0x978e.b68f,0xe040.868e,0xa302.06d5,
0xd70d.d4f2,0xe07e.1eff,0x83c7.a3cf,0x6762.40c9,0xb068.031d,0x270.0b35,
0x789f.705c,0x4f12.7dd7,0xdb37.377e,0xdd60.4dcd,0xcdcd.f01c,0x9c9e.8f7,
0x9e56.37a5,0xcb7b.813d,0xeb9e.9628,0xfee7.bd3f,0x7a3d.4f73,0x73fe.ec79,
0xccd1.22dc,0x60f7.eac1,0xf7a9.a01a,0xd590.1efb,0xeb33.980e,0xe5fa.4cc,
0x2a2c.4bf7,0x1c63.f5e,0xa28e.bd94,0x6c89.425a,0x4610.4fc1,0x73f2.86b2,
0xeb37.2da3,0xe1a5.cf71,0x2722.d065,0x2707.4dbc,0xe3ba.fcf,0xe4cd.31e2,
0x279.3a7e,0x6142.9af4,0x979.609d,0x999.9cf4,0xcbdb.e113,0x7e09.e778,
0xb175.cc02,0x8151.2133,0x2c9d.8089,0x8e27.3ce3,0x7178.279b,0x667b.c7b9,
0xecf9.fc02,0x47fd.d708,0xba2e.1e7c,0xcb75.1c19,0x2ba7.d828,0x64be.9828,
0xa86c.6938,0x3cb1.2c29,0xca2.9e8e,0x723d.fe8e,0x14b4.0664,0xadd1.bb58,
0xa81d.60e8,0xd059.c8cc,0x77c.0de4,0xe0d9.a768,0x3ef5.5f4e,0x4d7.59a6,
0x9223.ae6,0x84e9.4921,0x5f55.e1b4,0x27fe.803a,0xbbcc.0b64,0x780c.b37b,
0xee46.5979,0xbc4b.196e,0x47a3.3d19,0x4ea3.dc4e,0x9613.663d,0xa565.c823,
0xd0cc.0a2f,0x155e.13b9,0xe091.47e8,0x5a00.84ec,0x2dd.3f59,0x1542.3c79,
0x7d88.2902,0x3696.4ca,0x19ad.f7e8,0x895a.d3e6,0xc384.71e3,0x8fc2.a4a3,
0x44c8.bc49,0x4cd.f054,0xed42.bdef,0xce4f.ee39,0xc47e.bc3a,0x7bd.ce3e,
0x4e40.82ff,0x2e5e.ec7,0x1e01.9671,0x1c46.678e,0x34a1.ebeb,0xeef8.414,
0xaed9.12d3,0x9ea9.e827,0xf3c1.2d81,0xeec3.e3df,0x3af0.13f1,0xc0a8.90df,
0xa113.fa62,0xf0b1.cdb3,0x25f0.9067,0xeb59.c198,0x8061.3209,0xad35.d03c,
0xff93.7a91,0x2124.f507,0x5b98.ec5,0x97ae.e643,0x385e.eebc,0x4479.0306,
0x1e19.839c,0xdb0f.91ad,0x8157.4c7a,0x9416.32fa,0xcac2.73e3,0x3d3c.ef4,
0xeadc.ab56,0x6d98.451f,0xf8b2.cffc,0x9581.67ab,0xa128.3848,0xa3d.04e3,
0x8cf0.814e,0x2b8.e304,0xbbc9.cc93,0x271d.0327,0xff20.3ac,0x33d5.bd08,
0xe730.2d08,0x1fb1.a19c,0x6424.3603,0x4af.223f,0x858.48e2,0x6374.eb33,
0x78f0.47ab,0xb30c.518a,0x2636.2392,0x6888.3732,0x3c41.1c1,0x6bc.e847,
0xc6f1.e3c9,0x6409.8531,0x808.93bb,0xcd84.8ff9,0xb27c.786,0x3660.d224,
0xb212.38a2,0xf20f.3413,0x514a.f748,0x8ce.8a79,0xff9f.fa42,0x1660.ad01,
0x1ec0.2572,0x3b9a.395e,0x9850.c142,0x810.241f,0xa40f.281c,0x7385.08e5,
0x450c.c882,0x1c82.5008,0xf0a6.c547,0x4720.f2c1,0x69e1.11c5,0xdb40.1469,
0x48fe.914,0x3c51.81cf,0x4083.8342,0xff93.ef8e,0x801f.c303,0x49b4.ce09,
0x9b31.1d44,0xc2a2.86d6,0x6ccb.8799,0xa4b4.4e7c,0x1d8f.9459,0xaf4e.384f,
0x7b8f.4697,0xc7b5.e609,0x60b0.48cf,0xe419.705f,0xb2c9.0907,0xde8e.0864,
0xc151.837b,0x83b8.0e28,0x1e95.2124,0x71e4.1c56,0x892c.6838,0x4c77.30ad,
0x11ea.5d8,0xfa63.1f94,0xf782.08f4,0x118d.3c92,0x6940.0403,0x3a59.df2b,
0x4ee8.afee,0xbb20.2031,0x909e.9f37,0x180d.3b49,0x4008.36ca,0xe087.29c5,
0x43d.8a2c,0x1c32.97b1,0xafe5.cc8e,0x8087.4fc3,0x9039.9233,0x1ee7.492,
0x2ca7.f185,0xba6d.4851,0xcf0b.6573,0x82c2.873,0x30e5.4003,0xdcac.2534,
0xa066.5ceb,0x2e34.8e64,0xe5cb.e23f,0x834.0aee,0x8916.7216,0x83cc.05ee,
0x80d.b373,0xe4c3.e4ef,0xfe2c.20c7,0x2847.57cf,0x1030.47f8,0x83a5.87fc,
0x638c.f1c4,0xa362.7ff6,0x9ee9.7c9,0x7f72.9b37,0x50a9.1723,0xd274.4c71,
0x7318.14e,0x8963.99d4,0x35fd.3343,0x151c.18fd,0x32cb.c9a6,0x3d09.2955,
0x12f2.004b,0x9990.244b,0x5d00.160d,0x717.c47d,0x2758.9be6,0x872.c824,
0x1b10.60e,0x8d26.aca8,0xf83a.f3ed,0x954c.2dcc,0x513a.63d1,0xa78d.4796,
0x4678.b0bd,0xcef2.5bbc,0xc617.1d49,0xf731.ba14,0x7fb.b7a4,0x8190.9327,
0xf80.e25,0x767a.b7a3,0x9c8.f1c4,0x3c5f.b663,0xba9.8a7b,0x112c.0b44,
0xf17d.a1ee,0x7bc.a0bd,0xd3bb.8f7a,0xeeb6.a7de,0xbd96.e4e,0x19ab.7894,
0xf69f.774e,0xce89.e14,0x90cf.25b4,0xb207.5bdb,0x868e.60c,0x6509.c892,
0x8214.5bb3,0xd6a6.955e,0x99a9.484,0xc830.b0ae,0xf59c.bd21,0xe892.c6d5,
0xaf4b.18b7,0x112b.1df5,0xcfaf.1987,0x586c.102b,0xa174.9caa,0x913.0c95,
0x949a.c4e6,0xae92.b3e9,0x9906.3f3b,0x4624.d967,0x63d8.ae18,0x38b1.2ffe,
0x884b.802,0xa74a.c3ee,0xac3f.8cb1,0xb4e0.da8c,0x4fb5.09f8,0x9c6e.6df8,
0x7923.260c,0xef89.23fc,0x57f7.9ae5,0xef4.1bf4,0x1f1e.05c,0x248b.a777,
0x894b.f10a,0xa780.fe29,0x6696.bfe,0x5cf4.7629,0xffb3.e9f8,0x5c9f.0734,
0xce36.385e,0xf9c0.2e61,0xf478.cc9a,0xecc0.c864,0x4adc.c05e,0xeb24.9bdd,
0x6824.9d0e,0xd81c.1971,0x506d.1e3a,0xe41a.c5c4,0xd454.e511,0x15cc.791d,
0x1564.cf49,0xc618.142d,0xfa63.c1c5,0xcc26.ba57,0xd1c7.105b,0x1360.917,
0x3928.5d32,0xf84f.848e,0x57b8.9213,0xb152.d38c,0x10e3.1196,0xbc5c.8577,
0xef09.2b37,0xf778.d712,0x3c07.d9fa,0x836c.4c73,0x6aa9.0e8,0x4270.c682,
0x8c1b.03a1,0xb87.e418,0xea94.b369,0xe638.889e,0xc939.2c12,0x985c.dd5c,
0x963c.15c5,0x2c0d.8e86,0xf7ff.a0fe,0x758f.eb58,0xc7bd.d696,0xb6f4.ffce,
0x28f6.f20f,0xc309.2597,0x583e.1c1b,0x1f64.9b1a,0x9107.f218,0x7ac0.a6e2,
0x1f9d.44ff,0x4054.00fc,0xda61.8e53,0x94ba.aee3,0x148a.29f3,0xb492.ee48,
0xb03d.c8af,0xb4ca.a323,0x4e17.b807,0xcc71.e88e,0x872c.a08d,0x3a86.637a,
0xe633.3852,0xa980.f05d,0x7d61.4aed,0x95d.169d,0x4ead.01e4,0x8bb.0098,
0x8e96.b034,0x1fae.a43c,0xb1f8.ef73,0x3dc8.bba6,0xadfa.5d13,0xc6f4.a58c,
0x2c7f.7653,0x957d.048f,0xa1ef.e288,0xb834.b149,0xa976.2d67,0x101f.484a,
0x1d1.36ff,0x5f48.a11e,0xcc82.c559,0x6df3.136a,0x528f.c392,0x6cb5.282b,
0x797a.fd3e,0xb816.d04f,0xfef2.8398,0xe0db.e619,0x486e.125c,0x9a97.0351,
0x98e8.83bd,0xadc2.7e5d,0x2a63.e3b4,0x46aa.e043,0xbfe1.ee24,0xf667.530c,
0x4903.cc56,0xf9fa.8ca3,0x7f8.7d9b,0x32a2.3c52,0xa03b.8966,0xd247.3268,
0x27b8.4a7c,0xc6c8.02ef,0x3a85.af2,0x153d.f542,0x25a8.9b3c,0xa84c.f8ea,
0xdc0d.40f2,0x176c.7bcd,0xfe24.4f27,0x7f71.f6aa,0x82bb.9fb7,0x1611.cb0e,
0xfdcd.d471,0x830c.31c5,0x33f2.8b91,0xcc23.9128,0xc544.b0b8,0xb80f.ac54,
0xad6c.30c5,0x87bb.c3a,0x1c02.8b6e,0xe3d7.344c,0x609c.c7ed,0xad00.6192,
0x4f32.b3dc,0xc1de.8dc,0x2caa.29fc,0xf9d1.ec75,0x8142.5a3d,0x208f.488,
0xb848.a016,0x6d1f.f8a7,0x9b35.ee98,0xe9a9.f6f4,0x6621.9547,0x4cd3.7de,
0x1083.8c6c,0x37b9.529e,0x4247.9057,0x915d.ef1c,0xf32.5de2,0xc831.ea16,
0xe64.e662,0x974c.2552,0x6e2.fb2,0xbd62.e6,0x6835.c201,0xd7f6.32c,
0xd600.27b9,0xd97a.a035,0x9d7c.caa2,0x76e7.730b,0x53c1.2058,0x840c.7d7d,
0xca63.a38f,0xdfa0.9eb2,0x29f.de73,0x34d.16f2,0xdfd2.0f8d,0xfd6b.4747,
0x4f4f.1f9a,0x6c1.e2a8,0xe619.26cd,0xb5c3.7912,0xc2c.3dfe,0xff0.c7d7,
0x3190.2328,0x3db8.5257,0x9a77.dbed,0xcaee.a65d,0xba6d.33c9,0xb341.cdcc,
0x7e83.df43,0x12da.3de3,0xf59d.e999,0xa019.38ae,0x1c4a.9235,0x6f06.0d61,
0x938.0325,0xb61c.55,0x16c0.670c,0x8e24.c2dd,0x1814.9a51,0x4b91.a823,
0xe886.e3c5,0xe9de.f0b2,0x3a94.23d5,0x357b.d2b6,0x7036.c0b1,0x2bd5.d3c3,
0x63ac.fb58,0x9c2.dee,0x1600.7efe,0x60b5.ade,0x766a.a4c3,0xcacb.37b6,
0xe578.f8e,0x963f.ea1e,0x619c.922f,0x1e89.2e9d,0x72cd.f42d,0x6194.5658,
0xf403.5ce3,0xf049.c05b,0x5a9c.734c,0x918b.ed3c,0x11d2.d673,0x25ae.9601,
0x9047.a7ec,0xe131.b607,0x368b.9c5d,0x32d8.b767,0xad8e.948e,0xaffc.9ca7,
0x2916.4df5,0x54c2.de65,0x4833.724c,0x9607.d6c9,0x8b39.b82e,0xddac.d0d9,
0xe81.1a79,0xb9ec.2fe4,0x6305.c452,0x998b.423f,0x423e.b563,0x99c6.a832,
0xf134.d419,0xe2e2.0a,0xe722.8405,0xcdd6.9d12,0x498.79f5,0x1cf9.85c2,
0xafce.0fc7,0x7bc1.b592,0x300b.3cd6,0x47ab.f1f,0xc38a.54c7,0xcde2.6b7e,
0x7b4f.f903,0xfb4.2e53,0xcbca.6a2d,0xad0b.3f7,0xd466.e06a,0x4e34.b6a6,
0x8f2f.1392,0x81db.1ee5,0x8c81.a63d,0x824a.0458,0x42a.3598,0x9ccb.e3db,
0x253b.0d88,0x326c.d99a,0x900c.124,0x76e9.6914,0x7b82.06a4,0x7c8.e0af,
0xdd3d.21ef,0xfaff.36c2,0x5c34.92d1,0x869b.9058,0xa42c.d80e,0x3a68.6b64,
0x3741.8a28,0xa0bd.287f,0xbb7.ae06,0xa950.96ee,0x2bba.cc3e,0xb70e.63f,
0x86b0.4e9d,0x31ce.8111,0x1663.f09d,0x93b3.ccc3,0x92b5.ba51,0x4ccb.ad1c,
0x7d7d.61fd,0xb3bb.1c03,0x358b.b40a,0x4472.29ee,0x902c.1f5d,0xeb57.f5f5,
0x4706.d709,0xd671.dfc6,0x1e3f.c47c,0xf055.f51d,0x5e1c.d82e,0xbdf8.f874,
0x4673.2793,0x3aa.782,0x5bcc.ba98,0x3826.8385,0xcf3e.263e,0x13c5.0d9a,
0xfe1c.c14f,0x64e4.d17,0x147.e6d,0x789a.f346,0xacf7.042a,0xd93b.915f,
0x73ac.8162,0x2b88.3d8d,0x4475.9bb8,0xb0ad.a76d,0x9157.8046,0xc4a3.9bab,
0x1ca7.0123,0xc686.bc23,0x162e.39c,0x3e20.2812,0x34b4.b24f,0x86a4.3c84,
0x8fa.f174,0x2ce6.fe7d,0xc19a.2faf,0x246e.7151,0xc44c.e032,0x8496.1d9,
0x7990.6f8e,0x8ac7.e3a,0xb489.ba8d,0x1e58.3161,0xbf4f.b8af,0x46bf.ea09,
0xfc5c.43bd,0x7122.49f1,0xa071.0c68,0x1e3a.5a9b,0xffae.7896,0x9463.bfe4,
0xcadf.13c7,0x980c.ff72,0x96f3.b701,0x769f.718e,0xbc0f.6a53,0xc24c.7c73,
0x5d1.4d1c,0x912d.b02,0x4002.1f4f,0x71d0.141e,0x4b0e.0bdb,0xee08.3489,
0x3725.e40f,0x27b0.8e9c,0x1ba5.b5b,0x8ee3.b8ad,0x258d.1f33,0x6b61.400f,
0xb878.e369,0x3ee4.421d,0xb26f.9c6f,0xa035.3658,0x2038.994,0xc005.3b02,
0x5624.741,0x470.6fc1,0x8719.8b42,0x8e11.4c0c,0x2106.3e87,0x6c74.71bb,
0x149c.836a,0xef3a.54ca,0x8780.6683,0x6260.b7c1,0x6121.198a,0x46e3.c782,
0x113d.9dcc,0xf8b.6c74,0x7ada.f451,0x18c0.b009,0x9a21.65cc,0x8a36.26c6,
0xf2c9.50e8,0x3ec.2193,0x4078.85da,0x682.c134,0xd89d.828c,0xedf9.d037,
0x296.4e5f,0xb8cb.e9d4,0xc1a3.dcff,0xc1d4.05de,0x3a93.c622,0xfad1.d6cb,
0x835a.2512,0xf9d0.854f,0x478b.b61e,0xad5e.3114,0x81b6.9a4b,0x4448.d1e5,
0xad71.a12c,0xff3.5963,0x699.7afd,0x2ab9.8b5,0x7888.d3e4,0xa27f.11dc,
0xb0cd.066c,0xdeef.74b1,0xf445.c25c,0xd17b.74b2,0xcbd4.50e4,0x95f2.46a3,
0x9f2b.7744,0x239b.0f2d,0x8a7a.c3a3,0xf6fc.3405,0xac6e.31ef,0x8a05.e9d3,
0x2d5.fd24,0xbf81.d00f,0x58d.b84a,0x4c2b.c2a5,0x8064.c011,0x2358.a0a9,
0x8bde.2cf8,0x68f5.7f61,0x61ab.a069,0x2fa9.d2,0x9ea.beab,0xd71c.09d9,
0x11b8.e219,0x5ba8.a636,0x1969.4275,0xcd90.6c1c,0xcf77.682c,0x609a.928c,
0x11a3.1873,0xd9f0.2cd6,0x2a2.5cf7,0xd33a.1106,0xe511.ceb1,0x8df8.8491,
0xfd82.1641,0x6900.ac3b,0x3429.e9cf,0xef51.5fc4,0x8874.f51b,0x5021.31e3,
0x9305.b94d,0xc771.afad,0x157.387e,0x1fef.d23e,0x155a.51ff,0x7d27.9b2,
0x2e0a.bb5a,0x23a7.604a,0xe72.7aa1,0x5420.f8fb,0x77ba.3bda,0xe572.5a34,
0x6412.1cac,0xd8c8.095,0xd561.ede,0xdc68.78d2,0xac51.61d9,0x160b.c30f,
0x19f.11e7,0xc479.334,0x11fe.ef8e,0x1ada.e69d,0x24ac.8a2d,0xad1f.9a5c,
0x9878.9351,0x4502.de9d,0xf1d4.1ab3,0x337.c0e8,0x9b94.797b,0x3a91.5b72,
0x5227.47bb,0x63ad.821e,0x3c1c.7dcf,0x1968.b04e,0xfe04.55f9,0xc09d.008e,
0x581d.1542,0x21ed.6211,0x8d4d.91fd,0x734b.9c1f,0xac39.1fa,0x69ba.2223,
0x56.7a3b,0x1e48.afe7,0xb50d.c75c,0x2274.2928,0x8e5c.9074,0x3b3d.a84e,
0x625d.4726,0x2fca.4e36,0x3ead.4baf,0xa9e4.14d2,0x9ac7.4312,0x8e6f.92ef,
0x44d1.c789,0x1908.4874,0x9e44.d5be,0x7a87.fa8,0x10aa.10a,0xcae3.1f76,
0x66ef.a4e3,0xd7b7.80c9,0x6ccf.a828,0x3907.4c8e,0xfe08.1625,0x4c79.64e4,
0x9cec.5c3a,0x676d.0e8,0xcb87.348d,0xd856.e7b5,0xe46d.104,0x8630.1326,
0xe30c.f295,0xf698.d5ab,0x6aae.4081,0x1b09.dbcd,0x1c74.b8c6,0x9c66.aab9,
0xb5f5.e937,0x1.e471,0x7445.2ea9,0x5b1d.0118,0x74b8.c734,0xd8ef.9ee,
0x1902.a5aa,0x717c.0675,0x2263.cad3,0x8c79.0103,0x5f0c.53d6,0xa319.0367,
0x6d44.7679,0xdacf.dc7b,0xa45e.3db4,0xd9c4.6e63,0x13a3.8e9e,0x33ad.9006,
0x54d6.54e3,0xddb7.f3e3,0x378.2a58,0xbc47.18e9,0xc155.e7a3,0xc81a.6304,
0x416f.6e9c,0x8897.857e,0x2e0e.5982,0x8587.dd18,0x24ed.1023,0x1f15.0102,
0xa3b0.3ec7,0x31ee.15b8,0xe14c.4a6e,0xc768.fc1e,0x2126.8fd5,0x39b1.e403,
0x2644.3ca6,0x9bc9.be33,0x9e42.c59,0x9a48.6236,0xe88.3ccc,0xe471.8fb,
0x76e6.fb81,0x2e7c.17cf,0x5ae8.614a,0x4131.a3c8,0xa013.4576,0x410f.463c,
0x84f.dc73,0x6311.3ede,0xba75.1b9f,0xf43.cd09,0x1efa.8fa4,0x2205.43ca,
0x35ba.7cbc,0xd358.105e,0x104c.79d4,0x1e59.18f3,0x4ba3.f073,0xf96a.e31e,
0x5a4.5558,0x92c7.dc48,0xa27b.3a07,0x3e3d.bcc3,0x1e40.ef53,0xab87.d963,
0x9ac0.f9cb,0xcd8e.436d,0xe3c9.b9d3,0x31ab.ba39,0xe9ce.61e4,0xef8c.7dab,
0x9426.d674,0x4756.b487,0x40f7.537e,0x272b.3d36,0xf284.e9e1,0x4e31.e8a,
0xadf9.a57e,0x4e6.e717,0xb2.7931,0x374e.69b2,0xfe05.324c,0xcf89.35b6,
0x9b1e.5099,0xea3b.79b2,0x363e.de8b,0xabd8.26d7,0x61cc.9855,0x102e.4d6d,
0x4e93.642,0xe294.8cc7,0x3a52.6016,0xadc6.6736,0xf214.edd,0xee4c.7c73,
0x139b.1e42,0x7db7.43c9,0x63a3.264f,0xa6be.80a2,0x6440.b63,0x8cb2.7e53,
0x8772.7375,0x4099.39b5,0x64c9.a458,0x64e6.d085,0x9fd3.6b0e,0x1a77.1ac7,
0x4027.79f2,0x9d1c.04c7,0x7b93.1e58,0x9cd.2f2c,0x8c88.0a38,0x8fc7.36ff,
0xa9b2.0489,0x93a7.f915,0xc81d.dcc7,0x58bb.9363,0xc1a3.e373,0xac92.738e,
0xd26d.6666,0xac9b.2208,0x709f.f513,0xd862.0996,0x7d8.9dec,0x1c23.d715,
0x659d.2dd8,0x896c.797c,0x4112.4c75,0xda4d.5fd4,0x8420.9c1,0x3204.166d,
0xcf9e.eb56,0xe341.dd5d,0xd517.bc66,0x1ac3.895b,0x91dc.67d3,0x88d4.c63c,
0xecdc.2cf,0x3b32.5604,0x6116.7369,0x6b7d.12cc,0xb63.08ad,0xf4a2.7364,
0x31d4.c18c,0x981e.2da3,0x98f2.64c6,0x8c79.0bb9,0x8bb1.8b39,0x4f23.3fc2,
0x18f2.4775,0x496e.966f,0xd33c.8c08,0x91f4.060c,0x6699.2831,0x2d14.8174,
0x2a37.fec3,0x8875.e306,0x30f2.400b,0x5145.0cd3,0x1c70.696f,0x6b2a.4119,
0x2177.b39b,0x867a.5c1,0x170f.680f,0xef2a.b5dc,0x3f4f.cff5,0xa6bc.34fd,
0x39bb.be62,0xb498.81b1,0x7dd0.64c2,0xf834.afa1,0xecf0.f5c8,0xf3f7.a705,
0x4b4e.a4ec,0x33f2.97bf,0xfd73.70c,0x1bd6.b9b4,0x3f18.4136,0xf8ee.ad0d,
0x90f4.1907,0x7074.f8fc,0x3029.b16e,0x84fd.54c4,0x690c.d321,0xc91b.471f,
0xd642.c8cf,0xe9.f1ee,0x2890.cc79,0xdcce.1e7e,0x2448.36d,0x23f1.9665,
0x6d58.640a,0xe65a.dadf,0x784c.31af,0x62cb.ca84,0xb37b.e4d8,0x8465.6647,
0x3038.ac31,0x7fa7.b872,0x6c72.b2d6,0x66c8.d03a,0x6e9.d67e,0xf88a.00be,
0x6d90.9ad3,0x2c8.06e3,0xd3fe.b185,0x6051.f6b,0xb226.04e2,0xb863.2de9,
0x4bcf.3c69,0x7d33.f145,0xa758.c50c,0x4bd3.3f48,0xc763.1f62,0xd014.6c11,
0x2ce.43ca,0x5dc1.9efc,0x20c4.42bd,0x590c.894,0xf103.2bad,0xb204.498d,
0x7863.0a16,0x996.6c71,0x6f7b.67e3,0xe3d8.e2f,0x7a38.978,0xf28c.ad8,
0x864b.5aad,0x7108.659d,0xff4b.84fc,0x2cf7.ec84,0x39.44dc,0x5e1a.7f5b,
0x2f7.0d43,0x88b7.18fb,0x7a1c.db58,0xeb40.cf0a,0x4a2e.7eb3,0x5481.2863,
0xfccc.bdd4,0xbf86.8eac,0xd032.3e47,0x7c7.1cd2,0xc191.7306,0xe362.7e26,
0x3363.2c4a,0xe24c.39f8,0x54db.92cb,0xf993.f58f,0x80a3.4b63,0xca8.9ff3,
0x580f.9426,0x4df9.7bd9,0x3fcf.dbfb,0xe7e.30ab,0x893f.4162,0xe20f.3054,
0x2822.4039,0x48c7.9f92,0x7a51.717d,0xcdb1.67f5,0x591c.b57e,0x8e52.9ac,
0x8a5e.3142,0xab27.e40d,0x3756.7dec,0x195e.6d1a,0x79ee.cdcc,0x6fb4.7f36,
0x1b4e.340f,0x6284.5434,0xca5b.7e13,0xeb3e.b1fa,0xcc61.213f,0x6fff.272,
0xa333.5775,0xac73.bda5,0x408b.3f0b,0xb0ce.0667,0x8669.4e25,0x2deb.3818,
0xadd3.9363,0xef5.ed19,0x796e.f8ec,0xe80a.e873,0xc8a4.0823,0xc491.b5cd,
0x4f1.afa1,0x8644.81b3,0x9acf.c812,0x1eed.7ae4,0x6616.904e,0x1350.1d39,
0xfbf7.e19d,0x5c90.6d34,0x569b.57f1,0xbb19.3f18,0x8a1b.5999,0xfe45.5baf,
0xf25.8dad,0xd3f.116f,0x335a.ec9b,0x52d9.82e8,0xeb24.f869,0x2060.07ff,
0xa.d491,
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
  local data = src[flr(xoff % 2)]
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
    print('decompressing...')
    local tmp = inflate(rom)
    rom = nil
    local u32_offset = 0
    print('unpacking...')
    u32_to_memory(0x0000, tmp, 0x4300)
    u32_offset += 0x4300 / 4
    for i in all(image_list) do
      local u32_count = i.w / 8 * i.h
      local pixels = {}
      for n=0,u32_count-1 do pixels[n]=tmp[u32_offset+n] end
      i.data = { [0] = pixels, {} }
      u32_offset += u32_count
    end
  print('postprocessing...')
  for i in all(image_list) do
    if i.scroll then
      local data, w, h = i.data, i.w, i.h
      for n=0,#data[0]-1 do
        local off = n + 1
        if off % (w / 8) == 0 then off -= w / 8 end
        data[1][n] = band(shr(data[0][n],4),0xfff.ffff) + shl(data[0][off],28)
      end
    end
  end
end
scroll_mul = 0
owl_page = -1
owl_mode = 0
owl_x, owl_y = 10, 20
fly_cycle = 0
water_cycle = 0
function _update60()
  rnd()
  if (btn(0)) owl_x -= 0x2.2
  if (btn(1)) owl_x += 0x2.2
  if (btn(2)) owl_y -= 0x2.2
  if (btn(3)) owl_y += 0x2.2
  if btnp(5) then
    owl_mode = 1 - owl_mode
    owl_page = -1
  end
  scroll_mul = (scroll_mul + 0x.0018) % 4
  fly_cycle = (fly_cycle + 0x.07) % 1
  water_cycle = (water_cycle + 0x.03) % 1
end
function draw_world()
  local data = background.data
  local image_width = background.w
  local image_height = background.h
  local world_x = (image_width * scroll_mul * 4) % image_width
  local n=6
  local lines = flr(image_height/n)
  for i=0,n-1 do
    local srcwidth = image_width
    local dstwidth = 128
    local dst = 0x6000 + 64 * i * lines
    off_x = (flr(world_x * (2+2*abs(5-i)/n)) + image_width) % image_width
    off_y = i*lines
    blit_bigpic(lines, dst, dstwidth, data, srcwidth, off_x, off_y)
  end
end
function _draw()
  local frame, page, off_x
  cls(1)
  draw_world()
  palt(0,false)
  palt(8,true)
  off_x = water.w * scroll_mul * 0.5
  blit_bigpic(mountains.h, 0x0200, 0x80, mountains.data, mountains.w, off_x % mountains.w, 0)
  spr(16, 0, 60, 16, 6)
  palt()
  palt(0,false)
  palt(8,true)
  frame = flr(water_cycle % 1 * 12)
  off_x = water.w * (scroll_mul + frame * 5 % 12 / 12)
  blit_bigpic(water.h, 0x0200, 0x80, water.data, water.w, off_x % water.w, 0)
  spr(16, 0, 84, 16, 4)
  pal()
  local owl = image_list[2 + owl_mode]
  frame = flr(fly_cycle % 1 * 16)
  page = flr(frame / 4)
owl_page = -1
  if page != owl_page then
    blit_bigpic(owl.h, 0x0200, 0x80, owl.data, owl.w, owl.w / 4 * page, 0)
    owl_page = page
  end
  palt(8,true)
  spr(16 + frame % 4 * 4, owl_x, owl_y, owl.w / 16 / 8, owl.h / 8)
  palt()
  if true then
    palt(8,true)
    frame = flr(water_cycle % 1 * 12)
    off_x = water.w * (scroll_mul * 1.5 + (frame + 6) * 5 % 12 / 12)
    blit_bigpic(water.h, 0x0200, 0x80, water.data, water.w, off_x % water.w, 0)
    spr(16, 0, 96, 16, 4)
    palt()
  end
  palt(8,true)
  palt(0,false)
  off_x = trees.w * (scroll_mul * 8.0)
  blit_bigpic(trees.h / 2, 0x0200, 0x80, trees.data, trees.w, off_x % trees.w, 0)
  spr(16, 0, 0, 16, 8)
  blit_bigpic(trees.h / 2, 0x0200, 0x80, trees.data, trees.w, off_x % trees.w, 64)
  spr(16, 0, 64, 16, 8)
  palt()
  cursor(90,120)
  print(stat(1)..'%', 90, 120)
end
__gfx__
87c9dedbb4f4c595ab02a469b83d45beaa570a55d2f0c8a46dde14e4252f96c69c3c39563a62706146309dc4eaafe4273138060d7600b700207262267941697a
762d2ff61f428d38d130cac340d25c65ef38b75dd2ec506052eeafe9beb5b367cb1f3b2ebcc4285bf1b6d7fe7da514ecccc416a035892c416a035892c416a035
892c416a035892c416a035892c416a035892c416a035892c416a035892c416a035892c416a035892c416a035892c416a035892c7ed0fdcf9f9d3ffeff68ffb58
f7bffe6eeff89bf3cfddcefddfeefeeb9fdffb999fdfccfe66eb99977fdc73343307666e78f3c2ff1ebff38b93e7ffdcfd1dfefdffb9fe76fbfb7ddf0ff0f782
d93ef1fb9ff0ffbf77fffdfee2f7773fbfffdfbfff7f7ffffcfeddf6fbb7733fe64214e82f07f08fbf9ec13d936a37c47e89ec13d936a37c47e89ec13d936a37
c47e89ec13d936a37c7d8374e9fc3141e33f1ef3f140f9d95c1de3fcac7df9f3b12f396958f9f02cfc7034e7e4162487032ff7b0d5f977082c2c83f931fac601
8049b6e74bfc98616dffe1c87f9f738077527ff4e0f085afedbad381de372740cef7f06cafc9016c516ed9921c8745fdd05f64e9f06c9fc987df20d2f11d7f5f
e8df32f7e460f905ef64e9f06cafcbb2406e7cefc987579f11e7ecf07f97724df8bccf70f0ed1f447658fc7734e76f6ab78bbe3924040d0d8b8ffcbb0afb8c58
9f15e3fe4400b8f06cffc1f79e773fd52ff1d16e7240e5c7c21e77d2f3ab03ab62c5c11f37249f7f89978effeddcf46ff8c2a3e29f50a9edd8ef9d35eb328cff
dd8fff503bd8e018cc7c9e1403737cffc77506bebb1de3f1c46eff6e724870d7dfff0efc77387981cbef05b6d78a8f763e9f22bc45f371bbf37e3cfcbb95f74f
cb7ee88e715081f3ffbbb95e554032e7ed90c38f479ff3d2f347d9377f5ff80d03af7ed908565e87ffcd1321f904efb0f06cffc4248ba4ef6a12e3cf4d81c7c5
88fd8d14d39ba6f72345e3e300db5733e3c7d9c1c1c723c6e3e3c1eb98d19cc0e891d67cf8cf35224f1312eaf57bbe71b7a2ff8f02938c3ecff668ef3c388f0e
57c9bacffaad7197e71d54ff75b1f0ad44f21dfecdef14efadf851ebab870782f110db7dd6738e6affacdd8f8e81e7830f1fdc99e7c44feb4a17efa14b161d2d
f7802cf3cfa7cf1cb171fd2e34a8f678709b1a7fa3143583bb05e70c5c6303badf5d0df75debe67e7dc4f8bf409ef9d5c910dbe2806eb88ad0b86cf1e1cbe348
78e351eb77b00a9ce28b15c73767093ada33dbd60be77cb83bcfc4ce1ea0e22039e57fd96fb41887fae71edfbd55bd95bf9db474de91acf3621df2200bf3480d
88c1afa38e776fe981b7fc154f7104f2cd576dff2f209b1f0fc84ef75d64ff09fb4fef0eb068baaf54b19a9334dfeb67e5dec2174d20db9089ff5013461fd39d
3081b4e8101fba09ff5f1e18058930d37b70e47185dd372f5871932336e94efe25322e71bd7c79e0e88979768afd84f4bd501042810cdd60ea83b58507ffc2e2
0acf1812e20287f70f5438b49fc192c2170a72729d309bb090e89c616e98f306d2f25814f5ebcffabd0ecc092c7804f04a4ba4ee913b70c6fd95ff2cbf7decc5
4df18bbaf5aacf3f3ccffaeefdb58c7fc92830d2b0b8fe19eb3081d283a5d920cb74be84e2c0f304df39c5834f52acffaadf7dd3724fffeecdcfe1461b71c2cf
783f8efed546fc1683f4eff362b6003607ff1ddf5c48cf1c2c2c7182ff34010f208cb7112e9109b44dd2c209db727f99ed585072f705f026f01f3adce016e5cf
1c7e90f3e3fbc7eb1b1b1dd73c5ee29f34035f780f31dfd170738136cb301ff34917246ffece10c24427524d687f03efcd06565f0d5a72b09f230c6ae5e5e5d5
d55c17c7846deb022fd344bf7ab09bed7f3680783f8cf22bf863ae3c99adb858f47df1672f6018b3aff2f66fc9087e7385efb27975b7e42efc1006c7142e54a7
0df95246ee0207a1b3777c4fe95e46ee26e0b045ee11bbcbdb00c57285f3f7cfa7075fde12228bcba42fe595d7390827a318bbb4e6cf6f73496bbb9ba8af078a
2e6ccfe050e9f202d383e346f70b0c3e63b3004601ae30683833e133c55dfad5548f90af10797975861bb1fc94efa61cc2f60183a9cff80a1047b9c799b47f11
dd639f33cb0afabf1b307cd02b8181f181b712bffbe3c731365401f728a700ccd12e5f2fd29d7facda3f05ecfbfb8d40b878bf7b7b0ef061dd595e5e317f64e8
1006113fd7891e2e6f0281b3a7de87fad46030c01abf4eb06e5def1a4407e5437bdf1af860fcf593b75740a31fe528cbf9f5ed4bfbd330580734097f5edc6c3c
3365267f03254490d2bcf15320d70c919bfab2817eb0a4fed72b77aa78c8df09e3c1e1eb10f894904f7a8c7004ede4e506ee02f676ff9392009dffa62ffc78fb
d228a04ec8fd509a0b34f95ed932d49bacff01f1091b81cccb0fb82f526bf0763fc1e0c7f70e362c5fd8317d3472f372efb472fe7e891d34e62e4cf798f4c5ef
5844a76fd9ad72adc7e9be6fe0cd773e6b913c50abf7d8ca15bf00789e2b10a1f53b730278a3a5e307dbaba1c8f0b03ebebd1262176ff787f1c38f239fb77af8
784ae806fe8f4cb94e6f6f7b38300bb76af926cbe0129e74570faeb5817b9ce188f17197b925240afbd76c1c16eb42f1820cacb2b3abcb9bcd0371ead91aefa5
cbf12f3e6a46ec7ee4ab8e0bd98b1cfb34cf74b67c890a357e73e2befcbdc40d5055b7e5ef4ddd4d13a8f373af19081f70cf21b79fd27f1f2d4e30560f61c635
1ef9f67575ff5c33c75ed683e4a83605f85d39ea94755236bf3f23bdbfd24432e60e0f33bab8ff3e6ff4f7d7b9f1a79f7e68e9818c1b36ac10c3dbde20f3ea03
62c918db4b53b38979cf9a70c5edc3fd0f4fc5fd8b1a158bb172def5d03cf2b07f1f97fef5e1a4eb7ee64bbdfdd993b87070090604863a5b30a84f0f5cfa9f5e
5efa7373ffbe6ef2437158cfc95f915cd18f38639bc3917c54b71ea90279c790da561ed717b30e6f6d8cb7504e9ef1001fef1dfb07be49365ff543e7ca0d8df2
8ba0fc3cbfba7b850cdb78c6f6973f5360870d448c8f75ff51e9c48f907ff0bcfd1a8eed579e0cd293818bfb06cebf093c1c18e274e1f47cb7493233fb0c1ca5
d78636bf40f2404eb318b7bf62977eefed5e6c3ff57137f3472ec33550cb1a1b0f3c9103e3fe41ee2d5c77f9fe5e86fee20ad22493ac9ffdd0c31fd9bb4f052f
19b07fcfcbb9f4c1a0b9bf992db581b8e78edfbf46ee6cd760ef1364efd2416b74140aa32018ef159e541faf134d6678babcfe991eb2877dd899e721e3c47935
ebfe24d04e7fb9bc938cffdc10843028016e77ec308376fb08a1afb80a781f0e0830c88dbf141cef56c4d2203af0c2f6bcf203711bf12e7abb0756cf93848fc2
097f6cfafdd998c773e2bde4c7d6658284ad02d57260e5b3d497e071ec8eef5d5d52c309f6040c1059285a12db373108dbb3d7c54278ff016d3731d51659fabf
55d6e07f9fb0a08075c2f5197d51787355fba34a4964ed12f3ea53d5a28df4ef2cbf7eb6722b5ec5ecb09b1cf6e4e52907a3b9d71ee6ff1962cb676b9e294f5e
dcf32defbcdab11cbdb98b0abfd797915d1cd8375c6efc89fe5e7bbaf6ead9dbff6c6fe9724d1083cfd0430451292185f2fcb075138d171ded3ec381f57b3933
886f23d5b9a44259f7bbd49e4f99faff0dcdf7dc95edece7bdf7dd0597ff757ecbd9837363ec8835fcf2144c43ebebab2777d5c0f7186ed873e936d0f06fffaf
59bc7f0ae9f33c60fc3fcfae60e16720cfeeceb376fe84ffbaff57973f757836b57fb25cf592d3c9ed60afd1ae3082397b764bf854f6f2e8f9ee2d1cb873ace3
460baf732b0e56e48075659069962834763cf2050a7283a7ee6c7089eadb67ebb75ff885ab1a97ff20fa245ee8f3d98bf53cbb780debb54ce8e4eb28f6ff3d10
83000c1fd2c20babaf7a307a1070ff4c40c1e103ef9421e834df634fdd72afc2fbe16e10f3274588c54f18ac10097fa0a38ec14cb86f9984d8efc95ed7506cf4
3676bc73750fc187b7c1f5d683552c41ee50ddfbcb9b2ac030b183908e64dfc065fd08c7ff5bb464d5cdfb27a188550f9d5b3d7975ee147848b53bdfa9e082d5
045f276edb1d507dff988cbf2c58f8cdfd7c0009f99493078704efff0e507cf4c87b93424dace0cbfe8ef5e55ce7b06dfdbcffdef509d7fc14c905f9f22acb73
7995d104edee3e506c47a2fcd5a8c9fb855f2f7987f9f2ffb25d7fba7b9068bb54887fe62087cff7cda8db7e9cded2d260e34e0e0d9ebcb902d5529fe123eba4
f68362d7077543f554b7f3b6ffa433c5ded9142c542f6020f0bd06e2eccffc03df6ae7b04e3e01f0ea75d9030dcb14e975fcf7d7142f5c1f5f64271f2026af5d
37297b336affb0dd30bcfd9de3abb1457ad80aebbb4ce7ecdffef7dfbedcd4eded379e8a3b7f51897eb771d6e6c1c55b14f1c9211697776ebcbbc151659f1051
3ccbd139b731a792e3e22432949f1b08c13e28fef4e47f0d0ae0c5c7672838850b80d27b73905edee237bc1ded36794fdb85d7bc216c0717182fefd0a36b83e5
851a87f4364b7784e20fa420573c10767fe4d82958461ed38f48383c3c30715fd9e3ca062ef0ddfbf3ddebdfd0af140e880addf02ff7b420b54ca01d76f9700e
252f30daf3fe7e186c0838fc15eb43eb17c99c18d143eb9f1ad764e06bdb20e5c1bdd2f012f1b7546eee448f245eb904ee64efff51913e684cf781f7bf21c3bf
56bffaf309cbf2318a43c9350ee7ed52d9e30a20fdd46f21e917102c9dbf504d77cb997e25eff51b0844588b44794d679b2c5ddcb28874436127fa92ed7b52f5
dff9410345ef7b02fb5c38546a7f017ceccd9ec30b31616530708e021c0fe652ff2430fb588fefb17ffd140c9cf992eb3bcb1226bb7687c7b01bc1c9184ffe94
bfefcbc0e14c96bbb765638eddd7c293750290873787b1f1ebebf0bf9145b98b9175f7305f279750ac210f304e00522f8026fdb2cd1f12f75e07e34e7e19ebbe
bdb9f51c40f084fddd012397cbfd6c1e60afefc7f0e6b3b3ecd5cefcd919ee14fb5ea9c128b87db1cbf13fd264eebcb419ff34091d5effcbaf1e93bfbfdbc92f
b3097fdf4e293ed37d7ffdb3fff85fddc3cc9c2fb7ee24c8b8427d7557ce34c91543ff5fb7cc7f56f2f1cd37ee0f144402739d372f588f07375798af07093720
2c4fde12db1f1eb5844d100ceb148fbc8db042973ed5aee00687c5939c1ccdfde1ef678ba7ff0ed8b85cbaf72c6fbb8df2a54f106010c1fdff50c65751df6c23
ed509507e7f986ebf41fe3958f5c9caf086fb6714aebb406f77ef9f6fda3528bfec124c26cbe4e9b0cbbbf880e228c3f28734311ffc3679b2eb50701c91f1f88
8e17e5ceac5a36b1ccf30f0002cff59740ce179ba395eb3d501372716ffae2f786fdcf071eae10aa7dcbffe48263366fe8efbf1281f2824cd0ad7f52bfb76d71
7ac2e48a06ff0d0e5cafed58be6f507fced3dffcfaf2ff27d45fdf507a77ee3e51ba301a83f93d18e012761fcec061552fcdd705f091bbaa2adb246bda6f390a
5e3305a34c735fbb10e4400d58543ac557fbd12defb0849ffb1cd18a3e05128af374d0a7e40f21a7e138709e78b2fe02edf22a708f75236d3c7d7047ef0c7fbd
75e4cda7b2cdf6881ccb37876e5fdff529335c79c3ef2eb715f00f767197e9b05887ff2275a717c93f9d81577f9bc48c2feb8978c4badb7adbb87982528a4dc9
df18b4d788de91a87d0eae12ade5acefc10fb126fa4c774f7fee50ebf41fefb3c60f27f37f6eaaede0beb727b2e6d36ffde4b6bd0e57805ab25d78386fd77e14
11f74a7080ab8c9dd50ed70af6e37ab0d6a28799950044fef3197749ce8d1b8d99d8f390e7fd0e4bc01fa139be7122fc7b8dfa1867d16fbe0cebdadbb467e4a0
2905cb788620a004ef365f6368fe2204ec16b1e0ba7298fc7dc164e3b5f3045700d7086bf865774efc218eb5178f24a0fef2c18cd7ade283b67bdad7fdf7971e
c20bd2db45b4f69c812f7ff616f60638ce7124f7b1ca295eb45b18f8f07d836c66e0de7d18f38786bf9bfc12a87d9a5c758df603df62b0718a0a0f6cbef6f52d
019e1451ef67efa55f305ed7ff52538bada2fd8139b25bf60e8ed69acb1161e7133851adf8184f095edba4c1f712ef0e69ab17f761df0c4e106fb196ffe0aa97
76eee077e3f720b3a37b8d3f9cfc2f7d1e2db25e4fbba81c150ef1e81c3e0a25cb6c402e0e095f388c58b0e8069ce0fe307cc9145f297f7b5012c34b367819ba
e0c994154070cf82bdef15df183702061826fee416e12bfb70b7f59bcbcfb8378e0dfdb97ae7eab92f2f6ea1260471dfdb145a943ab20d062d670c618c3ecdef
b5afac3e18f7e199eacd0e1b1804ed233a787b7b789fd7c07df20ae185181b630f0e10ed0540f70ba8193e20baf26d71771c95b7efe9e44e133575f0367a1070
3efe73f58887fe3153e40e235519cb2a87bbe189f2c3050bffbcb9f539c1510c5948fa6502f18548080b14bf577d41e00cff3adbb7f7f3f4bf7781fe719c10c7
7c82d5ebab68c20f2ad3e2dfdb1ee7719b541f619ef2ad348fcfae1ea627041d5fdbb87db203ebf82066f7026feff58dfdf53cefddb7ad1d1ca7c267e12e2288
7fe24dfa26ebf7077f4f7714713460d8348f692f53ad26774fb39136dfee410c9d7fb24fff7686fee4f104ed798dcc1c7cff32afb7d87f9b6cb7ac7fbe751c7f
33f301c0217f048b6f9fad2ef2b2f62129f6e0a00bc05f1cb1a45c61f58cefd1ee7eeb7ca0f1ed779124ccdfd33bf14bab20a10f6a7f2bf9b0c5fdcdcbab00d0
89729f14d38f0132cff801f0cbdbf91f97dabcfb0e58780d342890c969c5f51a7b731fe7563eaf2f5dd0fe7ed76d0e2c8728a10b082f349f2c67b36a40728ae1
2ad145f004d779fb7fbf7721fe3887789fefae7902ff51847dad13860c95bf524c7f7545fb3f7f9004f18dedf126d782efefcec43edfd07cbf0cfdf3f757979d
32fd9fc90c95cbba30360d08815ef45fb3ee7dd2ef28af0f724f00b0cbf5feaebb3c7f476e43c87f58fef5e23e95fbf210c98cd9ba6aefc1843fa03e1c916df6
29fd18340ade211f7f3fafdf29510357c7f34f7fb2d32fdffcd00c30ca282106cbebdb5e870fe13e93cd4a46efd3d670b358848cfdfb7f1fef6fd26cbf28cbb4
ec38c7e800599ff07d75ff9fafa08efb40b66f5fbf377af0b74bfd2fd16eed0efebd16d77fcd969c536f7f2c98b75db3f9b104338ef91c90ca28031449c91d16
ea8787b7813740081a3f7ff69430edbadbfa04cbf7bec90c723216230769aec908b4500b1e3061e9b6e3b03ab2c31b147e701dfd7245fd96cbf7e01fefafb488
7f5e00d804ce702408f51e87e7f15ebba0a818b3c862fbfbe28fbf5186eecde7901feb71ca05f309297ff1023a3eafd03fbbd379d187f77fc1bebba7e9f7181f
eb71ca04f7e8638d04510cb935dfeb2fcd9dbfb93c387fad156c33bbf60a2c7b4ffacbaf252ed7f40c68e14f4fd5c3f7502374af1ded14f143fbdd0cafec5d10
f566cbfe90b24b16589f00de7d1d568b0f62e38b0b5fd1ce8edf5b02fef252edd02086301425f7547c338af937d756dfdd377efef3a4d7ff960657552f10c19b
ce004f1cf9f75436f8fde71e6fedb102e9f37cc70008cedf6e22097f377991c752afedd0cbf57a70e2eac519fba16e7fe8eff2ddfd7f509c7001c97647af050b
7fbef293edf040f9f042c9fd5254b7ff24aebb131e517e30c0e85054b7fdafa95ef986e30c38394eb4ecfe7c280eb0e3e7ffeff65165eba6b7f1c0f5b4e7b358
fbd08de117cf5a385a72e2b1732c1f756054296b7faedf7c95329faa020d7ea59c8f4df0b45f1eb07e780db17cdd4f12dfc3e43d4ab9f39c79d4e309c68e9a18
eab1d7f6449582ffca44ff3df2c81050df6f4f7dbe43ede06c9a2f3a1d825dffa621e8f33788daf3b8da87909f6ee75cf83ede6436faf8df30c796ef055cb02d
50feebbc7108ed3dd35afd195d081a5afb6ca30563f90c76dce8d6b6ed5741f75c2df06ff680a4d11c27b1f6630dc081ab82d22b660d8f3904c4c004a6196552
03da5480c3074a760cf86a97712f1826c703348912bf088bf4a01fede1ff25f46f09cfd512004110d5932350909a39489eeb25daee0391cef0b00f98d45aee8a
6382ce51cc1677f097267c8ecf9902a068d84da21bd7cb198ae692c7e61b1d83b3cf57f4210007c75109c7cce003dd6676826d0d4cff08c79928f7da7140e242
7a581f7a600a55c7c9a3abc0884e1757f211eb01db15d5e151340c470cbf304197a1af3ce2197d8f335bf4587be3c1835075d0dd319aa0245b6088c3d35d1873
98a8d172a180e459cba53244fb13c114f1d591ae18acb8bcb48cad354f8f7a236054e4b68a1fd06d60f90210b90531c62cc5943cc7935ffbaef6efad7c68db8d
0db57b368fcc85fb190da3566f133df8f377d805b6ae709fa5dced94a70dbd84688421e34108db7d575bd3d13ab5f8984698f6bd448b2dbdca42a9fe00021217
dcf006a5231120a56a6d53edb20302a20296e66a310da5a0bde11944ce8135e3e0d67a0aac8e4c1cad1cd2881d7a8aa1244f9a839b601d450187d5177e202cb3
1824b702d084cf0e9c00bdbb6eb759a5c51abc90aaf350e3917d949248eba6d55688ef0251d87199734c8db74ffc0fd63e52169ee6ed4844fd16ebc63179489c
1d8764fb64e3dbb3d3d64d46cdcaba66b732f68de4842479d1ff2040d9e84546d3c17a3a0d477d5b24ddef682a6f9afa81b3028cd3f0dc4f8e79a58af2d4a4ee
037f3fe61a61acb35af5243b3fce8a71ea32373d0f9b2ad0c8b745642dc1c938bda1caa71b4f8743d63ee97ce3cb0627405d00ebf2c89dd642ed8eb11ab3c209
4a09e04a4ee6daf38c3c95375bfc7053c5054d3f836d777739c2a202cebbc1171cff50e3fb1dd900af98abd3ed8a503f0bc5cabde2f4853d7a54af07c960d5e6
0a22237f1e2c9a91bfa0ab16336237f15f3c8f308c14ab3d54f096f6a5c351d71a1e23d560351da4a77864c91348d3badf6488e9397a5771a6b29991b57d6d5a
922fbc03e1da845517c3ca950516fa1fc5890119ce36e6b608448aa8b43c7dde62708e3716cd8818165e93e8fb596194cdbea178bca9e49c8cedf9f10fa0fef6
93763a55b6252b76196054c19b5b8cb60ce72c1f0d77809de1675f97317bb2aab4382ed5f3a13de7cc197a7b149bda3e27245f52aa8287d34d126f7f4adc29a0
85df7763c5c6b545432bde9feb0991b7417bda364d7fbc5b89b372db9d09625e026adc8c5d9931a6eea49b23889a59bcbf18d861cf0de77beb37564c193d1807
5b29070a74a80250ccab66d353464fc89e2984858eaec185aa38b0516ac5cd95c6bf6968f1a254bd38009e518ed8b91a9221b026de791b545da223709740e458
f45802bc9849c09489056096f479e1702fe291b72cb4bf1f51bcad8187210b131b10fb658bf4930303faee5c4bfe3b7662c359421b2582d8355fd0967316d736
a55ac7c177f63dcebd7c827db0cc030b4bdd42cd3f0879bba76b50f7fbf6a13e26f662ed1a1698775eaa95538e4b0479737b684a843463b8a660fb06cbf5cd39
ad53afb42ff8bff8b020f0d344d3e3d24e7416d07d80c25b77cff47011854032624036945f04914fd061e70109a0b9458bf515c35c0178e6b9e67ac3682c7cb0
743efb19fbd9a49e78668517127c8e103e668631c871887206abf6c900df210e17c02f9ddabd13f6ce0187afb86511bd22fa12b61af77940248b12cf4cdfe90c
0517525d9edbeae7ba7dcca6dd7611601d0ad9cce6dc3af0d39353fb458e7736536049f78cf84d6e3f1797b5a50f4ef4d9156fbf2314c9051f468f445a25020f
4b0df05a622eebaa217b26d6ba07f82e59007e2e1b9ea511bccc344efabe6ac27ed7ad4c4e7366bd677b110d5aadadd12148a0a76c4c4ca518f1d0b52063df04
7ba0894cdea94dacafa29a3330c299ad120876f54216dd9677543aede726bb73aef96738ef343ab6b96b851e5c58d7b7569fe610fcd7379b610bda625a60fc00
316a6c376125a5e51b1a5f3ce9ffd43eb7a6a29bc4e15c23e4400c6ff14cb3bdb9d358f552b4da5214f03af4cc9289450af04922569885b4aa5ae6453b59109b
eddf2cc8c6bc672c4cc577ade5f2e83ed3bb886a7282322f7c1c83d4c8cce498c05deda3bcfb04fa6e01569474c6df7ad17dd439c4f72cd03e819666fa82bdd3
6c1e29613b0de2a2ca2ecf417df61a0bc44526afd6ad15a4fa90971c93f2abfe5d16f2905d789c4257842c870952eddb96d605470a7ad53e22df5b28e77851a5
a16f77a28dc73f6cc7a5152309aba7a60d88390075f4f6f6171f60f02bd1e71674ad4178accffdfa74ebc4c6a511d671cddc9612cefe612d28df877da711ada9
9c2020dcee496fc255ea4673ac1ade20df7ae986f0d8ea21834fad09ceafd910c918b832f572ceb85c2125c9487d07f9db056b707884673e0bc31a1bd5f3d026
1d969ce9210d854fb2c9218ae348d1502a83dee0ecb71c831f1d8995299b489caf0e8563fc253934de9913d6335092258c9a3d03213a9ede5f91753b68d48f67
35be3ece19c8a43cfe3f1b4fcb65689fe47552f1be8779304974839025ecd6da8142e6849b12b5d251bb9667a6f8c042562894bff1ac68fdd4391545bae1aff7
6dff4da916a94053505272c26fdfd31409a516aefe821e0be083e06b009b60655428d56636d36d737dbc243de689a35c5d24d712dc81f31ee5dd8bc57e8aa2e3
5e2446256ea1130e4b116dc45f0e79831ecde517b02773e99219281c37935b5f8ad37544a856ddbfe6127faa618f31bf3478277d66f2bb58ebf583c83e24bdf6
f2c2f43d221e7a23b0171b215856d98be52793e5f1c22c18ef1bfd73c6d8da9b6dbe6cb57ddf8510ec89416b6d34ff01712e18d6648f1bfcaba1c725b2cdeabd
5b1fcb26b05ddd2d1716705a0ef0cacfa0d018a34d48eb343ebd98c089a68f4f582d74372746fb8dfab8346814db1d804ef1c12d7a1761c135909e336d3dc4c4
d6b6b98fd03ee2c7699c69202063183a916e7aa9b37c69f116835bd0abd6ccaadf8365396e137ff54fa04e706b0eda60bd53cc252d023db1b4b04f61cebd65b1
941310edba7856e2bcf8622610b5f73d0b70b893d51ddaf74a7d018bf9681ff36a8f851f75c52406dfdce63c6e66c5b35a9847128b86c8df1bd1c6fd89a6bc32
0bb66c6b1e82a0c96034811ae38d67b51e0552746ede02dfa03c5258443cee05553e4d2582d3a1b6ffe3f14ebbacfea0bdd666a3a54f6aa30943bd59679bc68f
223cd4e3a1b55767a81adc2a443a1971f737fb6cd82f4d0645b04f930e15c948b5562781320e1aeef0805f99f2cc56353b927e77e4d26f516c86f81d4296575f
51c83c2e46c50120d6b4dc4713d929326e11e3169f153b10c251b7da82b33ce728810a7972c3f1bd9fcf695de96ef4d884f016ceee2f9651e3b80bfef4ceb8e2
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
08bb1afd0f0861c682eca9129298d46523dbdb12fefc6bf87c8e9817e7624ae116872378b64211db919fc30dbfb273ef195638ec4ea9046df94ca2829edbbd956995549296dacc4642572f69909c9ac476373360c4b7f06adee2ac07e7e148e7ca4a4811b6999bba163006686a51ad164175b84d3c2bed6c5498d364e14dcb8d
e0219406e80b49ba70a745b3d70ab3b68ac2dda61548c7f44e45e4ddcae0ae6d8ee2ec19a0b7bd5d770413b3023e3206a8b3e567dab70be1994d0438db95b05548b718c348dec4fc845fca757d9c28e3df810b11a58d34bf508c0911cac39938ba5c8a40410e89d76a1255d8555260ecb60eb845d55fc7b906f4fc5122ee3ec3
__map__
04c55b77c0480208bf11b167fc990a87ed09172713d3b457dc263b9d2c2949dfeab501638b02d6f76c0175e5b7d49fee2eef6b6729b54a489b7ded55090b9134d85a84a70adb61158d0d7a528ab7032a384881ae06e81dac715a370db81af79aeb3e8a35c8ad64417f793b09c3c96941c5820489fb1bac24926cef49d121fa90
ca788fba437efe7d4b1db61392d28cd2afdfdcd7f0ca65d1bedff842ada3202bc61ecbc1f94cf4e09417a74eeca935a8fda286159ae4308eea813d700c316ea521dbf991d4144d399cb7bb1bf817f66f85f52cfdf642c356b189cff5c4457a3fdb30cd484e10f7310cf8f310159cc2f75f5259aeb85f55edeadfd50bc76876b5
bca6f64513ec8fa55d5397dad89726a94ffae9f8526add791a083cb3d982439e0f88d08a5a7cf0d8cf83736adb2d9460dd56007159ca9706f6c0b544222ca78374a9ee4f30e302fa4f79677bcf7f4dad21de51dc963aff306237822608ed1f6bd331529f805e4fdbdce644a0c4dc7dbe673739128f8ca77f2f0af7630a012a3c
6f14fb361acf47db06c246a63f0b8a709fe734ea42ae36c72ba13bddb609165b2e6f1808c1597d3f0d76b859fd7c99931a829dd654050ba45f8e0cd6983ef1a70d7e2ad8c627f3f3f9bc6a8fc67bb8ca4588d292e9d8d6b31c906072bb8fb3ed633ab1c420406456d9a93633756fc83d1613a9afedb817fa6336e7ae8bf212fd
5ebf3dfd71f7fe4d12ec376e4b4d10fbf347b13f8a2cec8dcc98bfb2e18ffa44a69eaa4b15e0d3083d38c1ee3a3379f6aed84e409e9578d091ae73f52c2cc51df34a488d77480dd9ae2aa4d7757d9bea875df37696689d197a9a34d8c10a5d99ec1751aa2a63c9f323f5e02ade2c10b782e3048fd56a2b81f8356595a68b2d88
359f13df81141afbe7fde9d83f8fdb36d2f248eb8911a4493df7c358da75feda5b79b0a5999ab1ecb516a4db35aec6e1b83074e20f3728820e252708cdd046edb987aae55025e8c3d40b633fafcbf7c2b31b8c9469c594e25aa42f4d0271d1b546381e743603255e117ac91a6c27997a1681be07f93e3441eb9e1f9041ea1987
b4ee8b28d374e7dd357f10bf422d08b3fd2ae9ab472404df2436507c68580016d8ce490aa50dcfc8de410f04424e5209ec3d0ef7ebf99ba6de54b6bd49f82629b5996a46564a4b517e1f18629f310268f38346f2ed2045aa11e47b54c6f9ed3fc9e7250daacb7963361f98ac02bf9e824ff57beabcbdb02f7bbcbc966ec0f3a6
709a24439d371e0d286936473282716ac6c1fe69a2e78fc2fb546009fd94b172e5916853a1e2340ae7476e7491776ad02b2f3acb74bde82ecadc4737707f0f9d80ff3e0981190372e86bf6bdcbd74e626cb62e53934114e25de0289c9a147d55dae3f7316038da09b0bd27a8eed5c3ef7a6dd7c401eaf7e96a410246359ad25f
df37db981adf2951b69865d8ce0bd2f9749000f9d1bb7611f5380e99a01a5ee7f439358762b6c363e3988a38ddd1fb8d845320cd14d35aa356d81b4045c9c093141539a8b59280d601914ca1523257715cb1d7e3ba0fa3180c6a2675af4b933cf507106ba6cb42f9b77a8c94ce3424e600504d6b1949b22a959aabad8383a065
dfc2b5bd3cf368dff13850af6b19420827bc51c9be018a7c55ec38fc6abdf47c8cfe54cdf922b32395458523be593684997f087a4b16b17dadbacf58e9b63390534356a3662bb77d5277ffa5b14c5c456cb60f71c248844ab950e534c48227d0f4f2cebf8edf9b97f01b170a753a05c22d2aad301bdab94ab9e7732a58546a92
35d6edd151d3fac6daade13387b466ca029ae483c87558a02448be278a065fb37f3f404e3f12c978aa29b6df168cf6c220428da980de6a619c2683f3fd0a7ff61074a5fcf27810d7ed3911f7af36e238fa6515957f40aff0c7b625aa74ecc9979e14e8f60a69fbd0dfb7fa3810ebbadcb2a1013516d5c4b9a1bf6daa396289b6
2a2b197f3bdf6cfb507fddf87f980aa7e3d44b55400f32d35cf24b7af7f47681ec1a180f60fcbbdf4c50c31507e682e4ae8f6fa792049831143ce68b88446fc1bfe19d947fe1cf4ae17e6aeef5340cb93fae1ad579238827f09b826cf274ac6bcf9cd3e21490b7aae01c47c3da7b3538b790f624ae473edcefeb071fae5c348d
1d696c13fdb4f51edbf15ecdf473786f290d7606d27a776fa6d173303e14b6470218411f62eb0cc3bfafc4fb54f17ee2ffde0a97b2b6bef5273d0aea64d85a0f33bf0c3ffa64c01f0d30c935e3edda5e78a0d06febf8365081ac343caf5cf215e90265fe7eda0bad01e34921a83082bf371317e8af44967e3ad664fc7f0a9fa1
bd374abe89de830c1957f833edf11cc38751907abdd8170ffb44f55af0d5db60cc5d83a0bfd5e8fe7a7dd9b2c3d6c00a1fd201dac5a1e8d9d625b1ff1eb482eac149d66618efb411c627d00af1cfe683fd1c183c346c157cd750b7475beafe20bda0546b98c3085d7f3fa2ab25142761ab0f20d85c96177bfcde13cd219e1916
82defa5e61ef2b0a0fc257326bdfcdc241b6801f789a31f5d295b7529ddcff0630b883cf808b84dfaf1bc88f11ccc71eed0b7a2675dbcf4d7c2fc9dfdf6595919753fc289377c23d44c1dfc247e905f486bd21ce7ed871dfa3df8919bbc849053f8f5379a056b8f0295201037dbf77d6287e13b53b6c85af2b400fb97faf2f1d
d0ba28bf73e7e0fd41e9ae5b5c4860fa8cabe5f707186b3161fad8d04b7f19066d45c6f1a071bd4b7a15fe6c944dc8af0d18a7652fdd0914f9b137e07e165e26b337c78d98819216d20e918571e45f19e39d21a1485f331c06e22af956566ac725c540c54812b7ff2be1d84e806f0fe27f9a7c2c28ae4cdb05bdea9d7a0939a9
7f22aa87ae13ea49a92ccaa0cfb6074f3e120ce360c75ab23ef0737cd3f6773e9d7b304b75f3a392f4ce6debbd5e6a94df288270fb8e15e10342602f25bb8223635ac19f77a6aa83600c25ab846b0709503adce6676568fc3e0fb05c194a0cb5eef7cac6c3cc57e4df47d5fdca886ee763faaccf8551778047bfd4ff839339c9
0293be9b8efc561798337fe3e3d20f06bc3794cad77bdcfcc2a1849ce0526a071fc91e2b1f67190f2307871052fb5cdafbb92f0a7ad1fd95e9ffc4f099350aa7300cdc41c4f9d2edbb0f0cabd2a9bdf815f2a3d4743feb647f32985ac568d0cf4e2a5f2127a6a16c38b0cdc4a1785619d4559bc247844fa3e675f3f36f18766b
9fdecdecd21fb4a1bfceb23be008043cb43bc4435f28c49f814a8eaa10b58fac41f8475d505b86d6834faee31f08b6eb5d7f24fc13807ef9a3b2b7bd3d0436f5af3700d793f04bb69f0205f97e41191625e2a917f7d23f38ecf1376f87d1158241c765be0428f35551b55a295eff34be0afffa47f7d23d1c6c3c7e001ee7cd09
961b67a54ffb05b55ab815ba6b6f9604bcf074ed4701f89a74e4a2ef28af8cf2b0854fec4c137344bf1b11c786a8c8fbbde07f6bf57120eefa7e9d408fcb95e2a9a50f09f58fb7c384740d3c5cf961210e6acbf06f306d77a9cb7047b7ef16b6a3a653dc9154a0b21d0d7ea8143eb5f9266cc175f1404602918bbf5ddf4cfc04
debf12556ba55ebccc6de263257ae45fa23f06d8838e78e480b1db77b53b05fc939db54f5fddd7440df6e2200047ddea22cf7f44a855b36a75c41e4877a032d04725500347abf0efb822ad878743cdef2efc365b05bc3f4903a5d2740e757bbb9b4b95327f0f08f61547bf7859c7ca692422b761b1d18bbc816f94e443b0d4a0
1dbb227c007f8bbd8892b52b51b32b8ce1239541b3dd25382c9ad9a82eb5d28db9817abdeb1c3a83bbbc5d19bed006b86b6f8f2d66498acdff7322a954ab59a7dab55aad1fcb3f44748ea3ac874375febec480777bdcf00fb810dc2f8af58acde5006b45a3d74f71ff8c2dfc036c0495ee7c6820a6635776fda0c7ae44146505
b6c7b578b7867f47a3cf6c7deef14223697ca59a65453cec8c3d5eaaf6d9a2763494bf077f47b3365a46d4d5509a0ce2a2359a2fa1baf0dbeaf6167d9d8d2954efceaf361d9455c095ed6689db8cebe8827b9a47bc5d490adf80f4f7e08f84c19fa61d1e795cab577d0ed0c37357a2fe065c3693134861a941aea652dbee8bc5
7850e10e6f816ac8d78a44d5e1bbf7aeba2c65909b0729e0acaee499381e7edf9f611bd5a517e66537e26d54b19e32745a511e62a16cae8c5669c7517989611f19cde5c2ff0d1bfec201351a0c9ecedb773a05b7847b39bdb5c625b472ebee1c7f05ea9932aa5d3ccaaa2502d975986725fe945c51bd52ab49d5d6e59c1cfeb5
68a47a06b1eb436b2f3b8da25e1e9f568feb25e1b753c887f0fb7f7dd08d237ebeacd228ae383c546a6ebeddb8c0be12fce486cbfb4bf73720be52455fef615bb0c6ee48aa049b263dea70e47ac9d55d97383831f699b33cc1c206d1407bb40021073efbc5875ec59ffeefe043009bade31fa10b1d89ab3a9badbce850e92f77
d67b98f036c44972cbdba3c7971e1081732c157f7982809897bc223d46177f2bdbdbc8c2a2eb840ab312f557f6e2ace0edfb3c0fcdd092b7b6a31e4425684e86bd2a6a27be66de4c82966e7fcb73e4f01a517f1c471415fdd1f8624c726b94caa3824f97db7502fe34a1fff1eb76373f2a954ab2edec7b843d0f107e491d2e2b
96f281de6916be75aee4c11fcd2fe61a085e332b746190de40c4c91afdfb33e013a292341b7d45991b89e35a059aa851a5ebf94e2100231be34a0f778afea8465b9495be2568328247ad38e7986525b10a98e1f0ebf67fcefd620dd4f57883b1ac09fba2e223c8a4be988700ffd7b01ed901af00e1b95b9b60a12e0c0948556b
853151e5c8154c0d0eb55e76ec5621c64165da0f47876219c971b99e55904745894022522a0f7abc444cd8ae8e77e16f9cc631cab94bca20ab6a19037b024ab02cfb4a38612b936e25c35e4f357cd82351ce3c4a38f056c41bf303fabb11587c046eb52745f488fe6f3514b6f97ad93b2e1a6d370b3eb212b5a2e6791e066040
cfc5ae1ef990bbee66412a70b9721cb7e9fdd27b3877e11622de2a36c2132e749cc3efa6097890155207ad89eb15dc1dac27dd3902f0cc4dd9a778ee4238eae7eed943730476736f07ef59a2545b683ba052e7bacf2b44c5ade3c4c1f1141f774fc515fc59aa36a027181e206b6b7595a6bab2684cf78da8acef0041acd955e9
42b78412b6eebc3f2a2b4919bb7a857740b6a16d5c7ca6193176e5b8975043a1b4945844a4d52a09c1157c27b74a56f18a886d96bafcd178ff08e47f446f85d3f2019b8fe8b59d37eaed4e63763f0e7676acdf02579cd1bb38b42fedd668c6c049467907e32fafa458d5620e52a5d88177abe1ffe106c24bd93300d51e2eb5ec
56846578d6e99acb393f74f89d2e5c304bc150d030d722897791ac0053ef1b478d81c2ad551a31cb811c7a493412441c8e88a19bb29a67d57d7f27b3c1aa1256c37154435eb05717b43b208f7dc2146f41ea44ff4fbb1e6567067f5a1ed28a0c245982224a33eb2015e124b1685b616a9451d6290a8462118aa3e4852ceb1478
54c1abfbf8ff27ab41d7a14463287267fd32a2ddd0f15448ff4bd3b2c4df239a7c1881d481542978587e7518d4b04754b1a1181354b092aacb11c01381138500d463bfac42ce9c5c9273236511105a94e0065b59cbb9865c1d17fb7bb8078ed0d05c818a0f2b49009f3360e86de6702daaf1e92cf87bdbdbe4119be705870a37
__sfx__
acf4582b292750156a2073e39122015391d701190770e57a147241202f36063061792c4300026f3c01527458010083e56c1b123271270e67927743014572605a3c55518121387583e0572236e3c4350d75b3a540
fbac0c151734f021793201a1a3243100b0e66b0277e080782e3701c1102c3011740a172571b34e375410302c2462e280433f473277373113f1c2050422e122320e30208305280582806836443085130674b0c158
a919f9fd283372d5130a2762e331066053a558297662a223366623504c057171c501175360e41f1b2030b1762570d0a36824759383190465d0860b2617b131613131e285072252d2426c05610054171b21c3341b
b2f608e0233482f3481e5013a122122580e3693315e1031f3a0443360006344325691a471047102f2030e237155480c62d3162421219287370173d292732a0441d61e280111c424114561474b341061021118552
3ce7ee73303563144f1e45b1c2452b748254672954a0a51904455396393e2460c278111163c0173806e0872512333382670e32d1245e3b425315391055e19109207122e1681c03a046692a40d2135c1d1571875b
f9f24aae0e40c30446266132175d3904f1b25a0637a2a3740e5000110f2830526574211602f46e005042d07a1a61c1b443290271f525341243805d197011c4170f21635538267081f26e3c30d21758063572a260
bea51c453702f2916b1a6403f101002753635e383381b419331262707c1c71c25509281770e23d0a74b3e55e383093361b1352a1014c0e4350232907315265362e44a3d7242c4681d6691c07d271782535211278
fc82f98e2c3440a605147033454c1a0751a0012016d1536d333683f11a340093d351146070a3481755c0c078345360762f090450104d15529165291113a2113227441061691c7071d571115580276b1f6410d709
ff90d7572475f345142f3002e17c026051a04309416105223d54e3046d19242201263572c083711e24e1015b014542550a39103022320045a0e4371457d1942426659255623c619244232756b0742d0c22209717
3d7993e6103161545e18571374591051d3646c2311e3e04a0c1072e3081d37606700184691e1721302b3256a0536f140430374f390383e2692752a254122c51e220330d157020692642c05263076070b06528028
11a4798e1243e1d656001270e3290810a3001d2a17933157006370f72c0d538015483c4611766701103025371f61f2d12c1b14a25069323692f2061851a152483e0590e66d351321115938014295641354b3917a
12ce9b5e3f61c043610a14e3923a0866c23536022510b5141245001039022433c53c13540080130761e284171563e2d13b0c1072b1161470a325031362b092352746007364232610e176115051a07b2e2662573e
ca020eaf1d1692c259185591e6563c546310770474b2620b017383d4401e1693654a00201272393256c095121374e3400c39561367461d74322042015613f5371a04e1427a29215093403d40d2915c120221033e
a98629800e07c1b219000520611b1e60d2913a052470a51f352552d4520311e0546a0436f234360370a2d6193930911641074152d3051002c272672e769117732c7720873c3114f0d764257292517b0025a36113
6534ce84165020021f3a31e3244c19526125390810c25433253181860c30416072382e7731f70d245081772d0470402340214592b1092f34f2772c0d135392543142f2301e316162a7230e07f0e6723926c27613
00912aea3e5681a2111234b0e1152755a357222d7163203f1405e0472227118215383061e3b1530f639064243c25a1410a380143c3020864a3461f0e2440e12c0767c037763e06a2a07714501234793b0123f547
d2be0e360b2202d4742b13d112072b40a3b532232590e11d03464070130c608120063a073257181931f2a2540073d3721a3952526349152300b433003052661d1e258266011c737293483e209051461a03915036
125728fe07025214222506a0a5473f6151504e2022108516086672461d395321823727252292241806e316791e5260d408314232f32233476325280b60a24622350710472b0855619410120590104b021762a104
bcc949800c66d2423b055423c33e2873d3413c2c62a0161b0972d324720b4043236f1c3682904d113171436a3c43c18222015081c2071355615761321462230f1b5091f64a0972106457301502f16d1b47c0442b
15f2cd083a63d2662a1f6653101a04521311343e329020170432833523237190e40e395191f77639340224081900b006513640b29548242552a019004592864a35021030223243e395582323b0460f162050452b
d1e85cf5394191451a0570a0e079352560044102403110761f6112d63e1a05d0c1082754728058114520261e161770e50e047340133a260001c2013252f3e1771e329195422823b2461a0235a154023e0113d640
bab9c0750561c371783d2612974d18546342251f1591a7611007b071691162b0c23e0957d2364628623323043c3373c5370941d09122144270463d305001a423065190d2693b5343446806626127400947b08543
d755c07b0a65f125140720e3b6162a6780c75b0a5791577e081472143f3761c2e2030f74e3a44b1d0602d15d102311741a2d404292642a2610e1673526c2e3382a4060d7012007c201421974d115362a67c2a104
718290cb0367a3617c0e6502e4071535f2663e0642d29218194231f5413f44637417081062e72e046451e6163470c1a6583177e2856a2340e175102c5340b32609143247602f757250231922d0614c2174734007
15795c323c13c2175037637280753512a1656c0c2632247a08408380202b50c0a5101246d2430f064011e40f3511e0820b0d06101453042151f039185142240d210441c2420100c0e70415618362221b4692a26a
85122fae0f62a0a5103114d317212713c292251511538444203433c64502313156302b323054742f6773903e340213a4420855f3e470235391111f281430736d2d25f0d4103f222103681a4183205d2927e08570
e27fcecd346670200c371683e20e0f36d072220d53e390423177e273413e54b1e063275332a408122691e1780563a2417f125780063a3e43a182182e1592b20e0c7572703719155171093b13e08464151300d51d
37a59cf51b10e3174d1711b2b5193077e03634262263830c0d24b10562031781f46b202302e037053151f5281860e3c12d053293846c1c0011a703001240d170007620451b2975d1f70904771067742a2252a125
9186c79035732074162261402408161671c56133119106480373d12701092252442907464267292337a232481d55724441074073f45c3823634315262612062c092080a17e3c62418014185141d409307501d440
2f8c0bb6127630d067027690842d056161242f290553e6570056a251620a4551e1721960c3062409478173062f20a0d16d2303e046601e4680266209036364161864f2d25019630150383404823557267523757a
0f7b12a9376442a31a3901c1850d004512162f2a743095121325e1c14c2a117215623a04c371432d116371622e4581c7440e17708665032362f761311292a7062804628615093460e2641c2130670e2e4342d42e
f300039a0662d1923622365097031a3200147501200386142e2501d1291b444233110f03a046000465d05232307060026c3067e0b5671513f1b24e1e66c025253156e324780f6343e2502c252015611323538055
03fb045c056730d168237272c55e31419345242a10f3c6193335f2837f335460c7353325a3623e057273361017275052351c33b362111c437146740450b1f745342112e2561f110031091074209354264293d054
96e7a2313931d1a021222183930e1d6611c3620f7603604f1b17829750213092f32e3a2410b77a2a01a145470402d2512b1467a184473526c07006296353d3792a1020e44911635203383244e330561d24c09226
52eeefd71c7703121d307401b5253101e2b25a2f01934211070143d50a046643410c3357c1776f001623b1491647e211153d5123513a1f72a1233027230112641e2463276d1603b1e52c274151d7201d2252a100
9bcc100c206472247322577256633b2350b51b3c54808543173321815e2a0301141e0817f0c018014530b5070e7622a166061151a63b386030d50a2462b230270013a213101a1772e71c2f12a3504b3805422625
b7222e7d28008291301340d0a63e05737246731031c1013c2c0363715a3b75a1c0171a2273b624012480606c3b044072241e032141002d2590150733313273790312d34766092653b63e2803a2626a2915d03351
611b22e3356421a65c3617a2f07f386072c42f2655a256641d156285143155b136552914f2e7002b068265673902a2856c2626e0e61c0516d2b100060483c07c352172772114506280253742b1d31a0532334417
501080dd320753601c1b1192a22b1a562152171314f250592a1470867a320102426600171313020a258123481a6651230f0d5363d422113162d246364673f55322130253191c20f0622820302223200c42d2147e
5f5baa4b2f078382612c22e2c52938420094321e75a2055e12518035252b1140d23622373371230c4261241e2866f1c52b106442550d1127e28443371662f4351974d115220c4333715a116340557c023570c546
d9f5ce8c0860b3c56d2f722320331c63624761092403a2792e0093977d39000155032c7413244b3a11127075154382f60b0465a3742c11143271182426c1370a1e70814275064440f76a0c110122631164734517
1fa91b6f3c0490640726329023400e2153b74c1525a1611a047431960c3d42c113411f66c054241c7352516d0564806151064180c64e2632f0b77d314460c43d3914c0025a17614267791162b38613106482c463
1179d7cd38562320210a3641a21c1c4062d27c04638196451920f3064a162072a25e393323a644010231212133374186500971d0641032224216522337f3337c0e60e194762d32e1007b1b11b3174e033040b537
c03e28091f00a327230c25f0c5403a462351522c371252362565f1a00219740137032823a1f7411643c2727e14113034602a73e223471a1190a02e185000a56d260700d558135673e62e1b7481c57b1001139607
1e6f2ef30a27d1913b3c46a3e218155370a72b0c21d1131e0037e2731f142563517a3c1030175b296181621e1761d0e0470450b0815a1f4673f64d327690841c3d33a0e525207431534a0a529221160e4360975d
3b5e2b223841420561285061a00429015132190245d0a03935655161413e5341c1053070309533011241a0303b248111133803b34043194070464e1d67814139090492204f057683c067051593b7230c53202153
b9f8527c0530c2334a094591973f2e154023143274c0462f273512c7663d2772e01d1023b33026260162126a3f2593e3481b0113700e3d214165213f621380520e76b1977808101122570b01c085293352731113
98d665903d0452541d16056076182426a0727c0a4512a22f1a13a0e2540e25c006390a75a3b077272620f7271756811123215341776c3530b1423c2c54d2b52e0535a1d47d2036a0a107364261844b3111c1057e
703b36d33810f3b4051513f1862f204682f06b34060391712613a0e13e13026123231576d3417f1025428419067173541f095082c3282235719471316111e1493a6050412a0d757092401e15c06510246261f56e
c242090420724093092c66212303016642b175212352b76e0e6753841f312342a40522126145252d01f21774236551e642331221c6451e357391471d14c055533440d131623242d1740a01475262282143136306
442389190560d0e62d3c26c3c424180192c1210357c1520003302317400f656351170f7333770a0e7751c400046330c42727709140502a34a3821e133312724b0107f2a2783753a1905f111371a2322821d13121
dbec7b1c32525123082006b2511d0e1331e239030072445f1233e145583a5550e42c0676e2535f1425f23151393522443f0d5743c1641c07b380163d0552b503344533966421339292481b1152c7471c45014342
c528e236064223110c2f6341917e18036273153b45b0a57c2e70b2b142374623f5192852e3e4460972c21730186542761d0b344231181473a3253833310116382722b244481176c002143660c1c26c1b66c10274
b6851b010b20f2f0532f54d30224124190d5751f260313113c1450e61d352041a0140b55c1257c1716a023073852d344232a159277681e6051a34e0f52c07048041363b212246153074d0926b3401f1c77b17147
a9382f711924b184193f5372457d2c252351141e63e3a67e0837a137343925a143301d4710062d3135717444331260672c1452626513372351d6430760a0e23d0d21e2a22a005250c453394793352f154661556d
3d86991e321642d1092204f123523760c137573717c100373612a3a7310c76f030410476a0347e28116033293614f2c6762e66e2d51f2813c0d6773d078047022d45a1a3162e45025602146402d2171a46537738
c97d18130a01d0a713173033961a3803e1a0270415f1922a140250b609063403e118055343941c172210751f1c20f2663b063273a06b196752d25f3906402331215350613e0d424046702b156215390173e28464
79d3a2030522f1b7323a3360761f2a2651e25c2530d1b6441a3602d27f301693f24a29756156163040e2860a1e5222c5212643e0d720356603356a2a6341732e307210c26a170560a6181623b2044b2a3032c107
a97dee912621e1072a140211f0220e1013757b3c1453270a166613624b172653d03a1643430503130653230a2a52f257793e44e23058161221c0421a16d301701c32a2f637307483006e2b564246253626405738
db4a1bb72b1530277a24125142171430d0a62927522172521576901705396310a6143771c3354831508340670d2542230f3b5181c75c0c7422444e0e61b1d6092f405206602873e125392853f18608340593e00f
7db35fd92c0253256a0054a24216074072274a2957b0f5712816824604210720233b1622b3855b1260c206120b6680240d3120a170083f2691b352125271a4432821c08363210330851b2a15c3116b2610d2964c
0555aeb63e17a2b65d1006d0a07b2f10d1433a3c4520c175243081d633106202947a371033a13a197361e7252961a184343a1103f326062351517d1f65f374431422e360203352927430091133c3792923831060
44660255324692941a0f10c0023f2464c2974f2a5483f50a235231c012281590c673286272d40c2841e1a3511730e3772c091571c12637668022262834919632362793140a2541b380581323d396490e02730215
75f8eb411f06d18171162702e20d03062295223941c0b719301422b2173857c33512174723441720058362412245513710075130270b03757162150b7462031f3503a2042a323063a4232961109531346080e255
__music__
09 37386010
06 7b610047
05 2e1d6724
0f 02401b66
08 3c4f0723
03 762e5942
07 425b3e5d
01 1b2e6734
0c 1d393a50
08 174b7149
05 55294c5a
0e 401f5e02
0c 7b0d7b0a
0b 62160413
00 1135780f
0a 270b7658
04 59433421
03 7a791d66
06 1d2c5a70
0a 0377383a
0c 6d0e014c
0f 6e0a2c15
0c 61693a0b
03 1b0f0503
01 2e78121a
0c 1c422a7c
0e 5617430f
06 222e4f11
04 47642462
01 64022313
0a 2552005c
01 32445d1c
08 12016f2b
02 442a1d66
02 043c0252
0c 74110155
08 45641a16
02 3f11042f
07 54282c44
04 63541a2c
09 674e6727
0d 6a2d4f4b
00 29136d51
0b 7a330e2b
03 05743144
00 1c555e07
00 66567923
0f 67697a3e
09 1f5d2462
05 543e216c
0c 230b244c
0d 5c450a33
00 6a791321
00 523d630b
0a 616c5877
0d 4274380a
0d 33336e40
02 33310f4e
04 4132124f
0f 64750574
08 10330b49
0e 0d330e24
0b 31420742
0b 2e45252b
