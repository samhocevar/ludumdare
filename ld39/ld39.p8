pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
--  ld39 toy project
--  copyright (c) 2017 sam hocevar <sam@hocevar.net>
image_list = {
  { file = "data/world.jpeg", w = 1024, h = 128, tolerance = 62200 },
  { file = "data/owl.png", w = 128, h = 512, tolerance = 20000 },
}
current_image = image_list[1]
owl = image_list[2]
facts = {}
global_rom = {
[0]=
0x68d3.f897,0xdc4b.46c1,0xd202.41cf,0x2026.bd8,0xc5f8.55b4,0x420f.2714,
0x43bf.1a1f,0x3bf8.0d7f,0x7206.0ab7,0x3ac3.7d06,0xfea2.0eee,0xec0d.3f6,
0x7200.5d94,0x607f.01d7,0xf913.1208,0xddc5.f4c3,0x6d10.2846,0x188.4e34,
0x3dd1.77b4,0x72b4.893e,0x40f0.80e2,0x13d2.26cf,0xa1d.2fe1,0x2bf.b1bd,
0x1776.1391,0xaf78.993b,0x43a8.383,0xbe3b.01a4,0xbc1d.451d,0xc5db.07fb,
0x7d06.bf92,0xbff.712b,0x1f42.6024,0x4358.eadc,0x1ae7.567e,0x176e.2ea3,
0x203.215a,0x43af.88d7,0xfef4.0067,0x63f6.8e64,0xd1d6.ff08,0xdd78.c1d3,
0xdd1e.c,0x4d9e.1dc5,0xdc6b.c786,0xfc47.bcfe,0x9b8b.393d,0x75fe.56f7,
0xe11f.fa4b,0xff80.5b06,0x871e.3467,0x72c9.ec3d,0xb87f.800d,0x1ca7.bb43,
0x7a01.3e01,0xd83e.6ee3,0xa06e.ead,0x38bb.15fc,0x5c46.675e,0xb8fe.8eff,
0x848.7ddd,0xc5dc.3e8,0x8d43.d69f,0x44bd.9198,0xa010.944d,0xe91a.6baf,
0x5bab.fb07,0x27bb.4fa8,0x1d86.0df1,0x55e.3fdc,0xb502.43cb,0xf7fe.835c,
0x30a0.3879,0x7686.7f5,0xec2.21d3,0xd1ae.0bff,0xbff.b45b,0x693a.a7b7,
0x60f6.8f7d,0x8c39.e9b7,0xe0b3.860f,0x71e3.8de8,0x60bd.21ed,0x833c.6eb8,
0xeef8.5b99,0x865a.6d0c,0xc256.e15,0xfeb5.eef8,0xb61f.f225,0xffbd.213a,
0x2f22.49e5,0xdc88.27ca,0xdfb8.3049,0xe370.77af,0xaffb.1b4f,0xdf47.be95,
0x10c4.1b4b,0x25d0.817e,0xee3c.037a,0x615c.7197,0xf467.737b,0xb718.9039,
0xde90.b7eb,0xe823.8f88,0x49bb.d032,0x9c76.8c3b,0xf289.3a45,0xda1d.93fb,
0xd3db.4d33,0x6f82.245d,0x585.409b,0x81b8.07f,0x8394.b709,0x760f.7d7d,
0x40fe.e1a3,0x21d1.ff96,0x21da.df6d,0x3f10.6778,0x2dfc.2069,0x3bbe.f70c,
0x6ee0.e1c4,0x96f.e07c,0x1136.3777,0x1f59.f91e,0x1dc6.fed1,0xa04e.b7f2,
0x2305.7e66,0xd815.a,0xc08.73fd,0x115.4399,0xc40c.4f83,0x2ff8.c001,
0x3b4.0b54,0xde0d.e88e,0x4098.de06,0x5ca3.1c0c,0xcc9b.f573,0xbe78.1da,
0x6160.f62d,0x6162.f648,0xc0dc.8efb,0x682e.12ad,0x2686.2477,0x471d.75e,
0x224d.d6af,0x7ff.6d07,0xe30d.2705,0xbabc.cef1,0xc286.06cb,0xa0f8.16cf,
0x560.8d16,0x8182.039a,0x3860.2f44,0x6d09.b108,0xd7ed.9355,0x4778.e12,
0xae08.45c2,0x521.aeef,0xfed7.39a,0xcfbe.2e99,0x560f.f801,0x88.e7f7,
0x1dee.5e12,0x1d21.dede,0xe2f7.70e4,0x3f8b.8afe,0xf046.b57f,0x6d4f.24b3,
0x1cc1.7786,0xc0b3.b421,0xffeb.ade1,0x9590.ed06,0x54e.89ed,0xf77f.e70e,
0x74dc.79bb,0x26f1.f604,0x5fc0.0469,0x1df7.bea8,0x862d.f06a,0xc9f9.1277,
0x4170.c40d,0xec26.77fa,0x1847.e1,0x88b6.b85,0x5fbe.1063,0x1d63.7938,
0x3976.33f7,0x82ac.6f5c,0x1621.d805,0x52b0.c052,0x496.ee18,0x503a.e2fe,
0xf9c0.de13,0x484b.e104,0x7787.91ef,0xc1d7.715a,0x28.8d23,0xd507.166c,
0x7134.21c6,0x438e.1d12,0x82bc.0cf8,0xa007.d344,0xc490.be27,0x7bda.85d3,
0x7e04.6837,0x62eb.313e,0x4765.f5ab,0x4010.19a7,0xeda.ced7,0x44cd.f3c8,
0x4c32.85e9,0xf116.1ff4,0x2f84.0085,0x5fb7.697,0xf072.5ded,0x7e08.b0e8,
0x8fc0.f0c4,0xc578.6b9b,0x85e1.15db,0xe11b.7802,0x5c7f.9f8c,0x3e4a.bd2c,
0x146d.f825,0xb9b0.9bf,0xb85f.9f1,0x5edc.cc94,0xe46b.733f,0x5583.27a7,
0x5029.0557,0x8200.65f,0x394d.0338,0x8c1e.f59b,0x5f82.5df9,0xd5c0.2e5d,
0xefdf.1e27,0x3b81.c0ab,0xfc21.8c6e,0xf014.65ab,0x1290.090b,0x401f.91e,
0x162b.3bdb,0xc1d4.89de,0xf99b.c221,0x2bcb.63a3,0x7b8b.8812,0xe23d.01,
0x120a.a4fc,0x919.e3,0x1fce.cebe,0xbbb8.dfec,0x76e4.de93,0x1e04.4aa1,
0xbecf.1dd4,0x4874.2d73,0x5ebf.1c3a,0x5f3a.7b41,0xfbb0.b999,0xccc3.edd3,
0xace0.24eb,0x87d0.79b,0xf865.de5f,0x4a77.83b6,0xc3c0.d27b,0x1cef.c5e6,
0x5ed4.edfc,0x1af8.8a29,0xa1dd.5743,0xdd79.63f,0xefd2.39c5,0x7e5a.749c,
0x8c0.ceed,0x50c3.afb2,0x1ea.c5fb,0xa4e7.78f6,0x76ff.7bd,0x6e1.f181,
0xa3d5.ab4a,0x4010.dde1,0x777f.d725,0x74e5.e852,0x181f.f6fe,0x2e4a.d77a,
0x1e8d.713c,0x84e.9a51,0x10d8.9dd7,0x7058.637c,0x7a38.e512,0xaad7.c0db,
0xe1e7.5e93,0x6281.38e2,0xeda5.f0c7,0xfd89.3adf,0xc6af.c071,0x77af.31c2,
0x1444.5b82,0x76b.fe04,0xfdb1.d33f,0x4e90.cf39,0x2b52.98c,0xfb5d.960c,
0xf5d9.5233,0x7f82.9bbf,0x91d1.09cf,0x2d04.8ef,0x57b6.a46,0xe108.3eda,
0x6397.c80b,0x19ed.5fe1,0xcecb.0bf8,0xd4aa.a733,0x6ebf.eb8f,0x1c92.affb,
0xfb70.5587,0xce65.91e9,0xb09b.46f9,0x8fe0.641a,0x10d7.ebdf,0xbbf0.f27d,
0xc05f.026f,0x5f00.67d9,0xa67a.be3d,0xb98.cdcc,0x37a5.cf87,0xec18.9bdc,
0xbcf1.84a5,0xf2e9.ff61,0xc979.f0b6,0x92f2.5e4b,0x25e4.bc97,0x40bc.3f2f,
0xf475.bd12,0xc7.c8fb,0x130.0eb6,0x7ac8.f908,0xf5df.cdfb,0x1376.04a,
0x80bc.9fd3,0x55b7.5531,0xfe43.8ac8,0x9080.1204,0xf804.c48f,0xe9df.fbeb,
0xbca3.dbf2,0x7170.d3e,0x9db3.1b7d,0xbe37.ca2d,0xdc1c.1ca6,0x80f7.74e5,
0x72f4.e3f3,0xb8e.ad78,0x552d.af14,0xb5cc.ffca,0x8781.9007,0xd19d.db3b,
0xb5bf.f288,0x2ac1.e229,0x5ef4.0ff6,0x2957.fc26,0xb9e9.0821,0xbff1.71c1,
0x8fbb.e3c,0x5a6.5c9,0x5228.480c,0x35b5.70f6,0x7f80.a648,0x6fef.de97,
0xbeb8.5bd6,0x40f0.735b,0xe024.398,0xa35f.fc34,0xb3ae.0b54,0xa7f6.5cc,
0x6cb6.f4b3,0x99f9.2a6b,0x7925.df6d,0x161.ee83,0x3ae9.960c,0x69d.ad94,
0x3843.971e,0xfbaf.0dbd,0x376d.e155,0xa6d7.e84a,0x9bbe.ff1a,0x94fe.5325,
0x84a5.5bfa,0xd466.3cfc,0xbe27.fe83,0xe3d8.35b9,0x6050.3503,0xf023.1d28,
0x59d9.f929,0xd0bf.d89e,0x205a.e06b,0x88e8.8dfe,0x7e10.959,0xcad4.797f,
0xa550.6f9e,0x5426.2c84,0xe985.bd3f,0xfd21.4faf,0xb348.f986,0x79d1.c0e1,
0x29f2.6eb9,0x262f.82f,0xac5.7033,0xfa83.e3f3,0xefa.e35f,0x2857.47e4,
0xbfe1.ebc1,0x5e6.5c3b,0xaacd.2c5,0xf3e4.07e8,0x7e82.60ce,0x9be6.1975,
0x674b.5e6e,0x7ce6.2484,0x3b78.5991,0x405a.9616,0x905e.40be,0xb05a.35df,
0x5ee9.4db8,0x40f7.ddd7,0x20ae.02d,0xf351.4651,0xc7e.b067,0x4485.8cab,
0xb4d.adf4,0x92f.a0a2,0xff51.5fe7,0x46b1.972,0xbf85.5509,0xcbe.b078,
0xefc1.d0f6,0xf9d3.eded,0x770b.f80d,0xd0ef.c209,0x17de.9978,0x52ea.019c,
0xbfe1.9706,0x2ed.8439,0x1195.df0e,0xfbe1.e7ac,0x2fe.b8d9,0xfbd8.330a,
0xce5c.3129,0x1fae.d9b3,0xffb6.3b76,0x21f0.23b6,0x9904.7911,0x78a.3a4,
0x4241.a9f,0xa5d6.de15,0xb01e.3404,0x8bb8.b852,0x1288.b9eb,0xf849.dbd,
0x75e8.5f,0xca70.8ff8,0x45eb.c3bc,0xf300.61b8,0x4ba.67a7,0xbd5f.020f,
0x776.bab4,0x3f08.d592,0xe31.eb0b,0xe7ae.01d9,0xefed.f48f,0xad5b.8836,
0xdef0.697b,0xa311.5c2b,0xa130.7a13,0x27fd.9d07,0xb504.35b8,0xeb44.bf58,
0x61c7.aee3,0xd1a9.4ce7,0xc78b.c3be,0xb07b.828,0x9750.eb72,0xee9e.081c,
0x27cf.fbe,0xb4e0.077f,0x2ffd.06e6,0x5e57.fccc,0xd03.429f,0xf5cb.c52b,
0x80f2.5e75,0xbe22.b955,0x8fb7.bcc1,0xfaba.ccef,0x3502.f043,0xc303.eb5c,
0x7036.b0b,0x4f06.71d2,0xf3d.71a,0xedab.1747,0x5bf5.83d5,0x8585.7f94,
0x41f8.a064,0x27fd.6ae2,0xb1ba.837c,0x3583.abca,0xbeb8.a76c,0x3feb.c077,
0xc4c7.7fae,0x16.ec06,0xe90b.fff8,0x4a57.009d,0xf0ba.344e,0xefc0.304e,
0xca27.f2e1,0x2ffb.c81b,0xc5de.58dc,0x836a.06d3,0x8c10.eeda,0xc017.ee27,
0x6ff8.ddfe,0x7198.e93a,0xc20a.0294,0x185.5331,0xd710.f349,0x990.db33,
0x88b.2e76,0xebf7.c43,0xd70.611d,0xceb2.5211,0x9276.dc0e,0xc21c.1832,
0xdd3b.890e,0x3b3.33b5,0x5e5.cf59,0x1b7b.7af,0x1e06.0e89,0xc1bf.69e1,
0x4118.3108,0xbd58.0cce,0x287b.807f,0x9330.3c1c,0x2beb.c618,0x2b8f.b205,
0xf500.f6c3,0x83b5.d675,0x5804.40f,0x75c3.042,0xc00a.dce8,0xc7fb.04ff,
0x161.f957,0x9829.fc1a,0xad2e.959b,0xd920.0d6f,0x8106.f0ec,0x7c77.e35f,
0x7805.b0f1,0x86e0.7c27,0xdbdc.53fe,0xacdf.c782,0xb3b7.82f2,0xd926.a38f,
0x606f.f047,0x3eb0.0687,0xf04b.3281,0x183f.8443,0x3c7e.8fec,0x8f1c.ee0b,
0xda5.58cf,0x8e40.b30b,0x390.5a6d,0x36f.0cfb,0xd61.d8bb,0xb7cf.0864,
0x5bde.a6db,0xd06e.3fd,0x4843.d3a2,0xbbf5.a088,0x3a23.b36b,0xa7d6.0ace,
0xa5f1.289b,0xbd3f.eb57,0xbe06.e77d,0x6879.0ce3,0xf700.3d3a,0x93bc.a0fb,
0x73f.83b8,0xc0d4.4d91,0x766b.8653,0x3854.d94,0x677f.0a9b,0x7f.8e02,
0x67fe.bb9e,0x776.7d69,0xa317.07f5,0xb260.cf0f,0xd4bf.9edf,0x5309.6672,
0xb5c1.3fd6,0xddbd.7e7e,0x4719.cb99,0xcee4.3bff,0x6bf.c16,0x3cd0.23bb,
0xfb7b.be93,0xe374.bd5e,0xcfc1.d0f,0x4fbe.2a9e,0x7160.1f6b,0xbcc1.27eb,
0xa40.b339,0xebbf.009f,0xf3c3.3fa5,0xf382.7682,0x6df5.aa9f,0x8ec3.6948,
0xbf36.e2b7,0x6b64.0eef,0xbc12.da38,0x4bca.36a3,0xf040.380b,0xf6d6.ffb6,
0x7e89.8fde,0xedd6.24b4,0x3fa.fbd2,0x7123.6e58,0xbd69.fea1,0xe060.1904,
0x733c.0521,0x78c7.e0e1,0x6746.2201,0xf300.2c02,0x917.3d69,0xf387.205,
0x7f5b.c32e,0xf7de.0176,0xece6.7ca7,0xfd49.21fe,0x4e16.900a,0xaa18.599f,
0xcd7a.f3bc,0x1960.ae0a,0xccc9.0e8f,0xf770.de03,0x759d.e1fd,0xc705.c786,
0x5340.2d11,0x6f3b.4eff,0xcea5.aca2,0x4bfd.724b,0xbbb9.d53e,0xfcc2.f23b,
0x1721.1dde,0xe817.63fb,0x28c1.dac1,0xec11.de7d,0x267c.d103,0x9453.c89c,
0x66f2.e0b1,0xa2b0.f022,0xad0c.e77c,0x7bce.a5a,0x5f3a.bf4a,0x787.d74,
0xffb5.0d53,0xaf5c.758b,0x53a.fb41,0x617f.7d7c,0x279e.e448,0xf712.e17e,
0xcded.8d7,0x2705.caeb,0xbe93.9f3f,0x1c3c.302d,0x74b.f15a,0xe29b.feef,
0xee2a.bffc,0xfab1.da46,0xfbea.5ff2,0xe789.c148,0xb4b.a565,0x97d4.3034,
0xc1ef.bb0b,0xfd54.cbea,0xefbc.2acf,0x675.7b7f,0x6ed6.8f56,0xe27e.754c,
0xa0ef.b777,0xbca8.2cb4,0x3ec7.eac1,0x35e6.7ff6,0xf2cf.0cb,0xab57.f1aa,
0x3a28.3bb8,0xf779.dc0a,0x3f86.5078,0x4f1.b05c,0x1ecf.2fc1,0xf6f7.7bbe,
0xaf80.a78f,0x3fc8.8e1e,0xb7fc.4c8e,0xf806.dada,0x3377.f029,0xc780.5c3b,
0x8fc4.ce9,0x705c.0eaf,0xceff.553,0xf075.deba,0x17df.963b,0x919f.679c,
0xcbe3.abf5,0xaa2c.cace,0xdbaf.204,0x6796.1733,0xa69c.39be,0x3611.46ff,
0xfd85.aebb,0x77df.4017,0xf13f.3aa7,0xf2b2.1c02,0x76d7.ae39,0x70bd.f842,
0x2dd1.f103,0x9907.3aac,0xad3a.f791,0xbf03.4ec7,0x7927.dedc,0x5c25.e50f,
0x1e06.39bf,0x5dde.ea96,0x653f.009b,0x6a58.55ff,0x97d5.93bc,0x37fd.74c1,
0xdc13.175b,0xf796.90c2,0x5ff5.d38b,0x7658.5e68,0xfc9d.6dce,0x6d3f.bd9b,
0xb262.e37e,0x3760.eaf2,0xa5f4.ffd3,0x4605.783a,0x9d79.1a63,0xd122.ef0c,
0x3ffb.f7d2,0x9c22.fe18,0x3878.7387,0xa326.bd25,0xf83d.da5,0xfc03.fdc1,
0x36f0.60cc,0x7d2c.5ffd,0x1dbc.a537,0xbf1c.9c55,0x4a73.7c15,0x81ba.397d,
0x4bcf.84b7,0x9792.f25e,0x2df3.4b69,0xe6de.0fe1,0xe283.a7ac,0xc15c.fddb,
0x987e.ccdd,0x6bdb.2a37,0x1c3f.dbc5,0x8b80.e3be,0x3f2f.1e53,0x11e4.38a1,
0x6fd2.87fe,0x5336.0d7b,0x4c3c.1dbd,0x3f74.de5a,0x5ac7.ef0c,0xe6c1.01b8,
0xbf86.3799,0xb3fe.13f1,0x53bc.e6ed,0xa5af.4f1e,0x81fc.e453,0xdf16.1e9b,
0x481b.7e14,0x7f9.a07e,0xe480.bdf8,0xd93c.fa64,0xd72b.ca63,0xe54.ebb9,
0x9fcd.c5f8,0x37f.006f,0xef27.d426,0xb874.fe28,0xdbf0.b4fc,0x9fa.42ef,
0x7c43.1936,0x8037.bf89,0x1caf.c5a7,0xf4cb.7fbb,0x9fea.13fe,0x90d.bff,
0xef8.939c,0xaffd.94c1,0x7271.6675,0x5d86.fc81,0x57cc.5d8b,0xfae9.c324,
0xdc47.81bf,0x7978.f3cf,0xaca4.327b,0x5f1e.38a6,0x8261.b7e,0x27f0.35dc,
0x14f0.7f79,0x827e.b0d,0xfe11.aa1b,0xbda5.9c0c,0x5f83.fbad,0x46d6.d65b,
0xa25e.3873,0x643a.f6d7,0xd361.2996,0x111e.0e9c,0x8bf3.e6d8,0xdc61.d06f,
0x3dbb.7db8,0xf380.7a5d,0x9882.f47b,0xd028.5f83,0xe0a9.fbfe,0xdb99.9c6f,
0xf131.13e1,0x5e59.fb7c,0xa57.80cc,0xc782.a616,0x311f.298c,0x71c3.e05b,
0x69fb.bce9,0xc6bd.bffa,0x5720.7ba9,0xd156.bf82,0x1765.d3a,0xc6df.868e,
0xe93.53d3,0xea6f.67cc,0x2fcc.79f6,0x6bd3.e6dd,0x5f01.1cb1,0x5dfa.0c84,
0xf271.5458,0x1f6f.83be,0x1b1d.f1b4,0x847e.9f3a,0x451f.a3a7,0xb330.efbf,
0x275d.f08f,0x6ef4.eb77,0x8e1e.1c05,0xd0ed.9efc,0xed90.24eb,0xde01.353a,
0x71e6.c381,0x7394.533e,0x15df.58a5,0xc22c.dfa8,0x247c.b071,0x3e78.04f6,
0xe581.77fc,0xe059.d68d,0x9f82.6ff,0x51cb.e02b,0xb257.190e,0x9f02.35e9,
0xc63a.11c3,0x5d2c.f017,0x8007.4577,0xdfa.249f,0xd371.34e9,0xefc0.637f,
0xbc51.f19f,0x8178.f4f3,0x8816.ae8e,0x4bfd.e88f,0x14fc.4f39,0xc879.8ff6,
0xcf7e.f28b,0xe8b.732c,0xca89.3f2c,0xa398.034b,0xc6f2.b4fa,0xd02f.bbe7,
0xb2b0.6ffb,0x250a.cb86,0xcf19.c93a,0xacd7.86ef,0x4cfe.324e,0x5e9a.15be,
0x8b4.35e3,0x1d7a.03f,0x205f.970a,0xe993.7a3d,0x4169.6f8d,0x1a4c.3e7d,
0x433f.23cf,0x8dc3.1967,0xcfad.6426,0x240b.cbe,0x3f7a.355d,0xf205.f08b,
0xfbdb.f9f,0xd801.03f4,0xff7f.82e7,0xd07c.160f,0xaff1.d17e,0x3482.c3ef,
0xfe20.dff4,0x5f1a.4261,0x89c.fda7,0x8955.2f82,0x69d0.2cfc,0x171a.eee6,
0xbeb6.b0d3,0xd88c.94ff,0xcbeb.f23a,0xe01f.595d,0x25a1.82e3,0xec1b.d13c,
0xf446.a367,0x5bee.43a3,0xd0f0.de05,0x59e7.f1de,0x5bf5.e2df,0x9677.bd79,
0xf4da.1f96,0xeebc.347a,0x93eb.c3b,0x7cfd.ff94,0xd353.b50d,0x8877.b3c7,
0xbefc.73a2,0x7d7a.0dc4,0xa5ab.af86,0x2e17.1ca6,0x2c24.17ef,0xdebe.9221,
0x4986.23d1,0x981.605f,0xfdf1.74ef,0x910e.8fa3,0x2f81.5d84,0xfac0.09f,
0x17b3.b23a,0x5e42.ec23,0xfd78.4ea7,0xbbeb.ae94,0xeebd.5e7c,0x96b.d7ef,
0xdaa9.904f,0xce70.9f3e,0x805f.7faf,0x13d6.47b7,0x9b00.7efb,0x711e.ef1c,
0x498e.c6c7,0xa303.93c7,0xc569.95d7,0xf913.d70c,0x35ed.da1,0xfa5b.7f3e,
0x70fc.e84f,0x1bc.dd79,0xb5cc.501b,0xde00.fceb,0xd9f8.1412,0x37cf.8f44,
0x2d7a.240d,0xba4a.e9c3,0x3eb4.4f18,0xa31b.f854,0xe19e.beb,0x7af.afac,
0x94b.8df,0xbc00.e2fc,0xc3e4.2a87,0xf9f5.f3d3,0xe160.373a,0xf70.bcf1,
0xa05d.dbff,0xcfe9.bae1,0x6f8d.e69f,0x83f8.04fb,0xafaf.bc8e,0x82cd.80bf,
0xfe57.e1b7,0x374f.f29e,0xfd69.86c8,0xe1f9.225f,0x7d79.663d,0x97b3.cf9f,
0xb701.69fe,0xc8e.18ea,0x9e65.0f62,0x1dee.79f3,0x33c7.6f03,0x8e66.e09b,
0x92e5.a5e1,0xffa7.b725,0x5f50.4af6,0xfa56.c50e,0x25f2.1af2,0xc9d2.0fde,
0xd21b.bfd,0xe867.c643,0xfca1.e38b,0x829c.fe91,0xe86f.3e7d,0x6825.777d,
0x813e.7f5f,0xeb5f.3fe1,0x164f.e8a4,0x1c53.e3c1,0x4181.fa5a,0xf4.744,
0x9f5.fe69,0xe859.5339,0xf3f1.e235,0x5e24.15cf,0xf77c.f95c,0xd0df.2782,
0xf552.375c,0xe03e.1ddb,0x21f4.28be,0xf5fd.4af2,0x6e8d.f5d4,0xa20d.ffd,
0xed70.4ec7,0x5fc0.7e7f,0x82f5.cc8f,0x33ed.f7a1,0xf03a.de64,0x2f2a.e093,
0xfff1.c12b,0x7f1e.06f3,0xc3e0.c403,0x1adf.9627,0xccca.61c9,0xf5fd.77ce,
0xf3e2.d37c,0x574f.ea13,0xe09e.4843,0x96f5.c775,0x1384.bf19,0xdf3f.2d72,
0xe337.f4c,0x1dd1.9743,0xf838.e0b5,0xb08.7922,0x7a16.ba9f,0xa50d.ff73,
0x843a.524f,0x52ef.8a35,0x57a7.3ff5,0x2efa.f57c,0xc7fa.4fd1,0x3df9.0e98,
0xed6d.7058,0x3993.bec2,0x5114.3772,0xf9e3.5237,0xebeb.eb9c,0x7c20.3434,
0xedcf.12e1,0x5ddc.43a,0xbae.8825,0x2f0a.50a2,0xe80.a9ed,0x4f8.8a29,
0x8da5.5446,0xd618.f82b,0xdc4f.60e2,0xf0a9.ee1a,0x1c83.38fc,0x109.7a03,
0xce69.27f8,0xf3fb.eea,0xc5dd.5fe3,0xce46.1c93,0x8c7b.6327,0x5e4c.19,
0x9437.a5f,0x57e1.1ae9,0x4fb.fcf4,0xe3a3.d93,0x14dc.13fb,0xda16.1b83,
0x4ba4.49b8,0xa0c1.e1f5,0x2817.cfcb,0xeef3.e1be,0xb39c.3aa1,0xb031.5b,
0xf268.1e3e,0x9ee3.01ca,0xf10f.aa14,0xfdf1.9548,0x44b4.0204,0xc78e.01ac,
0x488f.881f,0xaa8b.aee2,0xef65.c7d6,0xa06b.00ea,0xc11f.8393,0xf0e4.fa95,
0x4f6f.d16f,0x2212.35d1,0xfb40.fa61,0xac8.0e7,0x77a2.0baa,0x5d6.7e86,
0x49d8.e3b9,0x138f.8af,0x3456.dc51,0xed77.fd44,0x91c1.9c2d,0x5e08.c112,
0xc3a1.eb7f,0x8daa.57eb,0xfc33.974,0xea43.264b,0x10d0.b46f,0x1e3.8cdb,
0xd63a.d878,0xe381.eee5,0x3c7e.733b,0xb273.3e8e,0x95f0.835d,0xc950.c0f9,
0xd388.2f4b,0x9f80.31b6,0x8f6.ea6f,0x40dd.a6bc,0x47c.fd09,0x8af0.b3c2,
0x8afe.cc38,0x73c0.2377,0x2683.0338,0x6f86.5d,0x1dcf.fbf2,0xd36d.9f86,
0xf923.c7fb,0x47d4.00bd,0x85d0.8fda,0x1866.9a6,0xf8f.0f4,0x81d2.efd7,
0xdeb.f40e,0x2001.d91d,0xa21c.19db,0x7e96.79c5,0x2ffb.0f6a,0x851d.6a12,
0xed82.77a7,0xd2f0.78cb,0x3bac.477c,0xa021.68ed,0xf9e.9c22,0xf1f1.c204,
0xcaf0.a3eb,0x17b.f877,0x39bc.4ef,0x3396.fe07,0x1cd0.881,0x96e1.a12e,
0xd029.3047,0xefb4.1e01,0x9e13.bcf4,0xdfc0.148d,0xfe42.ddc,0xe06e.b2c7,
0x7d64.d83b,0x9db9.6528,0x3c33.757e,0x4976.1e85,0xb9dd.f19d,0x359d.ef39,
0x9a82.71a9,0x3573.3e39,0xca2d.b427,0x7808.486f,0x5e7d.bc7e,0xbc97.92f2,
0x792f.25e4,0xde5e.4bc9,0x5337.fca2,0xab1.e43e,
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
    local data, w, h = i.data, i.w, i.h
    for n=0,#data[0]-1 do
      local off = n - 1
      if n % (w / 8) == 0 then off += w / 8 end
      data[1][n] = shl(data[0][n],4) + band(shr(data[0][off],28),0x.000f)
    end
  end
end
world_x, world_y = 0, 0
char_speed = 0
fly_cycle = 0
facing_dir = false
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
  if char_speed == 0 and fly_cycle % 0.5 < 0.2 or fly_cycle % 0.5 > 0.25 then
    char_speed = 0.75
  end
  if btn(0) then world_x -= char_speed end
  if btn(1) then world_x += char_speed end
  world_x %= image_width
  if world_y - char_speed >= 0 and btn(2) then world_y -= char_speed end
  if world_y + char_speed < image_height and btn(3) then world_y += char_speed end
  fly_cycle = (fly_cycle + 0x.05) % 1
  if btn(0) then facing_dir = true end
  if btn(1) then facing_dir = false end
end
function draw_world()
  local data = current_image.data
  local image_width = current_image.w
  local image_height = current_image.h
  local n=8
  for i=0,n-1 do
    local lines = 128/n
    local srcwidth = image_width
    local dstwidth = 128
    local dst = 0x6000 + 128 * flr(64*i/n)
    off_x = (flr(world_x * (1.5+0.75*abs(3-i))) + image_width - 64) % image_width
    skip_y = flr((world_y) / image_height * (image_height - 128)) + i * 128 / n
    blit_bigpic(lines, dst, dstwidth, data, srcwidth, off_x, skip_y)
  end
end
function _draw()
  draw_world()
  frame = flr(fly_cycle % 1 * 16)
  u32_to_memory(0x0100, owl.data[0], owl.w / 4 * owl.h / 2, flr(frame / 4) * (owl.h / 8 * owl.w / 4))
  palt(0,true)
  local dx, dy = 2, 4
  spr(16 + frame % 4 * 4, 12, dx, dy, owl.h / 4 / 8 - 1, facing_dir)
  palt()
  cursor(1,1)
  print(stat(1)..'%')
end
__gfx__
87c9dedbfcf6b595a981a4ab4ca947ed37a52bb4eed858e9a2c4695d86383ed404106fc0960c238d22ba8c20c63492bf146a092c564d5b86b7530ffb01c385b0
bd802b88cd08dd8a733b0b71ea78c2c022c5d5102599460920f6b291ccc6e10553ea18a4d896043ac9fe7e9fecdb49c4793397394ee9a235cb7fe9fec9fec7fb
fc77ecd3c2412f2979cb4e52f2979cb4e52f2979cb4e52f2979cb4e52f2979cb4e52f2979cb4e52f2979cb4e52f2979cb4e52f2979cb4e52f2979cb4e52f2979
cb4e52f2979cb4e5ef17792ef9cf965f2eff6cffe4df3df76ff4effcf72f3a77b4fee9877b833f7058992c98241b0f2a85c9a908582c5ef15de7471f74ead899
2ebb4fdf2ef1c5c2d5c772b59f2ff8626b171a876ef6f4cef98db31f7733f7b33f7333fdec8bf672e541e5cb1132fd4a2f115663f632f632f632f632f632f632
f632f632f632f632f632f632f632f632f63ef75c632ecb4e52f2979cb4e52f2979cb4e52f2979cb4e52f2979cb4e52f2979cb4e52f2979cb4e52f2979cb4e52f
2979cb4e52f2979cbcff4c52a0fb4f3c74df9855f5bd65e5ef7aa2150f52a4fd9ebe7641bd2df90fd3d57624757c758cbcfff352a96be4a8bed7bfc2b5f32b71
3d5b8979ff1752212830723a83d6ff3a0beac3f82bec2e818def197f23d3e19cefc5c2ef12b87d16cf6df8ca2678f82ec23c2a8d86a7f3a9471df9824074ed90
b38c97fff085c8fde862e3eebede88e3ca80486ff32306225168fedf0eb0909546024119942081027d7fd6d480b57271d60f5711acff64522af8ebe7322d7492
6e5415634fbe7651a9ff823785052a8720b99480c7b945fcbca9970df0e6b84964394e3af1e81e861a038646bbcffe35af1cf9f7ca522df2318c5df04a1082f1
91e19d7491ef5fda0540a7edf4b0c4f7207a6205dc45a8e8aa33943bbf2866c741bbf820a3ad2546f67f1a87d3128ee7869eef1d982448f1e93f1e00e8450f82
d3423016cac7420fc1be5861328b4ea6a2d6d7db696722fd09763a13039e8b4af99f2158c6b413343cb19838d65d9ce1b22f22fcefa23305961fdcacff849398
4fb40eef96cbd7f26da2ed6840cf09ce24f5d1c228541b1a9e11d9077411bab449e702f7c4f0eb2542f1c7bc0f82c015e8a0062a854d45ce9447c13b2a4f5543
1f190639918ae3e8248c0c142e7eb66e4debcbd746ccdb64c8e2b9208fe65883ba241583eb8c7d258b828f31a1dfe33741f94491dbeeb5dee06a89106219aeae
13460c60ce8b40f65cf117945f383e0fde78d2adb36fb7037c138faa8466285e8258a78d27420ccda705f25796c4ae17e764130315fbc733d93f775dffeba884
492ab5ced4086ddeb5358e9cb19918b2e3e9e22df749a0c0d3d230970aae6e69f6a4900df8c21a20b70c8fa7a5983f9ef48c276f9bb88621fed7b627b20dd849
1f990aad107b4d686081449a126a1703d254ebe7ff82386282b7b5564ff36fc77fdea7d96201e7a315662c124066cdadb9490495be1d732631876882c6ad4db0
8e02364b7118af746f97a1832f6a52a8722bb2d36f90cf69e72474468a115afa3ac0b772aa174edf566dd3c13670d7de0744ad48a4d68adb65ff1bd0d1ca7e55
f30b2064ffdf3c083b1f4ce33a473b6e1a48008d144e1fe049e223d795b85957f292926f325b12cbf28c8984eb40684afefb5428b6f991c6cb1481cea5ebf401
dd8d87b4153c0a53a1f6a0f32295c929d8823e3cca51d0cc6b5a748a0a65ffc2a5a7bd7bfdfcaef33d5c02191dffe786024bd03e85ce0ed3769c68bd1e9fe4c0
66e1ba84192161c191356fbf16c61c5b858b3a8d3b4d897458c82b4919a3c12981ed746c4e29de1b362f1c69a261e576dcb746ff4431e998a88711e439a32140
5e1bd21c8c2a82c7c10a9695c929fa942936d6e885e808481886af1f0313226afafe57244c2963cddf0adc0a4043ceba4f4032c83564a24d80ff18405b673459
3cb406ab8298345f9082425432305d4a8c7bd19c3433e618b82e4d093d32d820e08245c64f23d887fbf92b0f133b1da4ea9e4d3b9242f6f38a49699805ffbf74
16269091139f41db4b3180b097188cb7bb043f2d1f1d48027226f1f62cc8e7022e1a7133312a43b4c80ab6fa26b422b496b623c77e6b20dd1cf7e9c0a258a68b
d6ba2a2b314dcd03920280358263cd3f2459247cc4613c11af146a51b3022a79b613f496c35c7a876160c88ef425ff09aa7484f46a52e9f90d8fd3f0af144646
37124f112942b26be9a01a8f818b49cb09b0a4d349128fee9c8b0e49722b6cdd2d13a8590cc8644e994ae9aaf14f496a244178144c40277468ec26233490ac4f
3167774aef749aeb35e44e845ff4b8b90943dec3c7b04532a05242bfd84962e85c3de44b2c1be5c4eeb24d72da8182bf4261a5552ea58af12b85223a49c858ed
ce44425c2f96cc74acc04c6936e744a654252d464c43e0aaaf1cc1dec0cbd1c90235cd49a3d8e78c8a0c0846185afe06c6cde580610b8445499d8e7264117c21
c67e84212339bd8f863fe91dff94367ff5332706e664ada3aee741b112419f456f7f58c8d1db8ebde5226f43aa194245d7fd6b68c0a16fa843549522af8d1d80
0b91d87ccd38641b87f8c413eb1ced885981922692973d45349b5f1218e84d279c88a4a8241764ff387414d6f387fcfbc80c5fd0e0a8e784829124a9e69c6d65
6b3e8c66fb25e0ffecd9e04dc13c8c006bbee27bc7b7d7a04258b7e50e55c48487d7bfad95442d3cac8a012db701da46812d7b8e6c74aa14848431fd87af4f3c
264228996d7fe81db8880c506a85572d271c3bd2a822faff137b94c05fcbe98eef56431b8f78eba5309cc54834915f3509a806415202309c8d2ff3d208471c49
40d7dda4a3056b84a7a713bbe05ec3206722165916182660758f964c128fa1981bf8361638ca5e4413f7f8cacb8c592964a6a7ae7c6534db3f5fd0885409f0b2
c168881aa02f05355daf1a00b1142e185ca8baaf4a82dd991658522ba87094b98aa923584145ba18ac679895366dc505dddad29b73e8f80fb96a02bc9652f8af
14036edb8c38ba1abc40a77e63d58a0235818dfc858b94232ca33c6ecca53906eaba253d98cfd06ed5422e620bedfc913539a5808e3bb93304c4f1c7019f96e8
c0e9a46475dba17f5c7d9d5345b87666c41265df49b1e05f3191b8824285b98d50a7d2849457e704cdf4cb8c00f44d91b88d1a47317bbb4d272980c422200a23
17b9bd2af2e132ee13123338fc7b2a0c259722b7aba021ac1de742a5a1984295341e9a5127abfaef10b7256f7f30fa2a456ea51b60fbac4e17ce5e89a677bfd9
0bc8098295b276de250cf4f3af002c26b92f3c1848b0f726f5224433a00f9d216790fa2a00360ed6a34843cbebdccc7005aef999945a2cd50554222163b9871a
0fa3227fd78c0c25018af7f34ef5036f84c5198af8f96ba73ab150dc5c19f618a47454c5bd2b332b020998d237dae335404647f56cd361b57e7c7966968b7522
6f399ae781379d6422b6fcc33595bb6c982317ca2890c346649bad767c45b40fc4c41f321fea7ca8613f0995f86e3c53851a7692b207783e442e4b5eebfa1c62
86bafc16395e3873049e08c26232f9669924825b4ca88a1af0b16dab40d6ca1b0f742c53148948c58c6a4c369e8b366c667ef119a4281409e64069bcb9ced234
ee1d69110241f006c22779c22b815523cadf87cb5c1d8f88d8e64cd05725cbe4235e527ffddeb840b0b6051c9898262fdad31ab1dbe5fca00ca98614423bc036
f08ac89541bf7421a23af3185c5cbbd7ef2d75b9b31a4824331b70bc4709356552252321762200b690a9ab1b853a111da1be98dd4f4f949237c2c3217d2b5436
20b0a8ce5ba1ca14b177d2cc455656b0f4d809b4ea07497225a3ec0fadd3a54826f6d93fe4e01fb54a15803ab706aec15542e68133bcb76c1f87b5869a7c2e51
370602d62ffde0bf3c82e13b7f026b422c2634a35d219664893778cc9484cec840c1d79e501e6b7d665ed77322bd6e496c09d7d6c48e370c3e5dca39670bd941
ac95a8da57d4d2996687efaa70dd298bb4a2f61781ec7b9ebfb871c7d4616d926fb47220689de9d2073f5af242a4ca4e90d8d0991c34500172d54647a726c08d
70456c689f6ab91b9821cad6b1ba6945462321905d3568284106b4810d5e9ea291a25125653129493ac08c4e42f5c189afb3418ce65845f081aeb744223b119d
a493243e0221f39ea19a960bd126de190144b19d2c1dbe7555d1e87c50d4baac4a0e3ecaadf229adf650537b6be50ed072437ec5165964e27797239ddeb6870c
9030641b242e6366153f1af4f2e1bac0c8b2516b84e147b49a8b54597ca44a157dadec1ba60da19104e0c7e6703fb212c91319dd05e76c21021332d4013b5685
d18e513081eaed6ba6c36e07f443f89fa3ec813c1b1338e5c0c2397d7d81bf17ac0ae694b186af4da323529074e6b90f805e0e560a8fb86e6f22f5bfb77ee505
93d7ab236e6e8cda3bcc526568987ac8c6548a4a647a7e58059ac223951fc85f6b0556c558a31114819739565df8d1d1bc0095388d2f1132c51b031401423739
4236417bc8423b9a33aeaac57f4fe86460252cd1af698c81548fc9304f630389e852ef6b4d6b13bb71935cc6c22f43122930850e6e266e9c175ec6ca20082208
c874ddc1f8da9ff447691a31fbda091ddbe97ac99b5eb6248d0ce336c222ca2009e1fb88933713117379e28ed004167b4d84a52a1b9a0f1eb72eb13384817a52
8b9e844921b5a91d8ee86289215485b13baffc321a1d926f4c77e4ac05a4ec7b5266f5c07353c3e9460ed926f9d3d8ab9f64cc775a77eecab2db712240378c2c
e13ace177246cbafb2f5cb344f5f7b24ac429883488566c0a6ae2ee77db5401e94c927d6e9410fc0584d4b2d3a0cb4af612ab8d8e049744c045d70523db62f8d
bc1a1dd5ab05be21a9c03c03330e1b79a1f65283bb4141facde7892a6e9277e86d7d0958a08ec30b01a3c0e12a7184203bf251e52fd509b146e3a4f0a3100340
283fbce85df73c157ce1b20ee53e564fc251e5887ca6c052c70e1ebb0dec8e3a11bfc880d838f2ce70ca439428ac2ca1343603e453bc24ca54daeb630c1b0546
87310fa98df64e55ab2b5b9035f9a39a064d0ed29a1edd65aea313cc33505d06105387767626db54ff5497fe6a60a5ece9ee117d148884faec2cd343ed101d23
c3a0d266a56538a7123211f61a48c83dbd3943d28bd3bcf352aeb8d2ded44ccca4cd69105fc12fa4ec4ae0322c1b6483a380675eaa3f4192991ff656b2d658d8
b19b7219dd133a31131c6423c5e9c50975b39ebbb8af1985148799ea727b0b5123cf42904797ecb739080e9e648709987b0668d099b23088a468eb044082d827
aa3134c901d019e4434e637f136598bd2be153469669df4401fc7a08b79615ec6b59c834ff3cdf75c7eece5c830ce20bc13d4143ad918854a94e9fa5b8c4d4ab
903dc719e03f461181d0cb745ef8db9102918e9516ea4ac8260c2ed2b93252b4da7968d0106cf27ec793f7ec693df13df77edc79c2fc3943ddcabd84b5f155e7
1108c896a4b5a26950d885d83799039c9833d525f6426b23948c827fb107ef5e8f5a1e22fd27c244fdd51eb9235f3658f543601093542a306bd71d0f06159ef7
a9c12061ab9615d41afeadb797cb9b23c6d3dac94b7d451a93febccd4a2ebe5a15a32b815e35f1f1ae9b597e4b3f0690636176b20f82681d9883c21340ab0566
0703ee9543f3c4ed0bd03163a907749189a2f29745a3c5e45e193e627f0f29385619b18f383a19bc3fa5ad25cbe4a273cc375dac41c4bf36b73d335fcf1bc9d3
79ae233c7f4d790058052125ec96c6ff7fab898ae468c0665e6312e8d0932de54c89fb0562c4b7a8998daa4fc5e20bf53e4bc2bd4fca07d619c221713c34f69f
9be7093ef48db3424af8833df4154bde531b992a4b7eee7c926a705a939815adae9b9466e34083d7a3b7fa9dc0f60f79c437ed93c443256eb8167f89c0387f2c
ace2f7bc3b7dfafd851f139f6f0c7742a3da43c10f826650535bc239927ce349a19d82fecf9b44947fa55ea92b823a20970dfef6cd9c4e70077726b67efcd118
59649031cc3b2bf31fe797bc8940be002debdd747329f9a17839e93a6ac2399f7f29f27171b2cc2b075966a065317633e15fc91d60a0deedc94e3998b7e287c9
6fa03731535ffbb5973f6834d30f270061c351fe7676723e0202f07613926255837539d5f6d903fda4821e27ccc5c62f3a0c89f22b5a879831534b5ef2ec9660
7166ee4c4ff18c58c29a7a4b119588cad2f32a23e59115a451e82286ce31dbcc408203604fd0b1e424b0dc3150d07d384d6123d54de9aa166ff6152054c5df6a
5405a5f09a8c459954505fa71561ad985afa903f9dbba448fb8940eff589e56e27a92b577a98fd8f78761789ccd3b1a53089c4595efa61942aef035b52ede1d6
f220e5cc9a12f03ae83f634c09be596f97b39603d003d8e47632013281310d12ecd2e8b249d2435e5e85218851952d0e4089622c887bc95b135a244f33634619
6216c12460b10c94e4a2137bc593ab4f62592bf7e88dad6043982475c813d0aeca749f50f66d1cd7b57636ea713fadf60a23f6d6fb720fcccc7f28eeac676b0e
fe349046c8bad2250bb499d85c4be09869c932d411dd14167cfc27fe50be78e297491ef0a60558b6cb0ebec41fb442ed8de9de98a36fcf3489347fcf871de4f4
0efeb836b89e73d86c9b005a3716dfac46cab76cb485c7a25993b65189c5ff0450cd55862cec6a9e2644dfd0a4a0ab766d994fb986578c506d025542d602352d
6a3804b2cb21e6f96c2a79170f8e5c153cb8d0e2db0fb7526f779abae95b10641fb76b5b8df7af7213f537b3f2ece4a169d2f262cfb0acbe8951bc0500901445
6fe087ec9802f9dac1b6a1f8e23107f377eac1c3e3eb10aab5630f46edf85aecb0e66b77e623958da040dff4ca976f85e2403aa3b1c099257b965afa40abf2a4
f1815b2b96f8eb987cb36a7e737ef79de8959a25636013e43a116dd9e8a231b4cebdf05208f69efd06d4a54b262bab3dd7ff0fc28e1a7504650ba8f529ca40d4
ebe1dd3640125f4fcac56c7c63b60cd44d062e28730330f605261ab6a037f62c2e038a15e14a5c2edca8141e8011a9c6d06a0bdc5eac1142c2f40eb07fd7a303
d07cd0725eea3b5d35f4f4f444b345e7d70eaa16004915f7b451be4b2060a84533938ef19174b0210f0a22ee928bfc449276426dd3c98ce2f6f324a69da36413
f8926c85b4b15e03c00fdfd11525d2eb6d6f119526f1d56520e8cb0b6b97a7dfa093e5e4335bccc97bb9a7c3049d3de536fd27036b2ba0a45cf56a0e9ef96c07
e36bba8ed4f184bc7540d0d1ca070cf09ac2d8347c2d56facadb92e3cd52d38e92495736563c25917795937131d0470ff2c3858c5a3b51571b69be96138ca6b2
320a7f3668ba45e7081bd0ee0b65481fd067543738e9569eb03ec5f54c6c61b0a51b07da2a4f3cb104866220dce94868acd1eb032b86b76314eb63f51bc83593
2de94b17f20760f7ebdd3f15959da003f77abf453fc17b969c76681a1e9073b4caa431adcd6f281c2197ec3b4b201b817355e4941e46bd1743fdf823d2100c11
60b2b1e08e3998773053716831f748d1189b11ee01f7d9f101d925cd1f13d325eb4aae84f4e53115624872ac01fa8d7abcd33e6244c2261754f2c3a5c2405e0d
c46ac19b61073e4866ca8502246df549726080435b3fe0b01393283788489e5f5f10ff152309965e8a7e6625945625f2a33d51a8a15d4f828138b92790a648b2
18d86aa70433f610c4d90c66afea2c88aac6ee59389f99f111a0c811c2b4bb4fdd27ad84f402838d2c90c8932831c4f0aba377afca72bbfa43da5afc480996e0
7a64e43901ee3c64f51be002ee5053a716230c781756fcc1f3e1152e04dfd23bc378dcc58a2c6cf45903ceb49fa56f3615204a97b62f43f22e02e2c83df51705
60a302ab5695c92a4785f0b5336653ee971cc94d27c69731b6bd5945c3cc3e1e8522d2f1624288b2d394398f7bba02983e39c4cb3645ab331dabfd95a9a9296c
6388f0fe80d3289b7a1493c855ac6a6c95f44139f7a2b01c3ecafc31967b2d476f5b660df64f6fc6907e809273817562690601e13338f3b92f49f8d85686369a
f7698caa402771999d47fc84995b0de9576447c62ffcb29034097ac0c608033d7e1326b380bb53ed7afaa2a337b1b919396c665223060b25c23913404d20616c
31de95a95c2ea5d7270d43aa9d10c262dd5ed089e4743e0397163c2e8dcc5d9a13e454875f0b9a988db6cba9a4f44ae96a959db11472a88a9192720842bfa1b1
a37f85693320fa339e8d4559d278eff8d9847ce53b992a623aa1b211dbab3164c086da845258ea1e776950c035ee9540b792b30cd549d8829211c4339ee1df00
a7287a0d62c5d33df71b2d43ec2d44bb32111539aa8784a8349fc1b476c0d1bc67f5139c5e859d4a4b31a3a7c080eac51f993112975c6e652ec0d3cac54a82a2
e5b36b48ba4aa60dfda4c17fc4515b9ca2e32f784528b9413ce2a93c8c4ce9a3ca959a45759d8e9ad5050f48057766c7d87d63bab768111be85b2ed42a5a37f4
e9a79346d192b65d27f4dd3a2ded4bae56bcab453fda79271ee5b145e330bafae7795ff89a11b68146466a269af1895a838c3c9011570fc476f2c7d33dd6ced2
d5acdfbac913407bca4c5f6fbc8c2d8914452da79954e2d9cf8fc6ead451a7159a81600d7a7d60ae6465acce0dc0f14253c68b59a455a246ceda6812597b756c
2cb139e65f22633c7365dc432185005d9aa45c0e41a8450a1e16fc16e7536bbe591b776d142e625beaf26c48010631de56c5b79e1b8caf14b71d2f1c329f4312
1ad813d2b081998957bdc0cd6e199dbf8806aa8d8a7363d75f4d897ca2ab4bc1bd3153fe9c03d857883c2b5e54ed88b4525f849052c3d49196fe1bd2564dc0b5
71d590f0248a40e05d788142b4a8d46c4c85b4564c0263ecf1d88b733ea48d279d0aa6d1f9eb8af42c7cd660ae6a36291019aa959c5d58006219a839ca99b1a8
4827ded6c6830c4d8eca92c8366abc65a8a0c233cc565e06a3cd7e8cc9792e457836ba8ded4801f1cf03a7e78759495e4df226a7cbf113bc651a055f44750f6b
1637ad4c6c26955d17a8aa84facc6ae9d5054b685dc0f44bd4c0398d73f8aa5993f23f1b5157be4bdb8e8a985d9615c1e444b2a6bb8b4f83201fa80139bf198a
93633b9d0c44b57e8ca9ec28d6d357c6af28719e3079fe7c326adcae8a5b7696378e1d098b494425dcd923b5a5a2b77becdcaa3cf070eed239d1fa8517311440
e18df453269d7b71a8fbc8198da16e122cd77159a872a9d1d3e422a21832516f8595de97610a6faa4d7952190e5d620ba669762ce0a79383da0364e73d6e0ca2
f463a6e4377c60602afc1b1a309f82324059436e6417c3f4b796101bdc1c5889c6b5d2ee98eb6f4c3c75c600b5166278aff1a68bff2285a1717a4cfd249d9ccc
8226ffddf4fa2056da8790c8336f94853a649544624b7b965f73e8f1b0d26d691ec860e3393648b7a5d64a84f52891f21de3037964a635c9d05ccd26318c79cc
5e8d49b536d6930eb69a9b16c8a7a9da94f8fc60696566c8e668d7b7da5b1d35959e159470f66382be501c255c324a4925a0a854ae91bed6d19481b165269849
bc14e1e2092fe50eb0507532a71a785c794174f4efcffc79c5969e6fdda8f03ac7a23a21becf6df835505458658d1d3b21365dfbc6915ade69d64972a5249f85
3a49e3e12f442b7951f17fa531626288b70d8a63bae8e9590395c8d3b911bc8de0ab2672e2178bf22c2313c42765c62b5cbb3ce96ae98a87345183ed06a70261
6da561aea41bac4831183270edf7dea0c61f6fcc72100d9f4871c140ae94c782686cbe0b4e31457e58aecf5d7c7018caa8e3e6911eaa4a573a2aabe1752071aa
7ef60a5e28de2b59052fcba969db8145c0548fea60cd4ad9227da3ccd21ef962f7ac4f85653335a5751d9f9ba53fe95c7c2f092987496b80453cb10012c6f4d6
d2a292df72c9dd255ffe96c47161f6667cd9dcf2c92e323f1effb66730fff74f3e16f82cffe52917827a6f3660eebb21e453280402c2db71d3f1d47542ca352d
b05c8c07019645a585c11f4ef9fd3941b417fd25b9bb263337682e71f4c47956919a99801e30fbf704836abc076d98501a869599f2176463f75884adc4a9c877
c857939ce1b798fa8f514c17cdb07bd81afa3e7f94d600c1cee2653254b1d34f5b619d7fff80a832069a88bbcfb721f5a67cff1e9d2e65f4f5189a8fc579ca75
ae4c004e93c928654d4a6ce31d4a99e7a9e09e8ec84fa791096848b559a47f7d45aeeac9c6435f55614916d964a6070e553db8e69b217f232dcd3fd93a82bd98
227e28e5a95117fc85fce561f0621ae60888333c16986617c852f4b238d275491046a528cae9942630f4e19c93a4f1f7cef8bfd1db455266ce8627a4d20d1e25
db0e5e8a59546907a71b30f59a2034b8cef5493d0f443eacb5a7e7cd2262621ecfb36b0e4758f60cfb4cf8a0d1915c15d5ce38a8e5f6ca401ccb1f95f4f92b1b
fd6535dd80f0eb6c286fb287ffce521d852a8436273de0759581b1a3b098d333c8bb7a77db969cd36b91c82702b33e04442c09cca17519a1940070bc28140eec
c33ffee41eba738cfa1e22c1e5a34c2cc9174d9f5bc71e716fcc1a34d3c32507c2fafbab2d1457a519758bc533eca1c0500d51ab2aa5e9df3c1bf733e0fd612c
f2b343d9497b2e3c77209f8fb4c773fa24fe28dbc3b82296648cf76cc789e2b0ce8dfac5bb69103aa24103955035ccb743860f869e6b222e3e5dd5cc82680217
83768a4c1b1f5666287e08eff5879b9f5a567b13f1aa8e18029e712efa9c0ebec711b32c7c4fa2b93d71a7d299e556c2313bcdd8239d066d34cbc1e39fccb314
7e311994d961af9ff228753b0da4435438f07d1f8c356e8e0639b23c7d72b4f0e1e59b64214f4f1349f40b9ef425f6cf5bb9b81e108843d94e751fa2cf2f4297
d14b30c7fc279982f218e213bdb58ce59d1124c73b17fe1cb8891ebdd451bea3d03a2e073072b98f06ffc4a6229a0f4b72d0d30e3b3fe7b0d6065536b33322e3
ba959ccab1b8981e00398c3cf27a2e9b116f5e9ef834a03b90ef288b7def2eadae76e440ebe63d1eba0c3ffc20e117894e4a4eb8f20f9d760c8f1abbcd7c0409
cffb31a12908d70d2f70f0fe327dfe9bf8ba0500afad6eefa327c1fce0e11b980ef2c2e422a82f670aebabbd3a735ff52a0872e49eb74aff2abe1a500555019e
807f6a9e79d2b646d7059d39587f0d4a68c3ea0c6c90396a03b1e00dee895635ec2149f5ef6ea369762e82b22cace9d8bc43e53f274a1c050b509aca1a298a4b
9382e7588f938e8c3bdbb65d7279ae8c7706418e9307ce7d8770560cdf7f50aa0b1d0d6007d0f6f80561e7f0fd1b22bcb835a68fe0d19b6367f61803c3c7cfb1
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
ac6bd71297d45413650ad29690bcc9cbf5b4be8701d455f4f2d0e1751749520f180a6ca0c1c108e3215a867fe559f20167b43ef079eedf3c20abc47cb7f45d5d290676911d03ecb0288afeab44f0caf59f8a5617c4708a7a5ed644070ae37dd129e430977f6eb88e31dc4c60042e106d198899d990185ca497c74021fc8e3aab
0f131152dc96b4208aaf7bb50a4c242c2c0068554bc4e306bb19a9cd3fa9c58fd4321004d929c28b346f93d7ad795e580db68a6083575bdefa7ce50dd23c4dc99de2e062dfd32724276053af827e91e7245ffe9b6b28672811a26cb7b0074804fbf4941fe4d56766bd421278fafaa89b943799942b3e71eda9f5d7d542a0ff6a
__map__
28979fc3dfc7902480681b75fd000407fcaf6be133323443eaf3f75fa38014f9f5d1f372b621758db65f336e63b59099d78103d6f6266ce85c44768f7bc1b69cb2898c2b159fc309412bb18ff7b08360fe5ef169c1381015b922e6f75efe9ab225ec5992b21af15e4fcd979fd2f452014f10196b44db54b68f948160c39d5a81
da22d587f4d14543cc71de676211407dd3f6190460cef1e5d720314fe01fb4f00571eb53eae2d7c8fd51171f83f6ffda750bfafffcf9f3070fee6d3a19b8e22c80938aa5cf9e908ff89ace84268b02c2f735470f108fb13400fb598b292e65b691b22b73d51164ec756a2eec4582e73c7aca92cc22646d0a21ec96ffd82e5433
9fc4a8f66c1c66d8adc954993d439040dacf8e99bd54b9fc49e2d5bf32296e8bcde6e7b440e2810c2ffcb904a8a1684a91678f3e43abebccf36758300843f57ff205997574f2c800c7bb5ac8fa8e1a8095210bd667e23cd05e0c97d00e408f8e999018002f00cc7ff8e5f37badfb8eed18086c48a610c0d721c6f842848dbd02
f58c69a4f3893f2c4927f314cfb0aee348bd42f4d8ec935c883da01516499413b5d83b781bf952cd84a8accea2357152f1c19728e5e92e09e91728b73dde711c2c237a1351f65b01bf7044380f4746b6ce49a447079a044b13e58a2414b67419283609471f265462600c387be00d6a9f9d636d7654dbf00e4a400dd9887e1c83
6090982e59e4833f0771f8733607bf9666563f655879e89cc8d7180e42ec504301bad5c12651a1c9e8dfbf72e50ae83ff2f831fc7b720d0585fa85a86308ee82b15b2834db3217131eb7e5df22cd08b7fcc92a7c94c896595e574f20e73c3a972bc1dfe2582197ab7404f0218d624b4c484fda7a29b2658f61d46400b1ec1209
b337987c96746a6b266a7d7b916238d825c57a84d28e724066fb85be23e3a78cb048481646ec5c45523574ae02e2d7a6637c207ada27674c3a0ecefad2ad271d3bb5db4457cd424b413ed80564ff8849fd19fa078cf6ba664ae7b808cd77505f958e52d0ae4bdce85cc40364bed3ff6b0fdd278d16a6004b649ce07209246d13
1cd3d226852d088c53708d5a6b759aa21bbfd4450b672612e717c79eb70b2f3548e0235e4d38b4fc8b4398d83a6be8b0fd05e47e5a226c6a02e8d496f91d3d3cc80654e7f9fccd947f5c3273e72dd57d11016c719118ba1840ee9cfd589ad04d23941f236f02d2374a643c948378f6b540afb4e716657ebcc3da8dceb9e325ec
5a28a48fbe26de7f76a816a2cb4a8d3cc6681e66832e3e5d42ff00d5c86e53250cd22868ff681f40317700c2e7a461751db3c12e227848315f0b24a185bd3e445380b300271fd7b06c2eb1c7da441b24b2f4b5509d82d9afc9d44a54c09306994b76120d5745824d61fdfd9b6f06f380a4e3b98b3e07aeb8bf28bd7b24c32f29
13b225bfb75043adc4bc469703141503e174eaec22924d2c680516ce7afbb5429d8c573eb6ecf74fd8c4e854f82cbe91254358b462b3c91e9af118ca9538e82f6cfc8e21196925501b223088e48495443541c16907b8ffa7dce833f6d6094c149e80e2529a80946617cdc413c206f2288f5b602218c72f9e54e1f38a3c052b00
d6bf4acb4580c997cf213c78803a8880ce36d5d0c3b8beb8e626ce4940b0aee988b5893ab921c099851946073dd2f4949d8a9bf37cea980cf8fc0de289c98d6fdd6df482df56b96c56057d5dd11c71af60ee4098d16ff2a83674e12b2c3536b6c210690bef0c9fa4a076122b055d5226ec44605824aa9ca005c27854df9fb33d
1e4a3e46adfd672b6aebe16af711996f1fb76015d42fd4260ac936ae087a60d958e8f61cab1f01ab36306d467c770c7cead808f51f6f6c5cc338efe1150d21afe8d23056b90e8c6201c13ad77ddd9603c53401b55dc7f65c74701531a49b555f15b0748fabb8020dcd5d76c561f880794937e08e2b9757bf8189afe3f7df3bfd
87dbbfc00235bfc5bf7584dca48201cb6ffff2c32a77e58da772afee39b8b99999327da18c1aaa996d8e32d5a87853e3631d60f7239f9207aa3f20a2033b1e59bdc742a0bf87dc899828a05c8dcdf94320b38bc80f0638e50379562aa145c6fa4850a0d8533fca8d879baadc2e9a770fdd278ccb35f81cb0727a7d152a6d801c
3c27c0e75ec6af13d3b0f663c47d591e39b3898fa476419583751fdc06a411ab38736cd5d876dc6fa1eec3d7df5c46363f0709c441e2f57d1cd93d2a2804eebf6f3dabc19a7cf35b52fb012aaa6bf1afb4eb6be4b788c3f7583c8d122388326f68855c24824c4ddd3430623e9f4211fac097261d8837d4ff4e71dbc86f7f8f22
9521526598182b724fbfee19eb8a0f9ed00d60187c717103984108f77791be342b83f16c904a3c815cddc663520084bdf20cb97a0f35d539907b3893472904838e758064f7c1b9837a436b34e69145ef0a5a8aa7643d0e54a9a03fad058c3b40dea08c9005c4201b1d08882aab6041a2c97b649090c3c4f85fd0f0eea3bd4221
00f9c1a92dd8803f721f7b62f03f6a22a35df9f65bb5fd68eafe2ac551e1b7f838a3fe9e956830585c5068455c57d2fa6aabf29447adc31c3b844bca7eaaabac0576aedf43f70a860f59c0c08f8c5ca05a6d903d5e6206d4893e38c487cfd0bdb34f7d887afa31b2fa3fe31d785a7bfc9cd4eba9230f72ea29301aa27568e2d2
530aecefa3e9a4680cf07e0628927bdc651e964acf1e5f63caa0bf97f13fe14bec9166155f89a8abcc7f44367613357fb04c26045d3be87582faea6e3e206942962f33b3aea15122430fffc001d4793a0b1688749f8bb2f58f84a7a4ece85c41096ffd7f9705f10f8e2b12d70a6f942d5ffd1675f92f55f9dbc8a5399d3cf8d8
ee9ed1ff0f745efce42949b404e57ef1b27e4f6f60431c4011cd96d08413f3e98fe311c6e3447e2ec043b00809c540d73990730c7e48f6fbf21570028ec7eed6237ae8022bed93d0207f8ca1dd2589da1b8f9f3d06d1e1d045a4f93136a4e1d68067d542760d75c94e234bbb92eef8c815ecdf35fa102346a42b2f3da2a91755
07d29046c1d8450d80aaf8f52be1f76012331f6838c37afba1d64381be2cf0dfd29d5f9c68b4382c6e91a59acf8815838393760680283e2192b824ab7275163987cbf5c4b4f9d418aaab144e8bfdf5b24726d6d96f1fc85449e1fe6e7da8cecb59658785f3fee0ff9ea1d6406b889a0bd6691907690986f5211adcab2c338c24
90f909795e15a9aa101bdd740d9c74ebde3de9157cd993c70fe0ab46c2ef7ff5b70f64bed7520fc9a23dd0f8016580dcd9630e1899d36474bfa59ef12fc680f25503fe0fd0f97d85d71826a6d943ecf70cfee0034a5b05defb2aeba7bf79e2047ac6baadd6cc4ac08953b338ab2890aaabca9688b736c698738ff0fbbdd655be
ebc8e5cd029986cbe4b8d13e08cef2e71e857feaf3c047329790a9c4665098fbb87087037880ba0f593be7e0814fbca6f7045c0aca00f26e43dcced21255c2f40f2a0656e23eaa047df93365a1a38a939effe75e353de6df7f2d9732c1c189d4ae31d12bd2650b9ba629db5f515f17e8ee12eafbbffd771ce8ca5885829e3adf
785661f919718dfabe6c3969a49a39eb85c3b4b2f970532b5c530e791b4f8f8a059470f7b9b1e463db53cd0900e83dffd03de2a9196357b4e68516d937d0ccb745e99674fec62e05b517279344367456a8e84bde26633d9af13fc298ef892f5f3ec6259d27f0f984e60728202d52157450280838ffb8474603aefe6fea072363
39779cb8b7aa564c67f8a2303c4274f65a4b4903582fa9b9318e8c8baafadf68d017f8efaf88c03ffb93fbd60984667a45b59665d1884321301b819460f30c186aff296316c8979119bbaf5a419be8541f8ae2d59dc580e4dfcf0b5cb3d06c16bc05f812122ac09925243604093871e4b8eb1275b2495abb84c91094bbe7ecad
36a80ac54d18e761be9e74faf7503655081eca83e728355fe2ac00e270980a3c20794053b4841e1a1944e9810186342dc6d9f063614e69b130949cb62b9b3620c0b2cc72ca8665897aa1a9db7d2f05f7297b0024f9bb83a0234a1255337c0bca1fca971262fb87728b43af5201770ed59e5f0e8d0772f71147e5697f1e4a4969
9ef4bfc183ba6c6a36e74a9eff0db9eb24e17aa1c4c692c8e37fd98519856c5b827597a54d5627640acdcc9cf692e2e2a509c512469a0b7012b2c29f3d2171416ea327f8baf580e5000582e6198f50cd316a78807ebe46ec79b224be6193ec938b3b347db1a2364ef82d77dee739b649ae7ee53728dd933921e5ec1e8b9eb748
ee2eb3f97a40e2c1f68c39fecf4f00ae34c1fb13728d21534ea81d08ca0995089cf9725ee384677f0086be06f370a4ecb3b3b587b55a58ab20c46f28a7ef59c377de2bb92ba4ea0dd961db6eb3776c72403887f3c82f71bafe0083b52faf3ee129f8354cd2103be0095ae8b689b84e61028ab67aa11a7e70f0842698f8e7ba27
fc0608c13300477e82b07d094c87a9bdccfa38aec08cad1f5213e282afc34cbdd3739ee2a102cc6a66659b99fd210df682f18a6ab251123748c63f444e1fac2e3f40b1bb57959883ac90064dccf119e6ffcf94192e66c3bfecc37f612561a0dc2756d8fca8c6153a4778a4973f138ff13e0ca3b1c1daff339423d761d3661270
d7216e0ac279f9c70de22829fb3b25653f7d2db1d9ffb0e81d4001451e14f139e6e2c49d405489f33dd47c4edf8dbc6d9220eb838e6adc874288ab10cd3d6af3640032bd8f08e90de1c1d3e7f729f372e5a1e4729f491e50e69f5c70b6e0f9bf407d721a1ecd3c2f014bac7fcaacaee0f2160ac3822c6cb3f28b1a6026f332e9
ff7de63f0aeab5671e87aa4ffe64cb372a083c53b62a4dca8f2d014b80ec8e08576033cf533fde26ae649026e8ca5c322754fd208c355b4222b2e86ce689c3fadb081bcc7d5060dea0dad6a463912583f90fe98ee7f73119775f27936c2ed968d3b8d647cc79b3d34b830d365a2708e239debeb6b9f104e7f518f197a8dd2b2e
3804b63ba7f20c898e9e810c2e367cfd4ad5249908279ce97692151be00ecd125a43b8dbd238886522f0064db2983471015cb17fd27f2d9735854d60ee0aa6a8f7eedba0ed2f3d7fffe49bb6b8db8648409d612ff0a38677c8c0a1217c41090bd602294fe4dddace8ada591ad16cdb94e61cfd52420149d6c0af25e807d8ce5c
a68dca0d2c2403096f5b668c2ed3cc0dc880197161ed23641c9af2a1ae3174340a1b71f490e89d3dce89dd9784322df5e08edeebe0010835b68268ec25898310cf37d9e9df7fa08631a175887ba173170bbc201359517f583e81e1f29b191f30dd664f795d224964fd6fd08c9bb4bf4112f8e0f27d8d14fc3a53387fa3f20d71
df87eb287b406814312482b2bc6495153e37d46ef13ef26725199fdfbbcec6c08bb186c1e4bd91e160fbc9dea3a3173e93417022eb77a84bdab888f4a1af187b5dc580fcf2c30db2493be82e49eb7751e76955d20be7f76c891fb15dc2290de9092c0563b94212ff8864ec3ae8d3bf611f557d8ed9de3a87fc9cce5d6262bb28
d2aaabac074bf10e5fa943e10fee8a11da89d5ffea5431781320d1b668f08008252d490b3689ff3c73be6a58f8ef02db1e446e3c37ad73ab2c8ea8e38eabff4783c80f9b230ad64b373483a1ee8ad92492f0613297a84038d6ea8844f6ed4f3052502fac2e7fccf50b220f623e381868bc43066280d25aa39c3caf3bb8915f7d
__sfx__
a9272c122c115034190037e3571a2055a1a369316143e023054120d6440443c3a1690c1060c468177750232d125312b1483e53f3907f27665194382b40e3e2212217b1a51c0b466260661b52d3f73e2202b1a179
8405cb83076232033a38735080302865e1e7012c11e2b0160754a11516163763045e29158051233370127330062083246c0f01102125375102906c08275174043c53e2313b3a22e117452743e2c10b2755433009
7a3618fd0f22e194190544b0a33f056453c4532f656010421f67e1011f2c17b21034275442c371053691f5223c20e2a7152c36e103231430f01201336692742b1246f175463114f092662c3061d77b0706906737
1e38d3360d7721e2652e2163610032510200723777111118073243251c395141e20815341362493005d1465a2d55e240260665a162793f223145332754a0a44c19559161142e47324078092123951f2f06026641
6e67d5a01931e0243233747065290256c0573e12619137451731c2c451271640f16e180351334b1316e17770061540005d2c03a2e37c0f7240400e3a7421b4072a72139632165182c3002f37a2123e3e62a04410
91ed6b0d322511a42d0213432306230283800b050313765a1a03b3b0183807a03366323533c1141c0483b3000873f0a31a0f46b237101f2372323b2743411124212322961b154581172f2b3771b77f330620c727
c3fafeef1304418468214682445509709240260874d0226337745334061b644013311411d1a145014640c26a197031213038242065452c047013423c00b1a13a3a3643b51f2c5023435009247345741f06c1a46b
4c31c0231970d142501e7440242d12473151430571e074153c2250270c3b7622404b374791f32a28077346393215a1b62d3627a163770036f0f02b0f2152604b223500a0171d2313a702252482b1630e71e3f46b
36e11d680a3032f1192777a0335a1313a140363546f3f40b286770e32a041093d2010c7462802d363711123a236351e70d1950d0643411244210253477b0074a342320b5451575d167743e6192a37e2f02229024
53beb629013203717322473151270d2581d51935253124541877a0517e0e1322b2132573b0542d2f53c07438104310b4311e40d363772850c270720d77225277081020b12b2b45e3a2243f3513f74e1e4551d126
f91956032156b2745827163117361555d2066e1214b19730230532761d1066d3c1380932e2720b2536a0654c336323c63c120353a75038730373092d1152e2021d1622a15c2b752177671246533636050653e242
ced16563160230a50e0c43a2d76d067712b66510238092361b0230f05630674154153f708282291d705273601b43f2f21b0a45c2c6770c456195702f2293c16c286112d61533173314281851b2a47e0c73829173
061f76790213c0951c0131232030300310b478025743f0090b4132e57b2473a324103254f0863b205313445f101200d7650a1530625f0016f1207e0a62e1b47b1763a186521d30a3464c264440807c2570325750
589c3cbb1c54b2e45f250610114c2c00f360771c35c017512f1422b2682f55f255220f7500256a2d738323613162d2c7431b0562275e3d6562c2662503d3b1503b64d350150804022025203271951d075510241f
5989c21c1217c340123f7463e7771563d125411703e2d4643b35437314042273a42f31678011513b400135242d726094621052f1454925329062470645e164382d13129318133301d67d1426e06113117700276e
0339fcdc126071832b211032050a2a163272001d01734430203321e4633a12f1841f392022f00c2215d230602b6533225f3f34b05753045220a377240450a3350e73c3227a065510530a1512526472377203854c
e52ee9492306c29525016673c56b212500f31b3172e0c4013f70d354710a4173c3751067b1a6202f044063282612b0f32a15215037341335e020470231a3b21d316561a22614327324052851d2477e3a4271670e
8b740d9a0e65019701367210c17706364387680b6793571c307012334601512096791b7683c560267431155c19200366672815e3f17d300442e14c3c6783070c055753814c1367317740393110873c3c4341f07c
2071a3cc187650355f0f3353937d2f13634507275180c72c251332843f3c7563c04d234623a2632d5442a37833764204721201b32407284003c6070542a0251f19342045623c26b003620732e17012336023b655
0742faaf0b0172f01b0a41a022060232b371463142a217560b32f2022d106620212218303286340421f06055020112f1032c6773a3692926c2d37622767017791415d054512601b2b15e2c43d1b6281f6380200e
801fc41c3171623745205653c1562f741055343c738166282445f1011a1463e39572253212605d170353e21917129317662c14d16004295063813e2674f302192f3613b67d1343426241037711a32f3a7721c208
5e009f511006d301533f32e32251236631c6261e3561137b0304c29473352762c1783777e3242b3f0723932b3551402310220133f22002713322380447f12725232053071c2417c1235619438231540116720529
c3e485cb377223e53e28540072550536e090361d3001b63a1a651331552621d151152767d2814909465310402c7502a50f1124b04254203122674c0860b1071f3a66c1c2531e2032b1461371630165005591c326
3aba381c3807c2b313091053520f1e22c1b5003406c0e1002e24f05157385431f1623026e150432f0191e1222a6313d41f3c331102592e5403151f2c047275400d64314738370502e22b1f473177202641b2764e
bdd9f74e3e7150e4351f663173473051a2d0302d54a2a0612324a0553a37136142762a12a397031150f2b6353c4443d1583660614618355703234d387793f5670f26b3f54a2d27e074663f060197551b25a0e12b
adf316f01e52e203290974d1542d1475e3742f000200524e160223b5432f513081410d30e2c3393d5260151f2063538155234402077b382711a53429456132760e5753667d0607b111623c35e2d10e3f47737137
02f47fd23f13f3600f0e44f3b4321f3101e0093f5593e7733f32c01776371343f0413e61d283682e1781222d2d5332c64e0a355077002710e2753a2373e0e3581b4473b61e20731027301315c1373e2b5171d60d
4a9ad0c41e37614477394623c7440747d0d176240311e7023f76d3416f3010f37219156552b03b3f3201067e0e5401f745386483037b3f330341731d2631c3520044e0907b247051a65e341581354c0337729603
1d3f509a1071c3f74507709242231506b136550747e3a73f3071f0e41f334560011d2910e3b07a1e61c3d4053c701397202877f247562050a1c3512153d3077b027793c62e24643394431a2701e4043152a0560e
56a0ff75262181f74e264221c21c2f3403c3550702b215362a04f1910c3e1770e0532714f1100c0f71009554212630e1281f3750344d196302833f3c03d0701e35561095542904f0972e3337427322205731c638
bfe3e06f306102e64b395520f43c3477e203372077f1d647027772d6141846a284730e6713f340097302b0582b4530c47b0310f0374220769266032f3613e2703e60f13659103020961c3072f303740270a2a01a
3bf971aa2c312363672f72b347591d46c0d3142f76e0460e2f1533306404329313611f13d3a07c12160076500807d047512067438536384203c7621c05b3b77d011620067407407365602c306192501e4053757f
fb95a3ff3b6690024e0d46d3f7521330c2334e0112f0045d2101d034291140d1f2303e1703500c1165c0920d1042c2117024609301572d04b3301f3314d3d55d0d4712a7371c27e200140e2510b44e1843602653
e1bf77460e00e2c3573c5710c72d3a3460446e014141a7530101a0e72c1f74c3400e20705105031c5343c5692f0513a4673056d3f52e21776006693c60b1e62b273743f3011d7782052b3640a313082d0490721e
43f17fb53a36c0d7443e3083a738382071e00e1d5691d0410c07d3935c2317e00669051792c2050e45d040571b61a317120350a3d6151477f3635d0f676006031e54b3944c1e66a0c77c0177f0b0683f05014013
fc68437b3674c0e05e287680910f1d601106560e04a1f20a3b20831716273283f65f3417c002282a1133a30d3874a0f2090c420227750241a271673673d1f76e12623185490c47d002391b664077622c77906670
001471fd2d53d394053814704663331210751d2f3300027e12423225000761d0556f0654d1a01838164366343726f1917230540124230737f0c0460766a21443136690910e052382320d084060e30c2533f1a023
58e3fe183f319246580a5573206b2b4561d1060145b0b43601008080080301c270433b4072432139159103001940e3754f0a0383002e3171b311372576f267053d71a3e332160793c1170760e1b2220e6342177d
68f88c8f1e0680804c2440c2b4001a6413e70f08144074643f3131e005370190f105280190f4152e567333713e720090003a5370907b314343e3692070e0b551056561825e3f64730049216762b56d0430c3b23e
b0d845ab0f674023072c576376223131309201037100a346020273c433004731167003073243302773801063312662810e095570204f2670c3e308217590c5771d47f2c111346330737e3840b313610061101565
7602f8cf2f41e1f57e0420f385600d2513b70e22378253333302e0f3530355d3f3331277a2970e2f327184773347b3837f302751704f1b61a390183f44e3b7103173f3432e0820c0f7762e0711e1553614f0b204
8de5190d195183b2182f00c0e7023c450006592966a3625512773181020b47b2d43d1c7713267b0d30f3324a2c076006230577f171643f4222f36121002303283f03b171270d671222670c404290533c3670722d
d74eeaf80803d2f3473c70b3b53e2275e286550067415760002710316f1832c13538186790c67b0e67a2343d0d35d25037300701e7070060f25010371623c3611e53119255083771743d3a23a3670d187083945a
da7d741a11673032240777d0470f2c3403b10e1a0781a7520e03f2072e220030e30d024681746e074060852f3714e104692e4750f4343254d31175201042666002032056363d5293a7371121c2e2771762605420
007ecea90032f2145d1b43e264633f34a050342725d01355344773c6572962b0216d0003f2f7713a21e1e4020801c3b4641c561114770007d1967e2512d1e108071770f007305612443e0a72a3a3402904d01067
01de09e2025350614417627021172437a1d72e0845b37533001693676d3366f357003607b020103b75a3b65e2d0713c31020757075723b2022e27e295592f4053c4720c3431b535351643456a382092644e2a30d
f422e9823a561256182173b3b41a0410c112412e0731a00d0902b0e07f36741075482a557052430202339607382652733d006202e0691773a3a4490561f0c23f1665b3b75c1b75f3f46d2952b0434b1207b0c468
bfa017581924607246096200274a1a61c2c277325573d54b01518232711027b0d42905030187490714f1b779140633c6591b76c3a41e3f6353771d1743d1f44a2b409244050066e390180f01723423306100500b
64f0ceda1f60c1d20f32447183513820a173061f029063092b732107101373a2132e0945f333012d5510a53a1d77b367323072c1f15d2e7133571d0114f3650d190670b5790207c20632206540f63e320743c60e
e9e6dfb61946b361400f4633521b3d7261a36b2950f1d6501f6263a7573f4671d1040b0011c5710b67e24074182543374a0757a0970c3541d0f61d37013150783f16f1a3291f7561a67c0073a2874f3a04f37462
9b9b9da43d26b247222f447097541e11f126393c22e254723954c0b175323191726b247222f447397382f430213173133f211563935f3b7791e4501e36f3b76b204293c0631c0201b7721a6301f2380041b01337
fbfc3b572e5193e730076440b372011661f07e2e27b170101476e3e5593d35f325541765401067375471872b2071a016672e30d3904a1a04f2114f3c607306500b4530555f3c2512c73e3837e1032d0762632625
d7c365b83d2561677d2f0612e63d0323f2057d0b64a3f35c3d4763935f3004507077131713f57738653181761972f3c3333463d157230467e3b0082e762191183975e351243f335115710743d0867a1b07b0277f
569ab17f3c6420b01c0765b35165040620a53f3535f2525a1d77d3676d3a31b0173f156101f56134676093183831f2746e155331e445040531857a1e00c2a72b1f37909040025571c77d2d6052235a3b0472a570
07c4ef76026380570c3d2703e4721a27e2b35b1f7663677e17630076391a37b3f25e3e007336632465e3d53d3735e3a34c00777376551b73c2b15e1f7042f62d316673c26e2c02d203382c4392f71e2372e1623b
8806e35a134662f605375210615b3c67d3e2200b038305683b7471c41a2056f1077307000142742e7763675f1a5693e5200844c2935e035173f2003c7613a53b2f3372a627181083514f08312130621913d2174f
1b97003f3b3302f6093207a1f0451f35a0153f370770745a2362b0153f1b045052391577e1f3712c7183260d3215b1322f1514d0020015009314622002e0827a2f16a2307d302081b52538758382750743f0b142
b006970e2867d2227e1d3043e550287103c7221833430108387503c51e1335d2a733382220f14f025771f30e2f2013825f0e1520620c3d024000311d4501b30b306600f75e305650072d3f3741d04d0f0001b374
6dfcea850547d063760b03f210023e24d3e363007160544e3f60f3b62d3d06115560317280e47029167305652f44b367063c4392a7251a37f3366b0302f0017f2157f3f2100a27f2b1762f13d016371d07b30713
21b17558036301572d3137c16256087713e17e1007a213173a4653b2540e1700e03f3c55f1077f1040f2560f0e7232b630353531104b0456d2345715679332703f004081370710c06104074700c0080b74f1914f
e6aec83537237303003e2603c44b1453e2d73b3821c3d1452505f035421605a3576d2f15b0267e2134836574346481e75b3b24b1a678327341b7022055802304247380c5521206138730323241b6062025314106
02ef84711a016272543b5103e2282535437568024153410f3b32b1970600050283413c1032066b3655a0706d213332e37430101045710757207353077082512c2f3100a3712e67a2353017405347111836432214
87244fee2d560296252704f1a0560337d010443c40c0f247000170d753363073c7311123b0837d2a42b0745d1d00600170017411052f352781210f3d06a0e45f3d4593500a0f54c356370007621664040373d717
8f5872163930e0023b1703d2016b103712e7590471f077351c6771d3750535e30677211082374a157460341020558357732d51e1e3591a6152143c2f7582d0261806e2664a1570b3d101264333c6181511a1f300
__music__
0c 7b49255a
01 2a115724
02 2b480d63
01 60596a28
08 335b7e25
07 4c737f42
06 43531814
08 0a5c692b
09 1f152133
00 2f097936
06 373c6a0b
02 22567219
02 51581131
06 160e195f
0e 57021b57
0b 4f331d21
0d 285f0307
03 126a3d6a
0e 070d6567
00 22342c1a
08 280d4870
0f 01245428
0d 5f4d3f7f
0b 0b332927
0a 54320c31
0e 070c5b53
04 3606307f
0d 5c06734d
0f 2603660d
0d 77291620
04 754d5a10
0b 02530c18
08 535c7e78
0e 50357f03
04 612d3524
02 2e037e60
09 09640a1a
07 26745618
08 296c5c5f
03 2f062e61
0d 2e717d19
01 2a7f4317
02 52111b34
0d 752f514c
0b 653a704f
03 733f2459
05 4e3f7202
07 606d4109
07 716d352b
02 55131329
06 506b246f
07 447e2f34
06 6371415c
0f 60330c17
08 6a732400
0e 1120084c
03 4f4f374d
03 6d36381b
04 653f1b01
0f 4e6d503c
00 13277b14
0b 1b4a2400
00 6707351f
0b 20701443
