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
0xe73c.7094,0xe5a9.4b3d,0x1af9.7034,0x7952.9053,0xd49a.9d3,0xda73.a489,
0xcead.474,0xa941.ebf9,0xfb54.ead4,0xf196.be49,0x3622.3641,0xa86a.a58f,
0xcf5a.675c,0x6345.7a03,0x10fa.1c24,0x8741.f196,0x6693.ee88,0xeaa9.b3ca,
0x3fbe.e895,0xb4ea.17d,0xdb32.93e,0x8eae.1695,0x2ca7.0625,0x6185.e10e,
0xd3a3.1c89,0x4756.2bf,0x234d.effa,0x5890.5915,0x272f.beb2,0x530a.614f,
0xe7ce.9248,0x777f.4ff5,0xf49c.bfee,0xc842.0fcd,0xf109.f9fd,0x4190.9c99,
0x8a4f.ce9,0x2fa4.e2cf,0xfcce.820e,0xc9bb.fcfc,0xb198.9d5e,0xe8e1.a401,
0x7e67.c3be,0x133a.89a2,0x12ce.1213,0x3f3f.33a,0x27f7.3e31,0xe740.317d,
0x43a3.9dbe,0x624f.cce8,0xd210.a927,0x3a3d.8749,0x8b07.ee,0x133e.322f,
0x8caa.41e8,0x3b19.d45d,0x9d2.cf63,0x3e05.bf17,0x9b8e.d8c2,0xfee8.d444,
0xfdc.e8d8,0x5b7f.bf17,0xf725.de7c,0x3cb0.895b,0x4d1f.acf5,0x664c.6484,
0xf189.f9f1,0xdd4b.cd11,0xec67.6cbb,0xa8d0.52c8,0xbf3d.14d1,0x813a.4cb8,
0xe167.0add,0xa5ab.405d,0xe931.cc8e,0x9786.88fe,0x3a4f.c7c7,0x1ef3.3e36,
0xa9df.b35,0x8e3f.7323,0x1c9d.b168,0xe73f.1d3e,0x5e6f.06b8,0x27e9.200d,
0x7316.1cba,0x79fa.2e8f,0xa20.5646,0xfdfb.9de9,0xa35d.08a8,0x3bfd.c06b,
0x65f1.67c,0x5e10.cdee,0x7e8b.24aa,0xf40e.741d,0xf02d.d69d,0x1b28.6779,
0x1c08.cf84,0xb5de.77d2,0x6c8c.f8f2,0xd26e.186,0x3e2c.7432,0x2067.60f,
0xce9d.e497,0xb964.213c,0xf33e.2a3e,0x1cb4.9df3,0x4ccb.a01d,0x2464.9699,
0x459f.109d,0xfae5.8f96,0xea94.f8e8,0x2de3.cd0e,0x5a9a.55af,0xc7c6.2fdd,
0xc1a2.33ce,0x754a.25bb,0xe8f1.f087,0x8b27.c3be,0xccbc.c722,0xe115.cf45,
0xf42.a233,0xd3e0.0e66,0xea52.ae87,0x47c2.7fb3,0x805f.bc9f,0x3d0a.88cf,
0xdf56.9f14,0xa71e.3615,0xa533.424c,0xed4b.8184,0x814f.a7c3,0xf3e1.933a,
0x2012.e0ae,0x365.32d4,0x2301.4c25,0x2bc9.f1fb,0xa9a1.62d,0x8a7.c50e,
0xf377.b16,0xf997.9f16,0xe738.0388,0xd945.f8ae,0x402b.bc19,0x9732.b068,
0xeb5e.3bc,0x3727.c59d,0x472c.5b93,0xb894.97ab,0xca84.7ee,0x9010.e8c2,
0x47fa.52b5,0xb703.1605,0xf7a5.0829,0xf159.2ff3,0x3be9.1876,0xd6b0.4f6,
0xdcd7.483b,0x2a7c.03c4,0xe8bf.4bc3,0xdd24.ce3b,0x7fc0.ad7b,0x84e.864c,
0xa0e.482d,0x220f.3ed4,0x628c.e05d,0xa05d.eeff,0xcf81.77e8,0xcc99.51bb,
0xb71f.e4e8,0xbcc8.9b42,0x4cb2.8526,0x9a54.23cb,0x7810.7d86,0xd1a2.b659,
0xef09.8fac,0x1ea0.18ca,0x3a2.a3ff,0x80c2.540a,0x3e36.e877,0x3f3.3a36,
0x1b73.829c,0x5bc2.fa13,0x90a7.40c,0x9853.9f77,0xce0d.d7c2,0x7c3c.3c25,
0xfd63.70fc,0x7800.fb95,0xdbfd.7cfe,0xe60f.6f8d,0xdc01.e7dc,0xeabd.7f73,
0xe592.a94f,0x7cf8.57e5,0xd21d.2f82,0xee65.7735,0x7a3e.3ff1,0xf32f.88f5,
0x4fb0.22f5,0xcf33.dfc,0x6c2b.1e11,0x9780.2bb8,0xf41b.8783,0xb307.13ca,
0x47f4.dcf7,0xcdee.4f2b,0x9cc1.c8d1,0x6af3.7e1b,0xf65b.9ef6,0xe3a.ff5e,
0x8038.bfcd,0x1fff.f067,0xee41.009e,0x8301.1fb5,0x7669.7759,0xc4c0.88b5,
0xd14f.09ac,0xe2b8.9bcf,0x27a3.ead1,0xf0e1.1734,0x9b9a.9e84,0x4100.ce25,
0x6e07.8e07,0x1344.c7e5,0xb854.031,0xffee.1b1b,0x587d.87c3,0x771c.723e,
0xa3fc.ced4,0x7e48.1b7b,0xebe2.8f44,0xb2bd.c7f,0x9a4d.ce51,0xc47d.1e19,
0x5c7.5dac,0x1f6f.87f1,0x2271.ab31,0x40aa.c81c,0xd601.fe,0xd9d9.9fc,
0x5cc8.2504,0xd764.7cde,0x220f.8578,0xf067.8e82,0x79f8.3dd7,0x12e.e2b5,
0xaa60.8e5f,0xa500.47e5,0xc013.ae78,0xb0ae.b8d4,0x8e42.df13,0x7057.84a2,
0xf28a.a73,0x10f5.651,0x9ab9.1555,0x6524.3c1c,0x1d5f.bfe1,0xdfe0.cb84,
0x1416.810f,0xe6d0.e8,0xffe7.d42b,0xb9a2.809,0xbbe1.5e59,0xcd15.4cc5,
0x9aff.e87e,0x331c.89c1,0x51cf.cadd,0x1d24.ebae,0xe22b.cb96,0x6405.9223,
0x4837.a824,0x435d.32cc,0x842d.f4fe,0xcb3.cb1f,0xe12a.f82b,0x977.230f,
0x9eff.3bd5,0x9131.2761,0x2116.89d8,0x13c0.fd13,0x2b84.10e,0x8f01.01a4,
0xdc40.7998,0x3385.e801,0x8328.c7f7,0x32ed.b075,0xb240.3b5d,0xf047.5571,
0xe587.7a26,0x10c4.1bc7,0xa161.ede,0x3062.c29a,0xc227.3c39,0x778b.119c,
0x6973.0213,0x80e0.6cec,0x3408.f259,0x99c3.1483,0x1c88.ae28,0x472a.9a04,
0x237c.ab73,0x398c.b229,0x711c.e064,0x15e.8dc2,0xca8a.6ea2,0x69d.8f1c,
0xfd73.f096,0xb491.1508,0x9030.dd7,0x83ab.4b18,0x4e04.d306,0x75d9.0e51,
0xb8ff.943a,0xbd2.47f9,0xe4cb.27a7,0x6351.d6,0xcd28.dd8b,0x6fee.c07,
0xee5d.0679,0xe4b1.d443,0xc65f.cca1,0x9072.0dcf,0x86b8.1b1b,0x5661.229b,
0xd781.5f12,0xf692.8cf8,0xa43e.7903,0x8252.09e5,0x53f.9284,0x1e9a.0505,
0xb743.7b95,0x9f14.722e,0x8f3a.0601,0x2f0c.ab3b,0x2ac9.ef7c,0xc958.8df1,
0x6279.262e,0xe81d.94f4,0x4f51.13ea,0x47fe.0b47,0x8686.42ba,0x412c.0c56,
0x9d10.f6bf,0x9229.72e3,0x581c.c0b,0x2be6.d83b,0xfbc0.e29c,0x8632.f587,
0xc7c6.9792,0xaaf6.67f1,0xe247.cfc2,0xc09d.8549,0x616a.47ab,0xf4eb.b3b3,
0x65b3.781f,0x47e5.de32,0x61fa.7014,0xdd19.7d7d,0x1c0c.1ce4,0x4f.804b,
0xef98.0373,0x63d7.826c,0x8f9f.a6cb,0xc869.6d48,0xfa9e.e0ce,0xd011.346,
0xffa.7fc4,0x2c8e.92a8,0x2464.16d,0x57d4.7078,0x7cc5.08f6,0x887c.b579,
0x40c8.86c2,0x7339.baca,0xf868.f05,0xadd8.21da,0xfa18.1223,0xf325.e903,
0xf846.7373,0x26dc.f1b9,0xe4ab.2b0f,0xa444.fe53,0x7291.1d1d,0x132f.4fc2,
0xb691.2ee2,0x8824.c452,0x26ca.f0ce,0x9f48.93f1,0x8030.782d,0x15fb.5275,
0xec27.85b1,0x7107.e926,0x99f0.14c9,0x948e.743,0xe8a2.3d2c,0xec13.ee02,
0xe1c5.180f,0xb0f1.8d08,0xd280.b828,0x7e5c.a78,0xc73f.cb8c,0x3b18.6bf4,
0xf7b.8e13,0x7e93.73d5,0xd4d7.a472,0x6809.91e9,0xc11c.9eaf,0x1fa8.8efc,
0x25e.d2c4,0x7c62.9133,0x3ba3.7ff5,0x1e09.143f,0x9853.9683,0xe602.fddf,
0xeb9c.7f02,0x83a5.8618,0x649b.f165,0x55cf.c407,0xd0b7.78b2,0x2782.bb11,
0x7c24.7c8f,0x6701.f424,0xd688.b75,0xc985.a44d,0x63ec.d343,0x14bd.f393,
0x4d02.884,0xe246.e657,0x134f.f927,0x4a51.1282,0x8720.da52,0x4b9b.9e5d,
0x8d00.b5d8,0x6909.15a,0xed60.0fdc,0x2f78.df73,0x9ef.2f7,0x6b51.6cc1,
0x5710.0729,0xcb9e.0237,0xb055.9c2b,0x63f9.9222,0x3957.a9be,0xb94d.cb87,
0x214.3ec9,0x9cc0.a40a,0x91cc.6cc8,0x5be8.4387,0x6899.f90e,0xa8f9.be1e,
0xd77e.c504,0x2149.3a8b,0x8cf4.3c89,0x6e2e.b2cc,0x24b0.b37c,0x3c85.3c8,
0x8fcf.a40b,0x74c2.71ee,0x3d1c.a474,0xb705.afca,0x8f22.bd31,0x90ac.a107,
0x34f9.eb79,0x1126.89e6,0x1a27.ab22,0x7c2a.109b,0x3a27.68d5,0xd056.03a6,
0xe43c.240a,0x348.213f,0xa291.c137,0xf9e4.ce76,0x88ea.4eb9,0xd59.0aa6,
0xb3de.ad18,0x7ad5.a20f,0xf256.141b,0xe0e4.7fff,0xfd31.2337,0x334b.a4b9,
0x781c.adcf,0x23b9.344a,0x114c.889e,0xcf59.f4d3,0x728e.7ed,0x176e.8272,
0x3f21.45fd,0x2bb5.c531,0xf492.5002,0xa47a.5908,0xea91.c56c,0x926e.51e7,
0x4a7c.f24d,0xafa.06f3,0x5d60.f022,0x20f2.a172,0x5038.3c23,0x384a.bda6,
0x715c.3c69,0x483d.74ce,0xb949.7d97,0x23fb.fc21,0xfc35.0fb3,0x207d.5ab1,
0x73b4.674,0x36a4.93f4,0xc854.a754,0xfa24.8f08,0xbc1f.2896,0xf87.0c47,
0x4e70.f399,0xd985.7e08,0x551.b2ed,0x5c2b.39ce,0x1de4.9a4a,0x5c54.0fa2,
0x677.d88f,0x13ff.acab,0x78cc.cb51,0x23f9.192c,0x5758.bb0a,0x2c0d.43de,
0x43dd.40cf,0xe585.dde8,0x5426.f142,0xdda1.8749,0xb445.4b2e,0xf6fc.bc41,
0x339d.64b9,0xb89b.14cb,0x3208.dcd2,0x481f.0849,0x8abb.d13c,0x7586.3909,
0x122d.409f,0xd0ca.e73b,0xbe01.5e5c,0x8827.f91c,0xd628.4faf,0xda26.0171,
0x303a.05a6,0xfcad.88f4,0xb93f.ab1e,0x66a6.7519,0x9806.d00d,0x564.197e,
0xe815.8f16,0x866e.2443,0xaa88.1752,0x4b56.e807,0x307c.7cf,0x89cd.a887,
0x974a.3942,0x88ba.1bd9,0x48fd.7683,0x4d2b.9794,0xe4e9.3c1,0x5f14.30ba,
0x7dbd.14da,0xc84e.fa14,0xc011.4117,0xeb0.9e9c,0x173c.72ac,0x23d.21ad,
0x2a17.2cd6,0x1427.abe9,0x624f.05a7,0xdb8a.13eb,0x252.a08f,0xcdd0.ae79,
0x8498.0f75,0x4a00.6acd,0x86a4.f95,0x1428.da87,0xb02f.b41a,0xc8a6.a248,
0x8e81.5632,0x3b22.df89,0x8b44.3def,0xf06.aa77,0x3d1b.f41c,0x55a8.fb26,
0x549f.868b,0x467.b175,0x7792.6efe,0x5c8b.a2c5,0x57f6.0712,0xb9d2.5d3e,
0x4a87.1e36,0x42c3.deed,0xdc7d.08e8,0x1892.a4a6,0xd6c0.e61d,0xc84e.a4b9,
0xe9bb.89af,0x2793.e7e3,0x2d67.23e8,0x555e.213f,0x8642.27c8,0xd997.97cb,
0x5253.099c,0x9ea2.47dc,0x9f4e.0724,0xba09.fa72,0xa1d.c9b1,0xd928.d467,
0x4e2f.8803,0xc0de.e88a,0xd405.0231,0xc782.28f5,0xf241.a614,0x55e2.8694,
0xf1fe.18c8,0x38fd.f4b9,0x9352.f9d6,0x352.56f4,0x7678.3d93,0xa543.a95a,
0x49ba.0682,0xfe51.3c55,0x1a14.6503,0x3733.b086,0xeb9b.1c8b,0x4a65.d3c7,
0x1ec2.4ed8,0x7956.2bdf,0x66e7.1ba9,0xc47e.5c73,0xa305.3ad5,0xcaf7.9f23,
0x72ae.1874,0xe499.13fe,0x7ce8.c3a8,0xe027.a588,0xd404.2c82,0xe231.e4d1,
0xfe3a.c2bf,0x293f.40b,0x6c9c.7c63,0x801e.b5a,0x60cb.33d9,0x3f46.bc9e,
0x560c.df16,0x3e5a.5589,0x2936.587b,0xe91d.c1ad,0x656a.81fd,0xff91.2c6c,
0x4149.7404,0x89ee.128f,0x3695.0efc,0x3b18.2687,0x497b.21eb,0x5963.9b58,
0x9a70.7b91,0x6ec1.473c,0xeb9f.9e99,0xe3c8.1ecf,0xe8f0.0b9a,0xa656.4de3,
0xd0a0.6cc7,0xd10.80df,0x7a12.3da9,0x5f37.372,0xe449.53e5,0x5ea0.b626,
0x7b71.d2a9,0x4661.79f4,0xaa92.0e8,0xb29c.8784,0xdb3f.f4ce,0x2e91.aae7,
0x4a4d.d3d2,0x133.a102,0x42f5.b1ff,0x4ccd.4a3a,0xcf2e.7b77,0x52ab.47cd,
0x2622.be35,0xe854.a13d,0x595c.ead5,0xebb5.0a36,0x216c.2a2b,0xfa4a.3ac3,
0x75e5.89d9,0xa903.bdfe,0x43ce.84f4,0xf210.0577,0xeb32.e4d9,0xab3e.4cdf,
0xb963.a107,0x1365.3182,0x1669.ce95,0x80c5.73d5,0x4b6.2e99,0x42c0.a5c,
0x16f3.fd33,0x9d9d.a791,0xa2a.5159,0x70ba.263b,0xaa3c.881b,0x7312.1979,
0xb08e.dd48,0xe6a7.c54a,0xe736.e75,0xaa01.b3ca,0x5b4e.4c87,0x801a.dc9a,
0x6b23.84c6,0x3dd0.a383,0xeb80.83ae,0x8094.4ec2,0x428d.c353,0xdeae.838d,
0xf41.7426,0x7a85.36b8,0xabbc.e12a,0xa2d2.5c08,0x1426.fb89,0x47cf.733a,
0x742a.e7e1,0x7237.d138,0xcd04.d9ec,0x2398.e244,0x7aa0.d7e,0x51cf.06c2,
0xc29c.4f9e,0x60d3.a11d,0x6f60.ad1e,0xbbb9.aca5,0x4a80.768a,0xcc50.50aa,
0xae63.c9e6,0xc490.5f,0x3fb9.cf7b,0x4c9c.c074,0x25cc.6bb,0x11ce.c0e1,
0xd807.03e6,0xe1e8.84c6,0x69e8.b594,0xaffd.5d97,0x40f7.d2eb,0x1cfc.303b,
0x7357.d6c8,0x5b98.35a,0x7892.7d73,0x621.cdc1,0x9150.c8ce,0x3cd1.06e7,
0x1cff.e987,0xd6d3.1cf,0x2673.9512,0x780d.f151,0x6202.4315,0x64f2.b7bb,
0x231d.63,0xaa5c.544,0x7624.601f,0xd6a4.797f,0x8a95.aa13,0x9c1e.d87a,
0x5e16.d38e,0xc009.2709,0x2ce5.a9e,0xc0a.e7ec,0x507e.ba04,0xc570.4392,
0x975.4cb8,0x1ca3.e447,0x1ca7.909e,0x78c1.ade1,0x3020.b2ce,0x6403.959e,
0x629a.aa6f,0x2a60.3ff,0x9d2e.ac8a,0x75c6.2a1f,0x15d1.4dd1,0xd19a.08e6,
0x37dd.b601,0xb464.7586,0x20df.2a3e,0x5f5f.5841,0xe760.383e,0x2af5.c332,
0x48b7.3345,0x6e7d.8349,0xec44.f319,0x5099.cfc5,0x7e8c.69bb,0x30d2.c296,
0x4e2.1e58,0x35c7.4d15,0x5580.15db,0x9ec2.25b1,0xef0.52b5,0x4ee2.456c,
0x6067.2a26,0x1237.f87a,0x611e.c077,0x1b43.0228,0x13ce.489f,0x7380.0497,
0x7f8c.c0d9,0xde08.b293,0xd258.781e,0x7b82.7eb8,0xd1d0.9b13,0x82f2.4239,
0x38b8.917c,0xde9.2b02,0xb0a1.f634,0xba56.6f7e,0xbc3d.cef3,0xb856.8642,
0x6ca1.fa22,0xb353.745b,0x1f8c.e817,0x20c6.90cc,0xac5.22d9,0x6590.6971,
0x16d1.801,0x5842.e735,0x1d6b.027e,0x7365.0f7,0x21fd.0d83,0x98b3.18b2,
0x420a.1f22,0xc804.f2a,0x7e12.3a3a,0x4ab2.4e3a,0x975.aa8e,0x1287.f8b5,
0xd254.9b44,0xf981.f81e,0x50c4.d2c9,0xcbf0.6055,0x731b.704f,0x81a.c133,
0x9768.c43f,0x2195.9199,0x6e61.5791,0xf596.cb16,0x6c5.0c61,0xef73.3add,
0xcffa.7b1,0x141d.4035,0x3001.adf5,0xb1e0.c7a3,0x2a10.2789,0x9b05.ffbc,
0x4636.1cf2,0x93f1.d3c4,0xf2d5.9dea,0xd15c.777d,0xde75.b645,0xa2b0.ae16,
0x43f5.00fa,0xc2c3.2071,0x4dcd.79dc,0x66c8.8f49,0xa914.d197,0x88c9.1cd8,
0x17a0.e601,0xfe70.5cb9,0x1267.0421,0xe200.789b,0x2936.b68,0xb6e7.5d7d,
0xd4e2.a3dd,0x3638.9969,0x613e.98c7,0xa295.5b63,0x3e66.447,0x227d.5cd9,
0xca58.e99b,0xebd2.880f,0xc4d4.b0f7,0x5988.e1ba,0xfa90.a189,0x476.c59f,
0x5601.f599,0x97a9.cfeb,0x7614.fc8c,0x91c.0c62,0x4b03.7c51,0xae83.7ca3,
0x8759.b80f,0x4af2.a38c,0xdbb8.a0da,0x4f65.bc5d,0xec6.817a,0x460c.39c3,
0xf0ab.80d,0xa611.f7f6,0x5c90.4353,0x1fa0.fde1,0xf13.6912,0x7e9d.274a,
0xacea.2ec8,0x310a.cdf8,0xc8b5.f516,0x7dd1.0fe,0xb4e5.701e,0xab3d.e989,
0x21b5.01d,0x5147.9637,0x3e99.685,0x60fb.2e97,0x5f83.223b,0xca16.8ca6,
0x80a5.e833,0x9850.6e9e,0xaff1.0c2a,0x90e7.a8c8,0x2730.af9f,0xc406.8ec2,
0xeb01.7c5c,0x4f36.21e8,0xffdd.148d,0x4338.d3c5,0xae3.e53,0x1106.1e89,
0x2b9a.3ff3,0xe4de.9bde,0xb6b.0ee6,0x263.b66d,0x9c3c.6745,0xd83d.bf38,
0xa20d.561c,0x99b8.26b9,0xe99.c784,0x9b03.6487,0xd01d.a094,0x3785.5e26,
0x3024.0fe2,0x7604.0bf6,0x39a8.916e,0xb040.5f6a,0xea04.c55f,0x238f.5711,
0x6798.1764,0xce8e.3d61,0xb876.68f1,0x85e.c5d7,0xbbb1.833f,0xfd5.85a2,
0xe0fd.5bc5,0x8c21.a051,0x1201.f189,0x3c49.7d45,0x80fc.f59a,0x3043.783a,
0x24f9.775d,0x328e.64c8,0x1941.dc58,0xd51.8af2,0x973d.7cec,0x8bcf.7513,
0xb28e.01ab,0xa857.c594,0x343d.c4db,0xa498.f688,0x8e9b.e08f,0x1cc9.9612,
0x4c46.a635,0x4785.140a,0x9dd8.afa4,0xa1e8.ce2f,0xb8e4.da3a,0xc183.7f0e,
0x1cf9.e96b,0x7a1.f38b,0x4996.1014,0xba0a.0eb9,0xf7bc.232e,0x60cb.ea47,
0xdba4.5186,0x711f.5998,0xd99b.40ad,0xb589.1cc8,0x31a3.9b47,0xcc69.6134,
0xb4d4.60f1,0x627e.512,0x2837.35fd,0xa2e5.2433,0x84db.38a5,0x26ae.1e73,
0x49ea.283b,0xab14.0295,0x42d2.6b83,0x7121.70a8,0x7025.6c34,0x15f8.a49e,
0x664a.749f,0x9bc2.fa3f,0xd391.8dee,0xb39c.0355,0xc66a.510d,0x74bc.0283,
0xe298.b024,0xfcc8.fa8e,0x27e.02c4,0x9624.fc7,0x91e7.828e,0x9b56.bc18,
0x1991.99c2,0xc9c.fc84,0xc968.cad1,0xf094.5519,0xb315.b313,0xf1b1.83f8,
0xcf14.999c,0x57bb.43e7,0x9b59.a80a,0x1d1f.52b3,0xc8b9.604d,0xd3f5.f1cf,
0x71b.e9e1,0xd544.d143,0x4711.5504,0x9989.423a,0x49f7.b003,0x7cf2.b454,
0xc132.a6a4,0x4594.b69c,0xcef8.e74d,0x8caa.1cc8,0xe017.c156,0xad1c.ec89,
0xf4db.9c64,0x29b8.6b07,0x1474.156c,0xf568.a9dd,0x639e.2e3f,0xbe73.62d4,
0x34fc.2c21,0xe9a8.b40e,0xaa23.07d3,0xa3a2.1158,0x98e3.a82b,0x4f56.a5d,
0xe973.41f4,0x818.9e8,0x4c1b.5c9b,0x1ab7.e78,0x3801.87e1,0xcedd.3994,
0x1d10.bdb1,0x55da.6d0f,0x8413.b32a,0xe81d.04cd,0xb9f8.31f3,0x8d55.3c29,
0x855d.603e,0xf454.315,0x844e.7a9c,0xf068.b7e8,0xfc49.3c23,0xbe46.edd4,
0xa8ef.270a,0x7437.e769,0xfd62.61cb,0x3d5d.1cdc,0x8dc0.9791,0x60d6.9f0a,
0x1b8d.6658,0xd509.8e69,0x70c6.1bd3,0x25ce.7e4,0x7ab9.50c2,0xef74.78f8,
0x9959.b479,0xa32b.ded8,0x8a6.e7ab,0x71da.46de,0x3930.7418,0x8f46.373f,
0x1ccc.40ef,0xca58.a9fc,0xe4d0.62c6,0x7dc7.1cfc,0xacf3.31ce,0x5c2f.1c17,
0x9f90.9f3f,0x36d1.959b,0x4e63.e939,0xec78.dade,0x328c.7ded,0x5232.d907,
0x9b03.cadc,0x5df1.a8fb,0x9e1b.f33a,0x621d.31b2,0x3ef8.d265,0x744c.ffba,
0xabd3.7ccf,0xe5f1.b8ca,0xd71c.fc76,0xb494.56fb,0x426d.f571,0x8e7e.8a7e,
0xcb7e.782a,0x7696.3653,0x8d5e.5a26,0x71cf.c20b,0x8665.45dd,0x6fa3.b9e2,
0x964e.7e6c,0x3f42.612f,0x3438.a633,0x399b.1d07,0xbf50.3a93,0xebc6.31ef,
0x45ec.2da4,0x4d15.6ec7,0xe84e.4fc8,0x4568.64c7,0x1e35.63bf,0xdd4f.cc4c,
0x5fc7.1a3c,0x8dcd.f988,0x9bc2.4c9d,0x17e3.bee3,0x14e4.b91c,0x7819.752,
0x2604.a90c,0x959b.a073,0x18c8.c4e,0x8ee2.39ef,0x6c6d.e826,0x15f0.684e,
0xe8e1.742a,0xad0c.38e2,0x2b8c.a2a8,0xa81c.c9f9,0xe126.d14b,0x324b.a927,
0x4829.837e,0xc00.c60d,0xf463.338,0xe53d.e498,0x99cc.b8e7,0xc19b.9f88,
0x96b1.fd71,0x23e5.5aa3,0xd7a6.fc19,0x18b1.99ce,0xdcca.c5ca,0x662.2bd8,
0x2543.363a,0xfe82.a91a,0x9b14.e23,0x926c.2e74,0x6c65.7b56,0x53de.2817,
0x5318.fc63,0x639f.8adc,0x62d9.9485,0x350e.6d18,0x7361.b1f8,0x3da2.90cc,
0xf68c.3cc2,0x24c9.e93a,0xb331.e19d,0x8e7e.52f2,0x3951.0734,0x3488.ab49,
0xa5e7.f47b,0xdfff.df33,0x7c53.6f48,0xe32a.009f,0x7652.c0b9,0xccc7.368e,
0x4639.f8ad,0xc950.2ed7,0x6823.b19,0xb3dd.18e8,0xb60e.af61,0x9cec.01db,
0xf062.92a5,0x8c5f.cfeb,0x1a0a.66a9,0xc19e.71a9,0x45f3.69c1,0x7ff2.6e99,
0x18bc.5e2f,0x655c.c388,0x6b2b.48fc,0x494d.30fb,0x16cf.48e5,0xc318.a401,
0xeb82.f9f8,0x79b1.99a3,0x2f6.5aaa,0xbd96.b06,0x4f39.94a8,0x8269.e528,
0x3723.af01,0x78c9.952b,0x3081.59ea,0x40ca.f5e8,0x1f7b.0e4e,0x205e.12b6,
0x916c.6335,0x127e.4079,0x7e0c.5e2b,0x44b9.351b,0x84f2.dd43,0x1e71.00c2,
0x54ae.8c5,0x6bf8.34fe,0x938b.c5b,0x31a.5824,0x9dc9.59f9,0x6762.2c52,
0xa398.b7b9,0x9e2f.4433,0xab8c.f2b3,0x3de6.f0a1,0x7aa0.797e,0x9563.e26e,
0x137e.fd17,0x8e20.beaf,0x373f.bf96,0x74c.28fb,0x3fd7.0bc7,0xa795.2b23,
0xd0b2.afe5,0xb3f9.39fa,0xf2e7.f332,0x2390.e609,0x7432.8338,0x9d7b.04ac,
0xf61f.5f5e,0x3fea.26e6,0x98f0.33b3,0xe940.8c04,0xcfcb.4a0c,0x33a3.f16a,
0x17f4.7674,0xccc.7d2b,0xdfcc.3958,0x3115.112,0x7178.cad6,0x7d0d.8e7e,
0xf912.6866,0x1e79.3082,0x4651.5e3c,0x184b.3b2a,0x3f41.39ea,0xfb44.e98d,
0x5ca6.5458,0x5e7d.b732,0x8e73.f999,0x3893.fda1,0x5e63.442a,0x9e92.29b,
0x5944.788d,0x57aa.41b9,0x43ca.ed66,0xcd78.acfe,0x977f.04ac,0x37aa.9c38,
0xa351.1cc,0xb9fb.971c,0xe7fd.4d62,0x850d.6372,0xc546.7fe6,0x367f.75a6,
0x28e7.eca2,0x27fd.e1d3,0x68c5.e4f2,0x8031.1ff5,0xb748.3105,0x4fb0.cc5e,
0xd50.55c,0xd73f.998d,0xff07.c561,0x4c6.34dc,0x34e4.ae7f,0x8d3b.1875,
0x1536.593e,0xb294.53b3,0xcd3f.8392,0x6abc.fa56,0xbfeb.e2c1,0x9a89.9757,
0xc503.633a,0xa22b.2c6,0x6638.2f98,0x9b06.e697,0xd640.7326,0x1fc4.cd7b,
0x7d64.6667,0xa13f.7ab3,0x232b.12c6,0xbe02.a4c7,0xe7f3.b394,0x4cfd.9d8,
0x60b3.550d,0x8924.9f1e,0xcb95.068a,0x2b67.34,0x8e3e.57aa,0x2fd3.b295,
0xbfd3.321,0x79a5.a41b,0xa262.28e3,0xec01.9251,0xe4bb.6fd4,0x25e0.b4ed,
0xcc05.036f,0x2762.2d9c,0xfff.e829,0xd1cd.b45b,0x.000a,
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
if(btn(0))then owl_x=0x2.2 end
if(btn(1))owl_x+=0x2.2
if(btn(1))owl_x+=0x2.2;return 2,3
if(btn(1))owl_x+=owl_x
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
local dy=frame>=2 and frame<=9 and 24 or 0
spr(16+frame%4*4+dy+dy,owl_x,owl_y+dy,owl.w/16/8,owl.h/8-3)
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
87c9dedbb4f4c595ab82846939a345ba5da2837bea818155b5a338c94a4e69d9213cec2b1d527061e3d01e662dab3acd4c0209e6f9101b700207a12267941697
a76275efd2e940138d130cac3407526b2ff147bee517a181498e5fd37d7b67ced1f20f3b2ebc4b385bf1b6d7fe7da51876666666aeff0337b28ff27bd90ae5fb
debf7b340e6ffefda808ff27bc7fbe7bc7f7a035892c416a035892c416a035892c416a035892c416a035892c416a035892c416a035892c416a035892c416a035
892c416a035892c416a035892c416a0358fcd1eb9fbc397af3efd1ff958ff9ef799bff97eef0fbf9dfdffee7ffdc7bff033fdeccfe66eb99977fdc7332330766
6e7af3cacf1e7cf38b93ebdf6e7f4f3ff8ff0f3ecef87faff1ef9ef05837cffefdcf7cff1fbbfffe7771fbbbef6ff7c7bfffe7bfffc7bee7afddbb9977369027
c978b40ef83d936a37c47e89ec13d936a37c47e89ec13d936a37c47e89ec13d936a37c47e8fa17e8c2b9728cd7663af7edf0e3fc796cbfc392e5f7ef464cf4a5
61efebf1e7edf11f37a07b48bf36ff958ebfcb304161629fcb5fac6018049b6e7cbfcb5d2caf7eef46f9f778077527ff4e07f95afedbaddf1fe3f6f808df37f7
2afcb52c4a2ccb335289c8aebb1aed8c3fef42f97be5f374bc744fd75e1bf7cefcbd1c7249fb197edf98e3fea0189f98f3f6dbabcf51e7ecf86f97724df4accf
bf7ffd1f44729bfc7732e7693dd3ad5fbd24040d8c8b8ffcbb0af3fc589f17e3fe4400b47f72ffc9c79e773fd72ff1f16ef690cb8f442cfeb5e7c7164fd48b43
6e7ed25ef5233f8cf7eddcfdeef39547252f3743dbb1ff3b45eb368cffdd4ef7289d6c78046e394f0289b939f7ebbc1b5fdd87f97ff67eff6ef6907f70afff1e
f9fe68f213c7df196daf051ffc6c3f52699ae7e25ff7ec78f9773bef8f97fcd11df2a00397ef7773bcba806ccfcb318bff9e2ff7a5e74ea37eeebef11a16cffc
b310bcac9cefbb3642e318cf71eef4ef99480799cfd534cbff9a138f8b01fb1b3866279dbf468ac7c700a7b966cbffa39dbdbf468dc7c78df731b32991c133a7
e8f19d7a448e3624cdcbae53fcaea2ff87f29dbc2ecefe68efdfdb87fe57c99acff2b77695676d74ff75b1f0a744f21dfecdefe56fadf851ebab870bf2f110db
75d3738e7aff2ddd8f8e81e7830f1fdc99e7c44feb4a176fa14b169c2dfbf02cfdffa7cf1cb171fd2ed7a8f6bfb7991a7fa21435839335e70c5ce103ba7f5d0d
f79dbbae5675c4f8bf409ef9c9d900dbe28066b48ad0b46cf1eedbed7878e351eb77b00a9ce28b15c73767091ada33dbd30be77cb839ce44ce1e21e22039e5f0
c96fb4188bedc33fefde2b7ecadf4e5a3a6f405ef1398e79008df1248644e0d7d14fb3b7f4c8db7682af330a71eea3bef79768cd8707242ffbce1af78ce5a7f7
0f503c563fca784dc90ae7f593fa672983a618ed40ccffc8812b4fe9ce10c8523c088f558cffa6f7f482cc08e9b9d37ab0caee919f2c3bc09913f42f779a111f
b8de3eb47074ccbc314df64a7a7e280021c00ee63075c9d2c28bff696105ef0c017101cbf38f2a1c5ac7e84169830d3919ce18cd58407c46b03f4cf10b69792c
0af2f5ef75d30766841e300a7025a5527f489d306bfecaf71edfb676e2aef0cd5df255ef9de76f737fffd04eb7e41c1869585a7f84fde1c861c1dae410ed3a57
427668f10aef9462c1af215ef79dbfb5dd90dfff67e6ebe095ce91b0ff1cc3afb7719d3381ec39fff89ca10c81cdf1abfb4909f385858f205efbf020e50097f2
14c3302798ab58502b7f46199ed585072f705f026f01f3a7ce016e5cf1c7e90ffcf4f2e9e6c6c64ffd079bb46f00c4df10cfd8efe838b1c813ed188ff18c8312
bf776f0061229b21a63cb781f7e60bab6bfe2d3958c6500a2a79756d6d6d07c1fe395bf288c77f1def9e246a7fdf812c1ec32fb8ce3a78af072a6f261e3d5f78
d9cb140ee8efb8beab310fcf60bcf75f2e2bee42ef41006c7642e54a70df95246ee0207a1b3777c4fe94646ee26e0b045ee11bbcbdb00c55285f3f7cfa707ded
ee3228b2b642fe5d5b7390827a318bbb4e6cf6f73496bbb9b68af0bfa2e6ccfe050e9d202d383ed76f70b0c3ee1b3004601ae30683831e133c563fac5548f90a
f10717179861bb1f494efa61cc2f60183a9cff338600dd62f56e2dd7447b74efc0f28ebee7ce0c1738c2606cb76ce58ceffa6ffd4c85114cf90ae100377887db
27346fdba73ec3493ffefca2061f07ff6e60cf1c29bb2b2b274eed8c0300c216ebf033c9ddce503674fad17db746030c01abf4eb06e5def1a4407e5433bdf1af
860f4f0d9dba320d987f204edf4f2eab7fdd908248b128cbf2ea73e1c90b21bb781922a48695ef8a118e30e48cd7d52c83b505a7719ced9ae1236f34af0bfbff
60c362520df922f10097b397189b38cbd9df764a0046ffb69cfbeeff6b40a20913e7764a2ce0d76977684356a2ffd7c7046c26033f2cf2ac798de3c9dc37830f
df18f890757de4c5f0c9cfc98ff2c9cbf92664f09b9831ff50e3171f75219e9c7fa6f9863f956abdb307fdd8b766c0718eef512b64de30c16abc6086c75ced08
c1ae879f0c5dada503edfcd8fae664894c9dffef22870f512f7fe4f17f94d11ced1f98739cdcdcf6b7b7067fc4f35c87d1242df8ae0e5d7373ee19d301f3ec2b
e15a4804f7fe48383cc714e309385d34b3ab8beb8d0371eac91aefa9fbf12f3eab06ec7ae4ab8e0bd98b1cfb34cf74b67c890a35767de2befca7c40d9155b7e5
ef4ddd4d13a8f333af19081f70cf21b79fd23f1f2d4e30540f61c6351ef5f66d6defdc33c75fd683e42f3605f85b3aeb947d4236bfbca0bdbfd04432e60e0f33
b6b4ff5f6efcf7b7b9deb79f7668e9818c1b36ac10c3dbdbc1f3e21362c908db4f43b38979cf9a40e2eaf9e687a7eaeadd0d82cd5b396ffa681e719bbf8fcb7f
f2f042fd3773a7dbfef4c95c38308403024f0dad1054a78fce7dce2e2e7dbebeffe7df75a9b824e76cafc82ee0cf14f8c5e9c83ecbdb07d40994eb486d2b0fe3
fbd10737364edba02f4ff00887ff4ef58b17ac1b6ff6a1f36596ce71c5387e1edf5bb1c20eed346b7b2597d810e1431123ef5bf7787231e72cdf7c2f7782ab77
d5a30734e060eef281bfed7e070b7abc197c3d17d927466e718385baf0d3c6f90e5808c77207f6fd42feccfdbb8d87afbe256e78e4c972aa087d4361e783306c
7ed92cd58b8fee3fdbc0dedd504b52827493ffbb6872eb7779e184e3276ee9f9773f98341637f315a737361df0dbfb846ee6cd760ef1364efd24e6b74140aa32
018ef949e541faf134d66bfb6b2fe991eba877dd899e721e3c47915ebfe24d04e7f5959c04eff66f04a1014803fb37e10c93bf504d0df540d3c870b7c1064ced
7f276ff236a61181d70697b5e7189b88df01f3dd58b43efc142c7218cb73e7dfef444ebb171d372ebe1b24142d609ea3130fac96ac358b07247ff2f2f20e18c6
3020e08a41c2d09ed9b900cedd9e3e2193cf700be9b98e21bac7ddfaae178bfce915048b469fa8cbe293cb9aaf53125a432fe09f175a9e25ece72b76edf3f593
19da4627e58cd0e7372f29483d9dce3377bff4431e593bd4794afa45ef44bff273e640f67507147f3faca0aa38b176a8dcf503fdbce66dedc593b7ffd8ded3b4
8a300bffb18608a242520be5e976ea260b3ecbdb7c9503ebae527201de56abe15984a2ffe5f82d9e31f5ff1a9bffa91bcbd9df6fef6b1a2feff3d93f672ecd8d
8312e4d3db00113d8fae2f2ddd5713cf91a973ed87a853c38dffbe3479fe14d3f728d0e97a9d5e53c3ce408fdf9c7feced19ef3cffe717df737836f47fb25cf5
92d3c9ed60afd1ae3082397b764bf852f6f2e8f9ee2ded3b73ace3460baf732b0e51e480757d80658628d7763cfc050a7483a7ae6cb789eadb67ebb7def485ab
1a97ff20fa245ee8f7b317fb68777f1ad77b48d1d9c651fdef79d30700083eb58506d6defcb7e4306fef58908dfd36cf3942c178afd68eb542afc2fbe14610f3
234588c44f18ac10097fa2a38ec04cb86f9984d8ef495ed7906cf43676bc7d790fc187b7c1f5e683552c41ee91ddfb8beb4ac030b183908e643f4065fd08c7ff
5bb464d5cdfb47a188550f9c593d79347f0a342cda9db7d47049ec0aa7931fed8ec8beff444ed76e2c746efe36008ce44ac18dfd32fffb7fc83e726cbdc021a6
5670ed774ffaca16fb50befe59ffcff68ceb7a02e48afc7905ed59516570097bbf876813d9ac37792276fc6dcbcf52ed76b2ffe45fdfadd4281ee6902edbb900
e1fffa7326fe95273734b818f09dbd77af2f62847594ebbfc8fa2db1e894f1cd51dc751dedf4a7fb2dc0795f31848b84ed040ee7f0cc5c99ff906afd4df618c7
c12e1c5da93160a9738c3f2f9efafc84eb83ebad84ece914c4fbc7a42f676c4ff71ab7069fb3bd747738ae4b114d77718dfc95cf1f7dfbd5f576dbabb474d9db
fa2cc3f3ab8637de0e2b70af0e4980bcbb31f5ed568a0bacf08a816ede89cdb90db41f1790a194acf8504e8171c7f767ab78605b7e2e3b31c14c2852869bdb94
82f67799b5686fe1bb4afe9dadb5690368b833497ff60d1b5c1f2ca25cb7a13adb34271875218ab16f83bb77a649c242b0fe1c72cedefefe9b8afe4f165131f7
8eefdf9f6edef60df0207440dee709ffb5218d216588e3bfcd307929de96df9b8950a130e0e3349f2d8fad176230670d8faf7aed90938deda28717c67bc308c7
ce09ccdd980f99ac7318cdd8cfff12913e684cf781f77f21c3bf54fef6f319cbf2218a43c9350ee7ed50d9e30a20fdd46f21e917102c9dbf914d77cb997e25ef
f51b0844588b04794d379b2c5e5f124c32a1b09b7541feb729faef73a081a2ffb109fd2ded213dbbf83676ee47e18d90b0ba18d3470906877329f71a18fd04c7
ffd8bffe020e4ef241fd95ed011bdd33c3eb1885e0ec04af7f4ad7f79510f02e4bddd3b2b14feee369c9ba0940cb9dfb987ff5f22ce7605d62e66c5bfd04dbc5
e5182b40cf00930498c3288d7fa277c78cf593c97f9f974afeae6eaf75031cd32d777348c4e1fe7f078b18ebf3ba3cd6767c99b8df99332da34fb5ea8c128b87
db1cbf13fd164eeb8b019ff30091d5cf7bbcf9e92bfbfa7649fd18cb7139b0e87fc5fdff8ecff36d773f0372bcfe9ab013e229c5d5631bf017241dcf7df113fd
79dbc707fc993c701118cd4aee4eb01f1eaf2f205f16f23e40489eba32db1fefb5844d100ceb148fb28db042973ed5aee00687c5d3ac0ccdfdeeff6bfb6b8b7f
6c5c2e5bf336bfd5ce71d2a7f03800e871f710b5d534fb1b28771461c9fd72a9fe35cbf461e7172bed3adfad509afe218dfd9f7db97be49061d934885c87d9c3
718777f111c52097e91f68622ef95ce275c7b0e02833e3e111d3ecb8d5ab47c6389f70e10048ffb2f808d3e27572bc77ab026e4e2cef5e5cf4dbbef9ecc5d304
5fa97ffd905c66cced1df7f3003e50588b64bfeb06f7fcaf2e495c9051cef1a1cb85fdbb07ddb33ee9db7aff9e5d5cf5fa8aebf33e4fecd7c12ba301a83f91d1
8e012769e4e4061552fcdd705f091bbaa2a7ba46bda6f390a5e3305a34c735fbb10e4400d58543ac537f3de3defb0849ff33cd18a3e05128af374d0a7e40f21a
7e138709e78b2fe02edf21a708f77236ddf7db747ef0c7fbd75f8cda7bacdf6881ccb33876e5f2ef29c982eb4e1f79edb8a708f3b3bc2bc4824cbf76992db83e
c8fc6c8abbfc4624697f9dc346a5dbab6fe2e52a490a25376f70e25f106b7682e538ba7886b712bf370cf688db21fd1dfdbb718fe35cbffe1b1cbcdfcdbebc66
f2cafe9cda8b5f8df7b3dade187d1249e255f16fa7b8ec3822ef84f00147691bbb0cbf04fdc76471a7450f233b0088edf712fe829d1b361b33b1f721c71d0e4b
201fa139be7622fc7b8dfa1867d16fbe0cebdadbb467e4a02905cb788620a004ef36de6268fe2204ec16b1e0b67498fc7dc164e3b5fd345700d7086bf865774e
fc218eb5178f24a071716f4ee3d671c94fa76deb71f5e993b0ce94f25d2db50368cfdfb38db18d02bf580dfd30ba469f25d60e3e3c51e81b9934bf570ef0e18d
e7ee35882ed4a61f5e6fb1c4fb9c2c91a282cb1fafbb794344a70558fbb9fb25df0497f2eb4a6075f45eb136275a6fd0c1db9249732c2cf2660ba4bf1309e12b
cb7d883efc4cf1cd0573eef22af189c30ce732defd1453feccdd1eec7ef406747e60b7e39d946fa3c5a75b89e7751383a0cf3c1387c145a87d8904cede3be701
9b071c11c29d1e2207cc914599cbfbbc901e18d1b3c8c5570ec4a822830e749d6ff3baf307e040c205cedd92cc306f7f06feba7171f757e0d1afb73f4dfc5735
e5c5f514c08e3afbc145a943ab40d062d670c618c3ecdefb3afac3ee9f7e199eacd0e1b1804ed233a787b73bf9d2268be7605f0ca2c85b1870f00f68228f3853
c8c17685d71beb8bb0ecad3b7f4722f899ab6bf1b3d08db9c7fb9fc44cbb844d8318bc45972f2f2edeb706e37f04eceff2eaf7d42345007521e1ea24e30b4010
16386fbeea82c108ff74b77fefe7e96ffe03edf219308fe915ab83cb28c20fca7392df5e0b8d74e6e5cb97af3f6f01e3fb6bfb69ce1547d7fe2e5fa2c871150c
cef04cedfff06f7f750bf77fe967470be1b8d97883b02edbb05fb689fefeddd3dfd70d7c09163e01eb3ac7d86b8dd1dfe46c85fbb350076fd788efff40dedd9e
308cbf20b9938f8ff31afb7d87f996cb7ac7fb9791c7f33f301c0317f058b2f9fad2df2baf62129f660a00b205f1cb1a45c69e99cefd1ee7eeb7ca0f1ed77912
4ccdfd33bf14b6ba0a10f6ac79dfc50eaeafaf0fc04306e94e705f0e30c80fffc01f0cbdbf90f97dab8fb2e58700d342890c969c5d52a7b731fe7573eae2e0fa
97f3fe3b60716c314d085049f1ac716bbd135283245f01de0aa700aebbcedbfdfb3987f14cb3cc7f7deb409ffa24ab6db81430e4a7f212ebf125dfecfd7200d7
06b7f7085f1a8fbf3931d87f7dc1fe30f7ff4f0f2e2a42fd9fc90c95cbba30360d08815ef45fb3ee7dd2df28af0f764f00b0cbf5feaebbdf7f476e43c87f9bfe
f5ea0e95fbf210c98cd9ba6aefc1843f213e1c906df629fd18340ade211f7f3fafdf29550357c7f34f7fba529fef7e600e106d049003e5fdcd07c387f81fc1e6
2523ffe96b38d924424efefdbf87f73f613ed7e4ed507e14e37408accf7ababcff4757904ff50853bfafdf9a3d78a3de7bc7f89b738fbfe585fdd357a52758df
db072e2ba77e37308660dfb28318530162882933a3cc517ff66f36e8000347efefd2960cb75b7f55887ff6d9318f4642cde0c95aa3720e2510c68f085876a9fc
2c8e21f4c60d9f144f7f905d77a1fef924cbfbaf212ed713043201bf18010e7593e9f22ac77d041307781d4e7f7593f7fba0dcd9b9f212ed791ca25f309297ff
9023a3eafd03fbbabbce0cbfbb7a85fd533bceb0c87f560ba0df93ad06305500f6e45fbfae3576fef66f7fedb67491fcceeb18a0fd2dfba78f5a4cbf250c68e1
4f4fd5c3f3409932df86fe0af0a9fde606d77eae08f233ed792ca2d68516e304bf574791e2cb987fecc6d770b3a7f7bc9cbfb498773c00ad04094df52d1fc0ae
7ec5d5a5f77f4d9fbff825fdf7a185b539c70074e2b300d70f7ef51d8d3e7bf58bdb79304c3f7a89f00009dbf5f9502fe7ae2338fa44fdbf187fbe4f0c5c5ab2
2f7d2ccfed1dff5abfbf18029f00283fc8e4f1276fe75f527cbf1a0e3f18483fbb42f6fef584d77312c127e30c0e85097b7fdcfa95ef986e30c383a4eb4ecfe7
2280eb0e3e7ffeffe5165fba6b7f1e0f5b4e7b358fbf08da137cf5a385a72e2a17b2c1f756097296baedc1c3e4b59c755018e373a06c7ce7858af0f583f348ed
83ee7af09e7e177a394f3f729f2b9c7029d0d3d00d573afeda82d05ef9618ef77eb03604e4fbd3dfdc62d87b2817749f1da651aef7d2907cf9934c6df95c65cb
48c7b77bae7c1f65ba55f106ff00f5a9f3451f28471cbbfe0f500a7f8bea4fb32ba5034b4f738570a86e318fca9d1b56dcbb982efaa5af1cefd014d1740bcd6c
b9d2433068e3a43fca9163ef4201313009a54a5590ce432240e1832d350e74bdcbb09f04e3e38912cc09e704cdf6b017dbecf34339a329fb324008220ab2746a
0212d42903dd75aa5dd1623cdf16e0e31b9a43d15d6058a7ecc167ae8c31b3647efc401503c657ca21bd7cb598ae692c7e61b1d83b3cf1be2900083eba284e36
6708d9d2676826d0d6cf304ebc41cf36337207129b39b1f7a600a55c7c9a3ab41884e17dae980f588ed8a92f8a81206a30edf10a8cb31af3ce319738f3b36f9a
0f6d78307a0eaa1a5719aa024d86188cb37ca30f62155b3e44301c1b297d86588e7b64328e3ab23433059717979095b770d3ef1bc81419b3d04d8f61b638f409
08d48a906316ea672cc79b3ef74df9cf5bf8d05f8d0dbd4b368fc495fb190d62566f133df8f7fe811a634df02f5b68db39490dbda4648421e34108db73575bab
e81dda7c442b4c7bd222c59ed67531dc770009098b1e7003d2998010d23d8eb17d37c0882784a9b9d9b50da580b5e11944ce8135e3e0d67c0aac8e4c1cad1cd2
881d770553488e361727d22a92720f6a2eec504877209b6f0472021f387230c6fea9fe55b11759e2728aef418f46cd425a01afa6d45912af38e886cb8ccb526c
e52df33c7bd879485abf973121d7789f2bd4c52162743e91df819f4fee8f8b5d0917bb9aa9ded8cb56b31290d567cfb00147a325595f07cd91786abbea51a96f
72415bf4d75c8d1014ee97866a74f34324d7963527789bf977b0d805edd1af1243b3fce866eea3237b31e3797b1894f8ac84a9383707b53855f269e1f86ad6cd
3f8d5871c4e80aa10c7f5813b3da4cb1d7b24778932941a334929bb5bef02f076dc5de3f14d071415fc3e85fddd942d82780bfe274c93ff718fcf65f7208e72a
e7f873e61cc3a271b96bbc316d4fd9c3d783ee40d5e60a22237f1e2c1b91bfa0ab56336237f15f3c8f308c14af3d54f0d927a5c351301a5e23d560351da4a778
64c92348d3badd6588e9397a5771a6b29a91b57d6d7a922f3c82e1d2f455e7c3aa950516fa1fc5890119ce36e6b608448aa8be48fabdd4e00d7ecd8b51303ca8
37c1f7ba39721bed73e07953d9291bdbf3f30e51edfd27ec64ba6d4a06fc2a3141174e6d22fa10bb907c34fd1246b78d1d7ed4cdeaaae2d0b8773886cec026e8
c3db50acd6d17931aaf215541cb91ae01bfb72d669450caefb3b1ec7bd2aaa19daeebf2466ce15cd2be815fdf26d26eec9493b1a3941388963327d46e48a9bb2
5eac026a65e2fe6063a93f34bbdfafec591174e4702c5da62c18e192284103deb95f8d0915a13d52190b0d7d930b457071aac49b8b3b8d6fd2d0f345a86b7010
2dbc1db17b343542614cadf236b8a64556e02f80c9a0f1b0146931d1234216241147a4d5a7c18cbb06ce90f2ce7c75d2b6360e940c6c4c60cf64eee35e0c0ccb
6a713deafce9990fe842985dc596cd15fd0d9e72c606c4ba61f83eefd6a9d5bf815ea7189160696b3948b7e10f27f5fc637efe77d436c5cedc4cb343c21feac5
53ba60d17e8e2f6e6d2941964c66153c0e71c8773fb725b364f794ef1f0e17e40e1a78866c7c9bcf82ca1ea5185a697cffec03203f064c4806c29a918238eb1c
2cf02025e639a07fb22f7a812e0dd63ddee0f81a0f1f2c1d8ff64ef67a25af1a9169f58c13a78c8bd1ad403e502e9089eeb17204fb4087c138c767a967ccb1b3
40e9efcb554c6b8cb69ca58efd521801e680f317fb720345c59457abed7df65fa995b6afc22c02a14b399dda974f1a727a6e7d11afdd85d8105ef12f3a363f9f
8b8bd2d2872f7aec82bfd79a02e48a8723c72a25dc1187c9be78253117755598b51b6b55857a87520c9b87c6ab654c233f019fbe6a92bc97f963139fd89d6bdd
9650479a6b6f78401a28e913131b193e74bc6908d6f30dda206217ba125b2beba4aecc00b467ce010c3bf2290bee4bbbaa15f6731bddb15ff4b314ff1a5d7bd4
b9fa0f2ecdebdb2bc772787eea9bcd808d6d092538760890b36c376e25a5e51b5a5f34ddff4a1fdb36a29b45e15c23e4400c6ff14cb3bdb9d368f152b4d64214
f03604cc9c99450af049225a9885b474b4dd8a16b23027dbbb9b919d69de48989bee4bdb99f17c57bb886a7282322f7c1c8b398199d13191aadbd469f7e8e5dc
12a829e88daff4b3e6a96299efd073c8364a99db2ac659c83c52d2661ad545955c9f92eafd2416998a4c4fbd4b3a09e5312f2837e547fdba34d3905d789c4257
842c870962eddb96d609770a7cd73ec3dfd8c9e77851a572cefe451b9f6ed89f8baa460257dce81432e420c5d3db5e2e2ed0e146b3cf0ce84bd2e0599ffbbdc8
c7998d6b22adac9bb93ec58dfd9c5a50bb1fe85f224b53396040a9dd92de95aac59ce64934b593aff8d31de1a5d752078e5b129d5fb33083307174ebe48d51b8
524a8390f60ee3b7eac6f0e019ce4c16972436bbe77288547c50b7a40436edfa07a40aaf016741882ee4f707ea703e4c74366694ae2162be38369dc3be89c1aa
e66c4bdc414a84127ae83c84c86a75f103ea5ad2b90fde47caf83b7423aad2fbfc7c2d3fa5916eb3d759c7ca3ed1e005e11e4284937b4b26098b125e68c65b45
de6a9d1bd3230941906a338f0563cfc6a9c82aa5dc0dff3bef77ca9167290a6a0a4e485cebb571409a516aefe821e0be083e06b009b60655428d56636d36d737
3b8243de489a35c5bc5d712dc81f316db96c5ea374555f9271223d16ea1130e8b516dc4dc0e78831ecde517b02773e99219281c379b36be15b7ea8841bcab7fd
9c5ee55bc1f726f78e05eeadce56727d7fb07817c9b6bf5d3c2f4b3972cf856612e2653a0bca317db4e27cbe3854830df36fbf68da1b537d663d87be6af1b20c
9139cd6da78ef12ec5c30bdc80f36f9575b8f4a658bd57b363e975d61aab3583ecde0a4ecf1859f5ea120d48a90d7786c7b3191035d0f9eb05af86e4e8ce6ebf
57178c038a73a518cf3834af43e43836a212d76ca7ad989ad6d631fb56cd58fc239d25040c62074b3ccf45377e8d2f32c07a6b147b58955bf17ca62dc36eefb8
e518cf0c61cb5b06bb6895a4a146a736d9c1db93bf6b5d6429f408bedc0bcc569f1d44c206bef6a56f06137ab2ab5ff84fa12077b316cff892e365df51790185
f73b3d2b9b917de4d944ab01c5436cef8de06bf6c45b5e118d1336bd074150ee4034811ae38d67b5ee0552746eda02dfa03c5258443cee05553ee85a05a7436d
efd7e38c7759fd556bbd4d474b8ed45702d94774ad5e2b1eb8c0739f86c65d9d926863b821d864e5cfdedd6073acb3603a640afc10f82e42cda2393c8110f057
f7048af4d716e2b9a9d693fb37c61bfa23645764394a5d7d7503e0b8391714804bda366ab89e49c113f80f90bcf868d006d11b7daa2b33ce728810a7972c3f1b
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
cf1930f4b633b81635f87416fcbeed2df288edd39c43851b845d83fe01429831277baa842426f5d9c8d696843fff1a3e9f21e6f9b99852b8c5e1089ead52c476e46770c3afecdc7b8a150ebb532a41bb3e93a8a2e7766fa55a2515a4a536b391d055260d92539bd8ee66068cf8165ecdba9cf5e03c1ce95c590929c2167353d7
02c6004d5daad522a80eb78867859d8d2a739a2cbc6db9113c84d2007d2149e7ee7469f6466ed66e5eb85bb402e998dea98abcbb29dcb5cd519c3d05f4b6b69a8e606256c047c60075b6f84cfb562e3cb3890067fb12b62ae9166318c99b989ff04b99ae8f13a5fc337021a2b491e6178a31214279381347974b1128c821f15a
__map__
9dcf6f59d5357f6a457a086367874fabf059845d7f625f742128defa03461240f88d88baf1672a1cb6275c9c4c4cd35e719bec74d2a4207d6b36868c2d0a58dfb3053495df527fbabbbcaf9d76a85542daec6baf6a58887482ad45782ab71d56d5d8a027a5783ba08a830ed0d502bd83358e9ba601d7e05e73d347b116b99534
e82f6f25613839cea9589020717f83954492edba141da20f1d19d7a93be4e7dfb5d4613b2129cc28fdfaed5d0daf5c16edfa8d2fd43a0ab262ecb11c9c4f450f8e7971eac41e5b83dacd6b58ae490ee3a819d803c710e3565ab29d1f494dd196c3793b3b817f61ff965bcfd26f2fb46c159bf85c4f5ca4f7b32dd38ce4047117
c3803f0f51c5297cffa523cbe5f7ab6a7dfdbb66ee18cd8e96d7d4be6883fdb1b41bea525bbbd224f5493f1d5fea5877de09049eda6cc121cf074468452d3e78ece7c139b5ed164ab0692b80b828e5eb04f6c0b544222ca783741ddd9f60c605f41ff3ce76dd7f4dad25de51dc963aff3062b7822608ed1f6bd331529f805e4f
dbdce644a0c4dc5dbe673739128f8ca7bf1e85fb31b900159e378a7d1b8de7a36d036123d39f0645b8cf735a4d21579be3d5d09d6ed9048b2d97370c84e0b4b9db0976b859fd7c99d331043bada9091648bf1c196c307de24f5bfc54b08d4fe6e7f379d51e8df770958b10a525d5b1ad673920c1e4761f67cbc77462894180c8
acb1536da7eade907b2c26525fdb71cff5c76ccedd14e525fabd7e7bfae3fefd9b24d86fdc929a20f6e78f627f1459d81b99317f65c31ff5894c3dd5942ac0a7117a7082dd756af2ec1db19d803c2bf1a023dde4ea59588a3be6d5901aef905ab25d954baf9bfa36d50f3be6ed34d13a33f4349d60072b7465b25f44a9aa8c25
cf8fd483ab78d340dc0a8e133c56abad06e2d794559a2eb620d67c4e7c075268ec9ff7a763ff3c6edb48cba3d34c8c204deab91bc6d2bef3d7deca832dcd8e19cb5e6b4eba7de35a1c8e734327fe708322e8507282d00e6dd49e7ba8590e55833e4c3337f6f3ba7c2f3cbbc14899564c21ae79fa3a49202ebad60ac7c3ce66a0
c4ab422f5983ed2453cf22d0f720df872668d3f30332483de3d069fa22ca34dd7977cd1fc4af520bc26cbf4afaea1109c137890de41f1a158005b673d281d2866764efa007022127a906f61e87fbf5fc4d536f2a5bde247c9394da4c0d232ba5252fbf0f0cb1cf1801b4f94123f9769022d50af23d2ae3fcf69fe4f3920635e5
bc319b0f4c56851f8fc1a7fa3d75de5ed8953d5e5e4b37e07953b89324239d371e0f28693647328271c78c83fdd344cf1f85f7a9c012fa2963e5ca23d1a642d56914ce8fdce823efd8a0575c7416e97ade5d14b98f7ee0fe1e3a01ff7d12023306e4d0d7ec7a97af9dc4d86c5d764c06918b7781a3706a92f7559d929f2780d1
6827c0f69ea05a6f86dff5da6a8803d4efd33582048c6a34a5bfb96bb63135be53a26c314bb19d17a4f39d6102e447efda4534e33864826a7893d3e78e3914b3151e1bc754c4e98ede6f259c0269a6d869b41ab9bd015494143c495e91835a2b09681d12c914aa0573e5c7557b3d6efa308ac1a06152f7a634c93bfe0062c374
5928ff568fd1a1330d893900d4d05a4692ac6ab5e16aebe02068d1b7706d2fcf3c3a703c09349b5a8610c2096f54b26f80225f153b0ebf5a2f3d1fa33f3573bec8ec48a551ee886f9a8e60e61f82de82456c5fabe93356baed0ce4d890d56ad8ca6d97d4dd7f692c1557119bed439c3012a1522e543d0eb1e00934bdbcf3afe3
97f3127ee242a149a740b845a515664b3b571deef91c0b16d586648d4d7b74d4b4beb1766bf9cca1d33065014df241e43a2a501224df1345836fd8df1f20a71f89643cd514db6f0b46f5308850632aa0b7961b7792e1f97e953f4b045d2dbe3c19c44d7b4ec4fdaf8d388e7e6955e51fd02bfcb16d891a1d7bf2a52705ba7a2e
6d1ff9fb561f07625d975b3634a0c6a29a3837f4b74c35472cd1566535e56fe79b6d1feaaf1bff0f53e1749c7aa90ae841669a4b7ee8dc3dbd7d20bb06c60318ffee3713d470c581b920b9e3e3dbb12401660c058ff92222d19bf36f78a7c33ff0673577bf63ee951a86dc9f548d9abc11c413f84d4136793ad65537e7b43805
e4ad2a38c7d1b2f65e0bce2d744a892bc987077dfde0c3958ba6b1238d6da29fb6de633bae374c3f87f7963ac1ce40a7d9df9b69950e2687dcf6480063e8436c9d61f8fb95789f2ade4dfcef5be152d6d6b7fea4474e9d0c5b9b61e697e2c7800cf8a30126b966bcd5a887070afdb68e6f03e5c8ea84e7950bbe229da3ccdfef
94a135647c5b082a8ce0f7cdc439faab91a59f8e3519ffdf81cfd0de5b05df442f2143c655feec943cc7f06114a4d9ccf7c5c33e51b3117cf5361873d720e86fb5fabf5e5fb4eca835b0c28774807671287ab67449ecbf07ada0667092b51dc63b6d84f109b45cfcb3f9e02007060f8d5a05df3534edd196a63f482f28355ae6
3042dfef8fe86b09c549d8ea03083697e5c5929f4bd11ce1995121e8add7737b5f517810be9a5afb6ee70eb205fcc0d38c1d2f5d79aba393fb9f008677f0197091f0fb7543f93186f9d8a37d41cfa469fbb989ef25f9fb3bac32f272073f8ae49d700f51f0b7f0517a01e5501fe1ec871d0f3cfa9d98b18b9c54f0f3b8230f34
72173e452a6060e0f7ce5af96fa2f687adf07505e8210feef57586b42e8aefdc39787f50b8eb16e7129801e35af1fd21c69a4f983e3694e92fc3b0adc8381e366ef649afca9fada209f9b521e34ed14b7702797ed487dc4fc3cb64f6e6b8113350d242da21b23089fcab13bc3322e4e96b87c3405c05dfcaead8714131503592
c4edff6a38b613e0dbc3f8df493e16e457a6ed82b27aa759404ec73f113543d709f5a45416453060db83271f0b4671b0132dd91cfa39b969fb3b9fce3d98a5faf9514dca73db66d94bade21b79106edfb1227c4008eca56057706c4cabf8f79da9ea309840c9aae1da4102d4196df3b33a327e9f0758ae8c248646ff7b45e351
e6cbf3efa3ea7e754cb7f3317dd6e7c2a83bc06350eaffc1c9bccd02b77db733f65b7d60cefc4d8ecb2018f2de482adf2cb9f985430139c1a58e1d7c247bac7e9c653c8c1d1c42e8d8e73ae5cf7d515046f757a6ffb786cfac51388551e00e22ce976edf03605495eed88b5f213f0a4df7b34ef66f0753ab180f06d949f52be4
c434948d06b6993812cfaac3ba6a53f888f069d4bc69fefe3b869dc6a777333bf40b6de8b7b3ec0c3902010fed8cf0d0170af167a092e32a44e3236b10fe5217d49691f5e093ebf80782ad66df2f09ff04a05ffea8d6b7b646c0a6f9f506e066127ec9f653a020df2f28c2a2403ccdfc5efa07873a7ff376145d2118765ce64b
80225f15d56ad5fcf54fe3abf0b77ff42f5de260e3c903f0246fde62b94956fab45f506b845ba13bf66641c00b4fd77e1480af49472efa8ef3ca380f5bf8c4ce343147f4fb11716c88f2bcaf07ffacd5c781b8effb75022597abf9534b1f129a1f6f8709e91a7ab8f2c3421cd496e1ef60daea5397d18e6edf2d6c456da7b863
a940752b1afe50217c6af34dd8829be2818c0422177ffbbe99f809bc7f35aa350abd7891dbc4c70af4c8bf44bf0cb0848e78ec80b13370b53b05fc959d8d4f5fdd37440dea711080a37e7591e73f22346a69ad36660fa43f501918a012a881e355f8775c9136c3c3a1e667177edbdd1cde9fa481526d3b87bab5d5cfa56a91bf
0704078a6350bc6c62e53416915bb0d8f845ded0370af221586ad88e5d1e3e80bfc55e44c1dad5a8dd17c6f091eab0d9ee121c16ed745c975aedc7dc40b3d9770e9dc15ddeaa8e5e6803dcb5b7c716b324c5e6df9c48aab55a7a5eeb5bad3188e51f223ac7515ae2509dbf2f30e09d921bfe0117820745b1b2d85c0cb056347e
fd140fced8c25fc04650edcf8786623a716537084a7625a228cdb13d6ec43b0dfc3d1a03661b708f171a4be3abb534cde361672c79a936608bdad150fc1efc1ecdc67819515f43e97610e7add17c09d585df6ebfb718e86c4ca17a777eb5eda0a802ae6eb50bdc66dc44175c6a1ef15635c97d03d2df835f1206bf9a7674e471
adb2fa1ca0c47357a3c1065c349313486ea961aea6dad81a88c56450e50e6f8e6ac8d7f24435e1bbf7aeba2c64909b0729e0acaee099381e7ddf9f610bd5a50cf3a21bf116aa58a90c9d56148758289babe355da71545c62d847c673b9f0af61c36f38a04683c1d379fbf3f39c5bc2bd9c72ad7109addcba3bc75f857aa6886a
178fd25a8140761ce669813f2557d4ac361a52b5f53927877f231aab9e41ec06d05a66a75154e6f169f5b859107ecf73f9107eff6f00ba71c4cf17551af91547876ac3cdb713e7d857809fdc70797fe1fe06c457aae89b25b6056bec8ca54ab06952528723d70baeeeb8c4c18971c09cc50916368886daa3050839f039283e94
157ffacfc1870036dbc45f42173a125775b6bb59dea1d26fee6c9698f016c44972cb5be3c7971288c039168abf384140cc0b5e911ea38bbfd5ad2d6461de754285598d062b7b7e56f0f6039e876668c15b5b510951099a9361af8ada89af9db593a0a53bd8f21c39bc463418c7314545bf343e1f93dc1a85f2a8e2d3c5769d80
3f4de81f7eddeae747b55a4db69c7d8fb1e701c22fa8c365c5423ed03beddcb7ce953cf8a5f9f95c03c16b66952e0cd31b8838696b707f067c42549066a3af28722371dca8421335aaf63d7f9e0bc0c8c6b85ae24ed11f35688bb23ab0044dc6f0a855e71cd3b4205601331c7efdfecfb95fac81fa1e6f31960d615f947f0499
3410f310e05f0d2bc90e780508cffdda040bf5614840aadac88d892a47ae606a706894d9b15b85180795e9201c1d8a4524c7c57a56451ee525028948a13ce8f1023161bb3ade81df711ac728e73e2983ac6a450c2c05946051f69570c25624dd6a8abd9e5af8b047a298799470e0ad8837e687f47723b0f808dc6a2945f488fe
b31a0a5b7cbde81d178db6da391f598dba51fb340b0330a0e76257493ee4aebb59900a5cae18c72d7abff01ece9dbb858877f38df0840b1de7f0fb69021ea4b9d4416be2661577079b497f8e003c73530e289efb108e06b97bf6d01c81dddc5bc17b9628d516da0ea836b9eef30a5175eb3871703cc5c7dd537115ff2e541bd0
130c0f90b575fb4a535d5934a6ff4654d4778020d6eeab74a15b42095b7fde1f1595a48c5db3ca3b205bd036ce3fd38e18bb62dc0ba8a1505a482c22d2ed1684e02abe935925ab7a45c4364b537e69bc7f04f23fa2b7ca69f990cd47f4dace1b95bbd398dd8f83ed6debb7c015a7f42e0eed4b3b0d9a31709251768ef1975752
ac1a3107a942ecc0bb35f05fb881f052f40c40adc4a516dd8ab00c4fcffbe672ce0f1dfe791f2e98a5602868996b91c4bb485680a9778da3c640e1d62a8c98c5400ebd201a09220e47c4d04d59cbd2daaebf93da60550dabe1386a202fd8ab0bdae7208f5dc2146f41ea44ffa65d49d999c2af9687b422054916a088d24ccf91
8a709258b42d3735ca283dcf0b8462118aa3e085343dcff1a88a5777f1df276b40d7a140632872a78332a29dd0f15449ff0bd3b2c4df239a7c1881d481542978587e741834b04754b5a1181354b0929acb11c0138113850054b25f5625674e2ec9b991a208082d4a7083ddb4eb5c43a68e8bfd3ddc03476868ae42c587952480
__sfx__
4ef1f3340a019122672247a2f02a07249191442e1491e6541a4523c1022c35b1c11b1a25e1502d0a07f3e4682404e326532241c0f34e1523a081181e3380734c13626000091f6342a32631000107781953926368
2ece9e11230060f324156761745802477117340f1691d63e2a14717572016291e45e261511f14c1313414559280301670b1754f1d40c1176d016540066122312343152f5513d37223108182271d4202763a2726f
92701b310a2091c11d04742044410a4241142811333074460634313644315791560a0a46d2e6620650d0d76d053030a5763146b2d5290633925230392470a6522235e0c7063e5112654c2c2633a64a112671b475
12fd2ef81636c37158230751c4650e16a1a32939207202062e515381363642b2347b3f1613176111752025780411515749330741d05b1e5302913300341091761251e03247207210670d2e2521121b3a03729025
fd794ddc3a42d07520291171c4240261a280160d253152700c015024560513d1e4001c0751d1321f716176012b5633122a2f46515546122063741f127310d60d310540c6340e4382d54b0a15d064390f5491a116
1a3a221c2502d3a1312404f086512343829406272343414b325391e03f2e47c3965f0c614300641a25e0c14f361303e33a2660b2b23b1d605001013c07c2941b27203066393660a202311756c217681c2213a67a
901dae842d5760b078196343123b0d51f0077d2c36f1070e0b23c3a15a0c44f3235426633347463c2590a477100081e13f2a34f0665113617245320e36d03726112463e1781635c382773b43f214363b55b0650a
805d4d69294782526c0e3651255f0b2451a45d1b7413c67c1c45c141122735f162171440b234420650d3960a0b13d3031d002002337a261792716f370540344d2f6041943a0c2473522d203443713b1957900621
a009c0aa155412525126113126060474c1d43d35701352421c75f2960d1c44c2f0492f3443e6743702f0e00e263621842a01619300303501d1761726653154200c26a3e2411971c1343e1427600315291461e068
14435fc60373e2a67e0c2121376c322311e744122593127d03256061192474b3f34c2b7522850b0a6272c6781b666286461b33e314071f025260433710c2e533253000c2742f4190905b1923d221770a0692132f
124e59c63321d12601366071145936463010741321e021390134b0b0721401c1e26b095170961f0e3232005327154240051844e36674394630075b2721e2661c202241e2780b37b200412165b0f34f3601e2d02d
b531ea50171032c60d0a1241f4640737e3a429284641c40a3423a2d26d3c42d0801d3e42c1f606221702502f1c5550433e3161301568256020962800454011613e61e2922004449037071464b0a71f3665b2604b
fbb4ee14392490a35d0455a132382313a111702743b284720d47517137336150943e2d57a2e074165662c6640f5233e22719473223651b14d2071c1e2202f0743b22500148135353923e246092a3271a00e3c270
3ba7208811029202783f4530d0270a53d1654a242281e24e34426090112851325500076350743a2d54400421234450f34e3441d021632564f3a66d2e6292140f022352217f1161b2130d361793a3091125107415
a641fedc0f54f1c7532567f18775106782330f1b6490a7520d567014253b47425251262001a5180005c2b7580b322275290a565224001726d1465022130033291d0513a67f2c555136201e535134300941204266
c40f82983f4722e11b067250a64a1f4010f6661357a3110f37167093263e4692942a3115234756143291023c351193a4552d672295711360b2720527072394210c47c094533e63a33347291050475a095200a612
35e698950a5533b431097483830f3914f097381552c0f2522212e3374b087751e0042421f3a3120155c133591e654386291076b1d2150d53229708266102903c005403043e3e42e0364d322590a10c1773b22647
a9792799064503700c1013a133790a23a1106d375431746721458103232c46c0d32a3d5612c170282140a15418519323773b23230178121020d602367090e5362770c3465d354442501c205783d32f1a45608068
0ae484db395592b0650c4221d54a313022e6241a55c180091036000721325550301938214317362c332356620a50e374143f23a3303a1d5601c6662e23939545080192763a26164013781661a2652e2903c24440
894d57241a55a2e519035110767d0d26f0c5662e20318718131472337d38152286262d1740202d3d23b2d46f2c358114222a2481311f2722110612260692b6411f2270847c1b36f3e53d071010906c006201c30b
3e0ab6351572511220183242d56a21241204093946c3a261356220c637052122a66a106760614c2922a1a4650e4273036a1551008301086483055f142463d42d10336020630b71411168185011c43b326150a432
984e22a10100e042092b63f1371d3626c0a504356521d4211656a0840f1124e0d1480653a2a6721c07b3306e253440f33c0a51a2b25f1233d2e30830763223682c656344743a3712d5142d6090701e3766e3b654
094a6552286123c2380b00d286031a2662416d3b01a291232c4190e144387240a70d0d7202e6151c7391a0530447d2d5153d12a1e7253a36a3e555027503967b2d137056450653d0976e20146133383424b18466
ffb9d63a233072275a2513737025094560e200311300354c3633b3a4153d1350305b2e2101e7513c52b331371c1070965a167333d433282741506c2864f0a34f0955b19614024172f4120c31b0c41a0f03d1c168
0347c00e120773500c1e65619262094383c60e3d57a042321325d084433c478060720e101324490f3433c50e363330575a3354a155152347808752021020e40c1a10b12308045333906b01128071671d24322066
a47d9f872122d07622163090812708011270540000b331052330a2d44c067470d13d0a2632e44a0731525608380663b3583342e1415a264421c222301611e3622154a0a718351590263a1777b0c4171a0501d221
528f80a73165429447340692317e1636f066081f111281340d604194661733b2563802548174351a3730100e3b0341f10f2f36c072220d53e390423177c272413e54b1e063255332a408122691e1380563a2417f
c59438cd3e42a182182e1592b20e147572703719155171093b13e08464151300d51d2577f0e56c1b10e3174d1711b2b5193077e036342a2263830c0d24b10562031781f46b202302e037053151f5281860e3c12d
07713f4d1c0011a703001242d170007650451b2d75d1f70904771067742a2252a1253762a1c62f35732074162261402408161671c56133119102580373d12701092252442907466267292337a232481d55724441
23e6840d3923634315262612065c092080a17e3465418014185141d409307501d4401123807309127630d067027690842d056161242f2905b3e6570056a251620a45b1e1722960c3065409478173062f20a2d16d
467e885d1e4680266209036364161825f2d250196301503834048235572a7523757a2f0680b03b376442a31a3901c1850d004512162f2a742095121525e1c14c2a517215623a04c371432d116371622e4581c744
62df97fa032362f73e223421571c1010d1053a1221d1c44a384260c61c3d1781a15c1f03f240150d45a334640574b12616346400207b02400305591c5213a24237019067221e064094100843b0b4642071c00449
e2b6b5952a26e3740d3d459052562235d251711f4783c521185150227c0d155213460d3100c0461607f344030e63d3166a07325127212960c3361f0c63d0753f1f6442317b1623d346232f07a1b6613822f2a02b
a57cc5c82034b2d267220583d37c22629305643b3111801804274091351254a2c7051a04d2700e0a7391630a104210c7302f36623336391363060c1f2130c575084382c5531372c18177354012525c2300a2e42a
ea1ba9332b62a3e0000b56b2a73f145103114c0c26b02433146441f6052b3240e1223326213468213770862906674183560a6011f5253d50924629380012a75025066226101e6573e27e070161971c345470f419
3392d2bc3d37215233384230822a323241b67e3650b353523e4492a3722832a12510102173f57b0646c1344f1145f2b46e197273b259257540415c382330131517503082410711f271010c04d191583317e12516
f230a1020b768291502546d2d50a030130d4311031b135713e5122d60c057051246a1a32606206005000c51318248161630d77b2346f0127206213265033b6151d775253091333a1b7650a024340061e7043a022
b765771c2852d0c0581b6391943f1c01a366760b1261a76307503356260d51d1e03d386213154e2b66411364366173d50f077682354a3745b1d5662a315035510a65d2d36c0a51c37570185063445e0b30205556
6f3aeb292e01e1e51030004247072a6293b47a202500350a3a66a2d3312d03a216490b45d104421760f326011e7291452a1b76e2a2291b31c2f40d1451c0316715601204260301f0863011129172341437e13238
85542a8b092722b5243b66e3b75d1141328419243283702204430114322014a0e4471b2180006e3e5070472e205222755a04742081433137505455172511c0561a5112a1231343f3966a21142152410756e27359
9670f5a63354e0e2193353c363170d6691d425023073355b164471412f2c06a073293672b2525b042410b73d3d3752241603747061372e4010153d137201257f33430202510666303132175742232c2b11e30723
86c120653805027364102293917c296372042a17604127172b429002220f12a1e46d0c1373d61523470266041c643252030261a143773252a26629284070e136305743112306736334041143f155413750622609
85e469833a6433d31f371641a41c351713200a2672e1025f271262d07e0c02a224540f7342a33c1b0750b260052131323a304341855a1350e21156161323c0662a6221c25a3917b09276121000d2210536e3c06c
06f55371014452220d152173f7473b55d3036837237320401f7651934f347062065a3b2483c65e267701054f1a0343d13a044692e253150370f2153321d3d5601026e0464e180251b77e0c458237153715219608
3ca258243c465095203206a0042a2e5110723a0574a3e47d3576e0417a1f1400926c380061f029044242f3623b279165750135a3b42e1a1342934e32106377173915435253171731820e1d33d015353175c28530
191cbb1a157783e67d2e35f0e128213771b53a0a70f1c2561452a0a503314383322e2d57837439391692100b0e027314602022129664095082d5200b35d1d5520c47b230722804f1822a1b202224600366504342
c40d891b1c2683801c3437c071520b3200c5013c31e061713e2120d36f1a03a134021d6612f6211121620707143280d36e3b53b254062144f2421c3a7150d03f362753f421291441b7413241131205167750d577
346147d7303752146a0967d0a0611543e1e36e07122084443d6202112a0674b3a243192643c5423e2712c2192a550353690322a2c6380e3501b05a343552a2780a1780a3081725c2a55d3e53a2c45c345350d605
ea9302d90d32f3022906366197562572c2a53e3e60c19519203660a3033251e0460a1e7032d65c2040f20737222592c7032b7041a475385461801f3c0640d5690c7320832a2915a3b64e3c702152052a46827355
549923e10942c353153e0162706b304272324808559373111106b14668060440b37b3617c2d34d14518174220311b36244033203646a395281a56a3767c3d31c2967835015092112341a1a256116703f1511d31b
a1ee34920c31f1675c0375e021321a70a09279225092a27b0846038313250601920b0741116054200420c2791b56c0b56c131282144c0650334365090030c0111f20f3823d3913e3933e3e02d397582300830338
64bee989025041d421171671a31e14433007751570f2e323055730a37413320151570a21828122314142e2541a0010463b1415d0933c1331700078245751a3692a5052f55c2124d3866b0c579125770c5121f528
747a19690f648037310716a075562d03826532376621c31315407171583d478231781a4261b6670f61c202220e04f353420b7610336e0c156275352974d3d0370d42e2662e2f1112d26c27462192433c3003354e
a6466df30c1093a3252e3071e1023230f14231244033a6411065c36049136453b6611274a184241c3361107f0553a1d551162442211b2975e136021e1180f45c3115b1604403146293552a74f0a625180702f259
e3626a323c60d330541b46f2924f004090836617128341503e45d11639061393973f3257c3650723002154312311f2f717197332b6441d209255492e7533265e347052e2323560c396700035e3856b0b22a39015
677d336d336491b55a0e3680330d3923d0d21e2a22a005250c47c330732735e2b05d1a25b135071e11e243491a3020510f25625265182763f2e369210662f554357721865f0700308655070772e6480d4153a17c
6fca35e62f559075152e16f2b70724070295460d331335462846021264285291334e3a6732c7030c52f10109161791923809766057031330a2301d0f5222520a1a16834034307112c07c156133c544311230f740
095b85c93c3693741f2b5233f4380914d2206e0a34c3c60a0820f215642d06e3204f1c42a294490f416222093e55f0457d3c43e3c2521363a3244334336122330355a3f061277722a15f1a51e180643805628635
7df9a74f3851701566033652b64e1172339067054122b7281a31e2062a2d0442e2530c4511c17d3454e0064a380272942005730096110476d2f4711626728626076622e722135782962c110650c5201726228255
9238fcde3a34822621094300a27237069034332975e1d067220603b35513446156621350f211561f657241590e20f2b4421542a1c42334216257450972a0a527271071417e0521e1076f3036422165204601f51a
a340742c2043f324130a4443a61e2c53624754140460305f3922d2505d3d03620468366703c33b1233c2d45015265370052a44a187041c2472a15d2f71d0705123446101480b20b2d6522d07d3e2263004e08316
28c6919e28720207702723b0a2251d2340e05a300150f1480d01d2c259321612f661341563247d2c735366792a35e36020375182f7513462b2947c0a419257432053e0d0260115c2b7610c2792913f196370d15e
f87d7192007751960a155293773e3e7640e42219660013652574c011191447b2715a21160035040d65a2d22527154297113000a3d446321573e25522771283450d438080592642e0f0561d554300543923b06723
d6f4c0d11e4311976623202190532613e0966a27164285442d0782232a35176266101d06a14409292040d730370390762a03652343000b1550917c3031f240610a3561c07d3326c0872c0b46c1c048226620624c
__music__
0a 43220a3b
0c 4a0a0c7d
0d 56013728
09 7a3b772e
08 013d7f14
0b 083b4f71
08 2d0e1864
0c 5e386011
0a 6b473909
06 20702619
05 4f730e51
02 7b472c21
0d 616d572e
0a 4d17531a
09 0e1c5d68
0f 0b253864
09 6a14664d
09 214f6f41
03 3d167d45
0c 714b0249
0d 081a3c07
0d 13455b6c
05 2c215a10
0b 7d7c0e33
08 0e566d39
09 017b1c5d
02 36074066
04 7755564a
0d 31345d41
07 4d471c01
00 573d092d
00 0e21357e
07 2b4f6147
0e 11576708
00 23325231
0e 72011109
00 1269006e
02 69222e0e
07 09003755
02 22357366
02 043c0252
0c 74110155
08 45641a16
02 3f11042f
07 54283440
04 63541a2c
0f 6773736d
03 1a373c2f
05 27543445
05 694f4f59
06 2d240f21
07 6228713a
06 30334a1b
04 394f5777
03 7d6c2211
03 27760965
00 1b692065
09 662e521c
07 560a1b08
03 116a195b
0c 0863473a
06 17264335
03 1c1d7107
03 1e097d70
