pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
--  LD38 toy project
--  copyright (c) 2016 sam hocevar <sam@hocevar.net>
image_list = {
  { file = "data/skyline.jpeg", w = 1024, h = 128, tolerance = 60800 },
  { file = "data/bear.png", w = 128, h = 144, tolerance = 20000 },
}
current_image = image_list[1]
facts = {}
global_rom = {
[0]=
0xb6c3.0321, 0xc664.6f42, 0xead9.7656, 0xb7f0.7457, 0x5c45.1328, 0xd7df.e670,
0x467c.e83d, 0xded7.1b2f, 0x082c.598d, 0x96d6.73cf, 0xe8f5.11f3, 0x7f3f.6467,
0x2481.1dcf, 0x6d7a.c288, 0x60e4.48d0, 0xd688.d921, 0x57e6.4c46, 0x549a.73cc,
0xcbc6.a760, 0x88dd.c111, 0xe141.42b6, 0x323c.38c8, 0x1148.8100, 0x04c4.6050,
0x49a4.5c12, 0x7b46.f206, 0x0a2c.7704, 0x86b3.ee9a, 0x3908.142e, 0xa97b.5ce1,
0xdff0.5140, 0x8853.20bd, 0x3d11.e661, 0xd2a8.6506, 0x1b58.45d3, 0x7ee2.925c,
0xaf1d.3d12, 0xf3c5.51e4, 0x1578.0099, 0x0bf2.ca01, 0x564a.5597, 0x0070.feb4,
0x7401.a441, 0x5a18.12a2, 0xe5b2.db7a, 0x8195.e637, 0xebe7.2ebc, 0x84b7.bb45,
0x7da0.3e2f, 0xfd7a.96fe, 0x04f2.44c0, 0xafe3.9acf, 0x9ae6.a3cb, 0xb3c7.df66,
0x78e8.f9e2, 0xf1c7.be7f, 0xd417.9f31, 0x778f.bfdc, 0x4529.37f7, 0x27eb.edfa,
0xc756.e66c, 0xcfca.32b6, 0x56ad.58fd, 0x3c9f.fdfc, 0x0065.5231, 0xaeca.9a26,
0xef4f.9723, 0x3133.7c6d, 0x47ba.ba0f, 0xf840.7668, 0xae1f.466e, 0x2a83.0361,
0x7b66.0186, 0x0c52.070d, 0xbcf7.ff04, 0xc170.2646, 0x012e.d264, 0x1c67.1282,
0x86cf.eca7, 0xaef3.0159, 0x69ea.29a8, 0x6795.2bda, 0xf80b.a3ac, 0x1d62.7058,
0x625a.0819, 0x915b.0ec8, 0x88ff.3098, 0x9553.f778, 0x15c4.2bac, 0xc203.0483,
0x0899.0bf1, 0x5878.75e5, 0xd2dd.1047, 0xee56.333a, 0xb824.0014, 0x341a.0dec,
0x0059.ffd6, 0xa67f.6a40, 0xd475.d797, 0x3d0c.6093, 0xa3fb.1edc, 0x03e7.9f49,
0x7e2b.ef74, 0xd4df.3383, 0x9fef.de43, 0x496e.89f0, 0x5794.f9cb, 0xec7c.353e,
0xfef2.2088, 0x0cf8.8f3e, 0x86fd.179a, 0x3e05.8219, 0x1496.364e, 0xfd9f.2e78,
0x2727.4ab3, 0xf305.dc65, 0x2cd9.e80f, 0xddf4.c9bb, 0x08c8.f8ae, 0xb81c.691f,
0xcaca.03ff, 0x6c44.12be, 0x343b.8583, 0x3e80.38d9, 0x1080.42ec, 0x9bc8.1e46,
0x8004.b828, 0x73cd.e75a, 0xc129.2abb, 0x1ede.d01b, 0x830b.aa30, 0x18dd.de3e,
0xc71f.324f, 0xe465.50c6, 0x22e0.765d, 0x12af.0161, 0x7746.a6cb, 0xb263.baa5,
0xaa96.3d69, 0x807d.dd15, 0x58d3.f7d8, 0xb110.2114, 0xb52e.b1bf, 0x026e.e557,
0xdf9c.0348, 0xae13.b647, 0x5e95.0f60, 0x200a.5846, 0xc1eb.c20c, 0xd9fc.3777,
0x1fd1.b10c, 0xeb5f.023c, 0xbe70.c5c8, 0xbb5d.a93e, 0x7354.bf9d, 0xcc78.09dd,
0x39d3.1a27, 0xc38e.4248, 0xb1a7.1489, 0x3e4e.02ff, 0x0ebf.1bbd, 0xcd43.894b,
0xc2d8.5fa3, 0x7b1a.4d83, 0x7264.5c54, 0x7aa0.4b49, 0xf053.737a, 0xb8ff.e103,
0xb302.c25f, 0x7bc0.bb06, 0xdddf.2f26, 0x8c28.7e47, 0x9831.7dd4, 0xf75c.6c16,
0x954f.7f40, 0x0199.0da3, 0xb902.d350, 0x4086.090a, 0xac4e.e059, 0xdda2.e2c7,
0x3c8a.ac80, 0x9081.8c20, 0x1d13.6c02, 0xd1d1.c20e, 0x75d1.021e, 0x1b7e.9c96,
0xdc2d.0f61, 0x865d.1c77, 0x81b6.7865, 0x7f1f.927d, 0x84a0.ed14, 0x1f31.6de4,
0x0c6c.8fe1, 0x5a9f.44f3, 0xb4bb.46d8, 0x8fb4.ac47, 0x7a48.329d, 0x1544.965f,
0x0fbc.1c16, 0x058e.d891, 0x7f25.c3be, 0x70cc.b4bc, 0xa63e.c1ec, 0x97bc.4f2d,
0xc6b8.9c64, 0x3fc7.97df, 0x38e3.24c9, 0x4ea6.cf8a, 0xefc0.7f80, 0x6d93.c07c,
0x6e38.4895, 0x0df8.b9d3, 0xbd30.bc44, 0x3339.0030, 0x4ca6.a659, 0x1353.22f2,
0xbab3.3f70, 0xcf7a.fabb, 0x1b3a.ffdd, 0xd790.0f9f, 0x00ca.43d9, 0x6405.a301,
0x0e84.20f0, 0x4992.a9e0, 0x3bed.ff2a, 0x7818.83e8, 0x8fba.497d, 0x9875.3103,
0x9300.77ba, 0x772b.2e7d, 0xa9ab.4a98, 0xfaff.7188, 0xe607.b608, 0x4801.0368,
0x4dfa.79c0, 0x3b1b.1f44, 0x5de6.bc10, 0x3f68.d069, 0xb186.1de8, 0x8529.918d,
0x5d9a.1775, 0xfa90.4f8f, 0x8905.1847, 0x0b56.63d8, 0x036b.3279, 0xbd83.bd40,
0xff66.0591, 0x553d.92ea, 0x30ef.de32, 0xf13e.47f6, 0xc852.f489, 0xcfb7.46c8,
0x58a3.fb0a, 0x2036.671c, 0xbe55.71be, 0xc11c.191f, 0x1019.38c4, 0x5f9e.1f7a,
0xfac7.73c7, 0x08f3.01a0, 0x3dde.c8eb, 0x7f61.f226, 0xe427.c80f, 0x08a2.3702,
0x46e2.286c, 0x919d.6032, 0xcfbf.f621, 0x8520.6896, 0xc40a.4203, 0x0391.1480,
0x167d.cb62, 0x2045.910a, 0x3d94.5f77, 0x0307.d6ae, 0xf526.47e1, 0x78fe.6750,
0xdb56.3650, 0x5f10.1381, 0x9d0c.5ada, 0x5846.d5da, 0x051b.f431, 0x27ff.305f,
0xdc38.2a2f, 0xcd91.9e55, 0x3f7a.f14b, 0xfe2a.28f9, 0xddf5.0200, 0x7259.6301,
0x2002.ee5d, 0xe132.b2c5, 0x1504.c86c, 0x2e67.cc00, 0x120a.62ac, 0x8a25.c6e6,
0xdb9e.1dd1, 0x399f.16a4, 0x5dd5.25bf, 0x38ef.b3b8, 0xe271.f3ba, 0x71f5.6bb0,
0xf82d.3764, 0x4c97.1449, 0x2413.8e14, 0x39af.1638, 0x27fb.3473, 0x3e95.699d,
0x1867.17d8, 0x8db1.d1b2, 0x94ee.43c0, 0x13f0.c0df, 0x8e28.10f6, 0x3f04.7cc8,
0x60ed.0aeb, 0xcc37.2983, 0x2848.0220, 0x0c47.5c16, 0x34c3.3340, 0x3d7c.06e0,
0x0eaf.b678, 0x99b4.81e2, 0x249e.8515, 0x1c8e.e8b0, 0x2015.274a, 0x79ac.9130,
0xd613.2977, 0x9c77.7072, 0x961d.fdf8, 0xa64e.b1ac, 0x3b1f.07ee, 0xc487.4d22,
0x0dac.b990, 0x588d.8bf9, 0x6023.b69f, 0xad2c.c81a, 0xa514.5d9f, 0x55c0.5dbf,
0xb793.f7f0, 0x680f.da3a, 0x1be4.94ce, 0xaa6c.b9e9, 0x6b19.d668, 0xbf5a.fffd,
0x6338.ed52, 0xfdc9.49db, 0x38e0.3493, 0xc0b7.449e, 0xe334.d1a7, 0xa3b9.bf56,
0xcbf0.e172, 0x7809.bcb8, 0xf455.3210, 0xfccc.fbe8, 0xda3b.ac1e, 0x87c9.50db,
0x43ac.de26, 0xe222.fc4c, 0xc038.291f, 0x1411.f7fe, 0x7b3d.a08d, 0xb638.16ac,
0x9781.5b90, 0x46d0.9e67, 0x2eb8.3d31, 0x86da.f708, 0x3518.8f67, 0x0ac4.d7d2,
0x62fe.0172, 0xc997.6fde, 0xc260.fa02, 0x026c.a617, 0xf0bf.25c1, 0x2121.d80d,
0xb23b.9cab, 0xea17.79db, 0xbd1a.76c0, 0x825f.68d0, 0xd83f.5c62, 0xe260.7e17,
0x6c2f.390a, 0x3fee.4f77, 0x5d89.3cbc, 0xd35f.4602, 0x7af8.63fe, 0xcb3e.7c00,
0xcaff.96f5, 0xd47f.6dbd, 0x6bbe.f8f9, 0x63c9.a67f, 0x42e3.d157, 0xb35c.4e04,
0xec88.3393, 0x5510.d077, 0xefd5.fc3e, 0x8cc9.3886, 0xc925.3248, 0xe343.ec9c,
0x4996.83a1, 0x3f05.e641, 0x048d.8d40, 0xe9c9.e910, 0x8c04.1017, 0x0cfb.e7a0,
0x1fe3.1106, 0x9d48.7b50, 0xa024.0883, 0x8201.489c, 0x4aa6.a652, 0x6416.2309,
0x297c.1903, 0x0b5c.063d, 0x0900.efa5, 0x53d7.9567, 0x9b22.a2b6, 0x0a2c.76e1,
0xf0a0.a487, 0xa6ff.b360, 0x3af5.d1dd, 0xa367.974c, 0x43a0.d1d6, 0xe82b.ba0c,
0x2829.dbb0, 0x2b20.4dd1, 0xd085.0959, 0x75d2.7940, 0x7df1.399d, 0xa323.4586,
0xcc51.08c9, 0x8e56.5a3a, 0x8d21.37fd, 0x78b1.61fd, 0xa17f.076a, 0x8f5f.7d40,
0xdcff.3074, 0x38e8.77ea, 0xe4cd.9a33, 0x0f64.9bd9, 0x8bd2.af12, 0x245c.e3c4,
0x6873.13ca, 0x1a13.3f78, 0x1e49.03b7, 0xc600.2536, 0x03ff.4056, 0xe1ea.0246,
0xcbb2.1a80, 0x3d85.ff8d, 0x83f2.21ff, 0x7c04.13f0, 0x98bf.0ceb, 0x8d5e.810b,
0xcaa3.2014, 0x5c83.c2eb, 0x7a80.a521, 0x0025.096f, 0x001a.3968, 0x9447.5dce,
0xd298.41ac, 0xfd0a.8ada, 0x0c44.7027, 0x55b3.9901, 0x45d8.dc21, 0x1b2a.0ace,
0xa8a4.0682, 0x58d4.99d6, 0x2a24.b2f7, 0x3b09.bb46, 0xdd87.cdba, 0xa718.47df,
0x07cc.21d9, 0x1df6.000a, 0x47f7.1a95, 0xe050.8c1b, 0x7b0c.55fe, 0x317c.d93b,
0xd05f.7490, 0xf55c.836f, 0xe49e.be5c, 0x018c.47f3, 0x8e33.138f, 0x5054.dd73,
0x5270.0b2f, 0x6e71.fda8, 0xa092.5225, 0x099d.7960, 0xf731.2e56, 0xeba0.0b4b,
0x3365.aa56, 0x1f86.e407, 0x2dc6.8a9a, 0x6346.ad73, 0xbb53.1ba8, 0xbc4a.9e62,
0x7876.0ef8, 0x2040.a59d, 0xc8f9.7d89, 0xd135.09f0, 0xb6a0.7f38, 0x5de6.5820,
0x9e87.0da1, 0x92c1.2ca8, 0x9bc4.aa83, 0x4bb5.3738, 0xe7b1.ab20, 0xd2b3.2421,
0x9836.1708, 0xed22.d0a3, 0x3d1c.e414, 0xcb62.357b, 0xe0a5.cf29, 0x9112.205a,
0x0de1.a2be, 0xfed0.a9c5, 0x0399.1a7d, 0xbb54.8ea5, 0x84b0.70de, 0x58e6.07ca,
0x7521.88df, 0x53fb.b711, 0xe813.189b, 0x57f1.fa17, 0x7c4a.643f, 0x93ff.db9c,
0xaf8b.e7e8, 0x7772.df13, 0x869a.7e50, 0x3edc.4fdc, 0x6647.4cc9, 0x5188.a221,
0x8745.9888, 0x40a8.93de, 0xf384.1b6a, 0xbd3e.e264, 0x2444.52bf, 0xa605.0302,
0x46a9.8842, 0xbd22.08c8, 0x30a3.67cf, 0x3fa7.90ba, 0x4279.6c90, 0x5858.4479,
0x54fb.7d81, 0x8a79.803a, 0x72ba.fec6, 0x0596.7bec, 0xc5a4.c5e8, 0x6687.7cba,
0x560a.3e44, 0x9924.1989, 0xfa72.fa7d, 0xfefa.0d9e, 0x070c.bd0a, 0x9878.01cc,
0x43b6.c557, 0x4acc.2bb7, 0x0091.f2d8, 0x9d61.b426, 0x0d8f.c987, 0x9e2c.036a,
0x3812.82a0, 0xfcab.ae55, 0x14e3.b335, 0xc3e3.f9c2, 0x704f.798f, 0x6be2.78e2,
0x4726.d578, 0xfdf7.9c9d, 0xcdcc.0e2c, 0x8c17.6640, 0x3c2c.39e5, 0x3724.64ce,
0x67f9.27fc, 0x42eb.1044, 0xe61e.0734, 0x42be.12c7, 0x776d.03fd, 0xf282.be5f,
0x23cd.87b1, 0xd066.83f7, 0xe172.a403, 0xf41b.47fb, 0xda91.ea8e, 0xe290.5f67,
0x7e20.118a, 0x687b.0a34, 0x8b21.1a15, 0x4216.c070, 0x06a4.1d8a, 0x00c9.8de8,
0xdaf3.9d75, 0x8f42.e7f2, 0x0040.5f90, 0xf97d.cda0, 0x03d7.4172, 0xff06.6fd9,
0x2bab.f523, 0x8faf.b5bb, 0x88da.ab71, 0xf584.287d, 0x9566.2292, 0x55f6.3164,
0x7bf6.4706, 0xe32d.dd5f, 0xba4f.523c, 0x3fad.84c5, 0x3751.91be, 0x587b.e41f,
0x54b8.f4b0, 0x60b8.fad9, 0xd7d2.49d2, 0x97ee.e304, 0xc0a4.e006, 0xe96c.c58f,
0x1981.6c83, 0x6217.c42c, 0xb54d.d0be, 0x65e0.3b47, 0xff06.75bc, 0xec5d.a223,
0xbaf7.1cdc, 0x04de.035b, 0x118e.6e83, 0x35c6.3f93, 0x1e92.1286, 0xa028.cbb4,
0x403c.e5a0, 0x3eee.d4fb, 0xf125.2de3, 0xc7f2.4798, 0xca6b.102a, 0xeec8.1c3d,
0xb963.06ca, 0x1a8c.6654, 0x3a60.6cc1, 0xe87b.d5b3, 0x09c9.1d41, 0x1be4.7055,
0xca2b.f76e, 0x2af8.bb0d, 0x0abc.34aa, 0xde3b.1f6d, 0x8497.d40e, 0xdcfb.466f,
0x4b15.ec2d, 0x7f7e.c87f, 0x4477.ccec, 0x16bc.139d, 0x5de6.8b40, 0x046e.f1cf,
0x3c80.8bd2, 0x38ee.379e, 0x3dc3.5284, 0x9fd8.c858, 0x7099.8645, 0xe385.7994,
0xd82b.0ce3, 0x481f.955a, 0x4a7b.ee67, 0x7b9e.1d5f, 0xd160.0372, 0xfa9a.f0ba,
0xdbc8.0f5d, 0xef35.5dfd, 0xd665.8d04, 0xcca9.ba14, 0xefe0.2560, 0xee40.f010,
0x4e02.391d, 0xa8a5.ede4, 0x44a7.a009, 0x1ba4.6816, 0xea6c.18ab, 0xb026.460c,
0xef4d.4c44, 0x7214.c7af, 0xa01f.c954, 0x9e86.4b39, 0xf3e9.09ba, 0x2b44.02be,
0xcafc.f255, 0x1aab.6cee, 0xc124.8ac5, 0x5296.d868, 0x0afb.fb99, 0xbb8f.2856,
0x2cc1.fdac, 0xa0e6.0498, 0x75b9.913b, 0x3ed8.e08f, 0xab8d.d6f3, 0xc701.8a60,
0xdc72.427e, 0xb0a3.a349, 0x5085.fd90, 0x14a2.8e15, 0xfb5d.fb92, 0x9121.af1f,
0xee6e.dec9, 0xf32f.d2aa, 0xedd4.d156, 0xa113.97a9, 0x15e0.81d6, 0x51f3.cb5e,
0x1fd1.f61e, 0xa810.9cae, 0x7d52.68a9, 0xa320.ca63, 0xe7c1.b03e, 0xa2a7.ece6,
0x088d.37a2, 0xc8b9.201e, 0xee80.fdd0, 0x7e28.c463, 0x5e45.d683, 0x62b6.4f78,
0xa48a.ca8f, 0x411f.ee03, 0xe8a9.105e, 0x1c6d.2f75, 0x1d85.c1b0, 0x76f0.8c42,
0xd4c0.0add, 0xa456.f01d, 0x8c07.aa70, 0x0988.0e0a, 0x2148.c6d4, 0x02ea.603d,
0xeee5.37e0, 0xfd08.f38f, 0xf626.b9c4, 0x9d00.c66f, 0xf979.d667, 0x83b6.8db6,
0x1576.bd80, 0x5d07.74de, 0x00d2.ffa0, 0x3fc7.8534, 0x2e43.bd29, 0x70d1.294d,
0x4686.085c, 0xd8b0.2b8b, 0x5dd9.cdec, 0xc69e.a957, 0xbb21.8d80, 0xc577.ed0a,
0x0373.722a, 0x2e97.7068, 0x6215.8376, 0x74c0.c8f5, 0x5257.a3ef, 0x07d3.0511,
0x18c0.4131, 0x8326.21c0, 0xf843.a149, 0xd714.2604, 0x1266.7155, 0xd53b.8cc1,
0x9d44.251f, 0x5906.4073, 0x7fca.1839, 0xcbb0.0040, 0xbfd0.063c, 0x071b.3ac2,
0x5f01.b00b, 0x1521.09e5, 0x1a79.b9bb, 0x9c92.8830, 0xf298.6d01, 0x1b72.f41d,
0xcfde.6299, 0x68bf.b4dc, 0x37dc.64ea, 0x274b.9999, 0xbff6.9334, 0xc2cf.4c8e,
0x5e8e.93b5, 0xe086.971f, 0xd9fa.3738, 0x690a.b2b7, 0x9854.49e2, 0xa231.8579,
0xd961.9962, 0xe6bc.8642, 0xdc94.0f17, 0x7386.9b97, 0xc5ef.60dd, 0x2029.6cba,
0x8b3b.7c1d, 0x9193.0880, 0x573e.432c, 0x3451.8549, 0xd8c4.0a27, 0x9fb0.c146,
0x7cf9.9dd6, 0x38ea.0301, 0x2d24.c8db, 0xe614.4495, 0x306d.f386, 0x5ddd.f051,
0x31cc.abe5, 0x4450.2611, 0x01fd.d768, 0x46ab.5e03, 0xebed.5124, 0x665d.947e,
0xef2a.3633, 0x3798.ab42, 0x7575.cfc2, 0x1912.40b5, 0x247d.7919, 0xc511.50e3,
0x71be.4e65, 0xc8a4.dea4, 0x1bc2.71ab, 0x2b8a.8024, 0x752d.1b65, 0x9277.645b,
0xba5f.cfd1, 0x3fb8.15d4, 0xc259.8fc3, 0x38f3.4018, 0x249c.6989, 0x09b0.182e,
0xb6bb.831a, 0xfb9b.1215, 0xd252.d607, 0x7110.8107, 0xe33a.fd1f, 0x0fd8.18b9,
0x8383.3be8, 0xe910.8647, 0xdd8d.e617, 0xe814.0bea, 0x443d.127e, 0xa1ba.ba41,
0xf52e.f1f2, 0x89d8.447f, 0x43f9.996f, 0x5e09.55e0, 0xb7b0.79d0, 0x6818.dd43,
0xe3d8.3f48, 0x9b7e.3a1d, 0xc356.8549, 0xb295.5d8d, 0xa1eb.bcf7, 0x65dc.d022,
0xc08f.6079, 0xf01f.7d12, 0xc43d.dcfd, 0x3a4d.0511, 0x7595.ba30, 0xf574.2736,
0x6867.9c75, 0xf4d8.5ba2, 0x4251.3e9a, 0x7d4a.99b3, 0xa4f1.c85e, 0xfdd8.f40c,
0x10b2.66c0, 0x9737.0e59, 0xec0c.22b7, 0xf43d.8964, 0xa847.9e57, 0x0a83.24e4,
0x8121.4527, 0x5632.fd37, 0xe7fc.8952, 0xef58.b68c, 0xbecd.f91b, 0x7eca.bb07,
0xc012.3928, 0xc82a.6b11, 0x349e.a390, 0x2918.dd02, 0x186f.0062, 0x5fdf.7380,
0x1281.5657, 0x1f00.6424, 0x4ec4.01bf, 0xa5dc.0047, 0x4e0b.12ec, 0x13c8.bab4,
0xca1a.0d73, 0x3ddc.82dc, 0xe904.51ab, 0x93d9.0084, 0x99d7.7628, 0x8553.de3a,
0x158a.c5e7, 0xa13b.ef7f, 0x22ea.e03d, 0x2dd3.da14, 0x8c14.588e, 0x371d.9b09,
0x5bec.f336, 0xe978.5884, 0xc4cd.a039, 0xa3e7.64d7, 0x27c5.57ed, 0xb74a.860a,
0x4df1.15fa, 0xde25.5d1a, 0x9c66.5ee7, 0x2a16.4d4b, 0x24fe.9e66, 0xe8c8.f5d3,
0xe764.9fdc, 0x9f7c.37b3, 0xb64f.3915, 0x1c7d.faef, 0x7d0d.de66, 0x6423.f291,
0xd6d5.f6c6, 0x8580.0483, 0x31c9.284f, 0x494a.5362, 0xf73d.e2c9, 0xec1e.aae1,
0xd3b3.fbaf, 0x7d95.2a88, 0x10c1.a64c, 0x3314.68c0, 0xc37f.3c4f, 0x65db.376f,
0x9840.e9bd, 0x6f11.c215, 0xfc90.393a, 0xa9a3.40d1, 0x0010.8aa4, 0x0bf7.68d5,
0x5f08.ea7c, 0x1d73.abef, 0xad5d.6f6e, 0x9657.90eb, 0xcb7f.74fa, 0x76fe.7b01,
0xcf93.36f7, 0x9c70.104f, 0xf322.dca5, 0xe6ff.9a78, 0xa677.bd68, 0x5c6f.a5b9,
0x4bf8.ab2d, 0x87b1.aaca, 0xec0e.5e04, 0x8e14.5108, 0xb59b.7fca, 0x00dc.cac3,
0xe71d.b5a5, 0x2508.a379, 0x1760.883d, 0x9dea.a6d1, 0x28c5.0ade, 0x9014.8360,
0xcc14.6083, 0x3654.831b, 0x2ae1.6de7, 0x459c.58c8, 0xa660.3ca5, 0x5dd3.154f,
0x0f59.0409, 0x7296.c0a3, 0x3f4d.46dd, 0xbec0.4cc3, 0x163d.82a2, 0x9473.f510,
0x6a95.02f2, 0x1bc7.48cc, 0x963a.b9f3, 0x3450.378f, 0x1df7.a704, 0xf008.13d3,
0xee7b.3319, 0x48dd.f9e4, 0x907b.0351, 0xc659.95f7, 0x367d.a3e7, 0x29ab.edb5,
0xff79.5766, 0x1fae.ab2a, 0x8fdf.c10b, 0x4b90.ab2a, 0x01ee.772d, 0xc3ab.f4aa,
0xf675.d1a9, 0xa3c9.9feb, 0x0136.fe3a, 0x71f7.eefd, 0xbea8.3193, 0x7188.219f,
0x1e4d.ff6a, 0x2304.cda5, 0x7a10.0c2f, 0xedcb.2124, 0x0f4c.49ff, 0xb7e0.f499,
0xb2d8.a2e9, 0xf33b.f439, 0x575b.f099, 0xc6df.9c4f, 0xb4c9.2b0d, 0x0c58.054b,
0xa93f.fa37, 0x468f.97a7, 0x6e45.cf95, 0x519e.2609, 0x0481.48f9, 0x4fa2.1f6e,
0x8f04.50de, 0x470f.f1a8, 0x75d4.1a90, 0x4758.9598, 0xdbde.88b9, 0xac28.c7db,
0x573f.e923, 0xe625.e6c2, 0xb48c.d998, 0xcfe2.d2c1, 0x286e.d8a3, 0xa164.8067,
0x572a.0752, 0x5222.af59, 0x8a6e.90df, 0xc15a.bed4, 0x2a49.bdf7, 0x40b1.7d84,
0x2abf.405f, 0xd98e.6f26, 0x3cbd.49da, 0x76af.d556, 0x717a.6ffe, 0xaff3.7fde,
0x7e31.b54e, 0x8ff7.8ba7, 0x924e.c648, 0x1324.9d90, 0x7e98.f043, 0x68fd.cc4b,
0x4527.c665, 0x93d6.a132, 0x51cc.0bd4, 0x3d99.0284, 0xf72e.3aca, 0x1416.e375,
0xa6ed.da9a, 0xa096.6e81, 0xfff9.8f78, 0x6e93.d1ca, 0x033d.d508, 0xc1df.6efb,
0xba32.dd0b, 0xc0c5.b807, 0xa96f.d76d, 0xeb95.2de0, 0xadb0.31ca, 0xde23.e98b,
0x6de2.3b68, 0x9a38.4c37, 0xdc34.069d, 0x908e.7657, 0x81b8.4f7f, 0xd1cc.8d1d,
0x6039.b01d, 0x7de2.654f, 0x6d03.fbd7, 0x8823.8983, 0x88d3.ab02, 0xab64.4c68,
0xf494.b311, 0x1910.de34, 0xb3c3.6753, 0x31e0.cfe3, 0x7cee.da58, 0x83f7.e8f0,
0x83e2.bdab, 0x68bf.5195, 0x75e9.5e3a, 0x97e3.97df, 0x138b.3747, 0x8dd1.bdfe,
0x317d.e75e, 0xceb5.eafe, 0x5dae.777c, 0x04ac.07cb, 0xb88f.93e4, 0x2376.ba3a,
0x76df.f11f, 0x061b.bfe7, 0xbf7f.4ff4, 0xba34.6772, 0x6af9.2d96, 0xf0e5.fe67,
0x7d82.7e7d, 0xca57.ed7f, 0x7af9.f3f3, 0xb0df.f79d, 0x7f09.b3f3, 0xdbff.e6cf,
0xb7fd.f2c3, 0xbb77.f7ca, 0x176e.6fe3, 0x3c3c.dfdf, 0xa76d.bc75, 0xadba.ef98,
0xe2ad.e9e7, 0x8d3f.91fc, 0x6cef.be37, 0xfe33.b0f7, 0x9cea.5e57, 0xb87c.ea7f,
0xad26.68fe, 0x441f.d6d7, 0xb3bf.3ca0, 0x91fd.ec9f, 0xc063.27b1, 0x707e.33a0,
0x72f8.ea77, 0xcffd.19fd, 0xbb07.ce75, 0xbd75.efb2, 0x380f.c653, 0xafcf.7d3c,
0xbbd7.f1b3, 0xd5cb.15f3, 0xef5e.34f0, 0xc6c9.db3b, 0xfb96.2d5f, 0xf71e.9e3d,
0xccea.3cb7, 0x3e75.32b7, 0x3d3f.5717, 0x537e.682c, 0xed3d.bdf3, 0xa7f7.d302,
0xdf84.e1c5, 0x9283.e9ef, 0xd783.e180, 0x7ec8.f9f3, 0xdeda.37bd, 0xc8f8.07d4,
0x33a7.7b56, 0x3ef1.5afe, 0x2a3b.7f8c, 0x9e1c.72e4, 0x172c.dfc6, 0x7e33.a77c,
0x4778.56d5, 0xd7c1.bfef, 0x1c72.fc69, 0xf0ee.337f, 0xbd00.215a, 0x1a6c.d8bb,
0x178c.ea3f, 0xedfe.6e49, 0xe29c.7fb8, 0x577b.e106, 0xbf8d.2d49, 0xdfaf.14b9,
0xb7e3.961b, 0xe2d8.fe9c, 0xdde0.22d3, 0xc7db.3c9b, 0x2e6f.073b, 0xb5e3.956c,
0x5145.67e3, 0x6c5d.c067, 0xe9df.c7c7, 0x79f5.fb2d, 0x0faf.1a7a, 0xc924.4696,
0x371e.9173, 0x6e2f.d9b2, 0xc7af.8041, 0xf8fa.eff9, 0xbd12.37bb, 0xca27.7e30,
0x3e34.ddd3, 0x193b.8338, 0xbbfb.e23d, 0xc069.dcd7, 0x7b35.86fa, 0xe1d8.7317,
0x6eef.5eb5, 0x77ae.8edc, 0x7f18.ab75, 0xcf5b.c933, 0x4dee.e024, 0x487d.2f1f,
0xe216.6fe3, 0x4be7.2cf2, 0x5cf7.a4e6, 0xccd5.ceef, 0xc574.adde, 0xefef.64b3,
0xb892.5c49, 0xe3a8.ccde, 0xeae4.6fe3, 0x9c96.cd7e, 0x6c82.73c6, 0x64f7.39b9,
0x5cbd.7a8e, 0xb1e3.3b3d, 0xe466.afa0, 0x7f1d.d3ba, 0xfd76.4eed, 0x8b57.3820,
0xd93d.63f5, 0x1cab.f078, 0x5dc9.cc9f, 0x7cdd.ec63, 0xfca5.c5fc, 0x6ef7.6dbd,
0xe8de.7cd7, 0x9c10.ef45, 0x72dc.a73b, 0x0890.ef72, 0xdef4.f15b, 0x7fd7.13ab,
0xb15b.a710, 0xa6d9.05c7, 0x61b7.ff23, 0x20fc.7c84, 0x2edd.ca48, 0x80e7.33fd,
0x2f7c.a307, 0xeae3.8f9d, 0xfe89.dfef, 0xecff.cc25, 0xa2f3.c6a3, 0xa7b0.a225,
0x7bef.649f, 0x21bd.1377, 0x0809.bd50, 0xe5c2.81d5, 0xedfa.61d7, 0xcec2.ddfc,
0x31fa.2ff0, 0xbfc6.74f9, 0xf3fe.d380, 0x78bb.963a, 0x1394.eb7e, 0xe2cd.fcfd,
0x7ffe.04ed, 0x7df3.b0ee, 0x7889.be67, 0xef07.66e1, 0x3d6d.ecdf, 0x3ba3.fbe2,
0x97df.bad7, 0x81e2.dff8, 0x73fd.e29d, 0x00dc.fbe5, 0xc5fb.c74d, 0x67df.69fb,
0xf780.0d0a, 0xc5df.7a56, 0xf89d.2be3, 0xa8fd.e260, 0xbe66.d3c4, 0xe7de.766f,
0xe772.c4f1, 0xf79d.ebfb, 0x4119.ffc0, 0x5fbc.ed9e, 0xfac7.bced, 0x177a.f027,
0x8c54.bfcf, 0x37fe.f1cf, 0xf1bb.ef3a, 0xdb8b.e300, 0xc56f.f39d, 0x9e20.25f7,
0x3b96.078c, 0x7f9f.a7ef, 0x00ef.de2a, 0x3bf3.c9e6, 0xf530.7ef8, 0xebe6.23fd,
0xa347.13c4, 0xf7ee.fbce, 0x377e.719f, 0x8cf9.585e, 0x59b8.dff7, 0xa8ee.f7ae,
0xe76e.df5c, 0xbde7.51fd, 0x082b.a500, 0xefa3.33a5, 0x3200.80f7, 0xce2a.3807,
0x0816.0e0f, 0xd75f.c323, 0x956c.820c, 0xf33a.8df3, 0x66e2.0865, 0x7ecc.1efe,
0x2f5e.20dd, 0xc84e.1f1b, 0xd1b5.cb10, 0x6e60.8f28, 0xd91b.fe62, 0x22b1.086e,
0x10db.7d7e, 0x88e4.afcf, 0xfc67.7ae9, 0x8477.2fc8, 0xec24.39f1, 0x407a.be09,
0xddfd.847e, 0xbba8.23c9, 0xdf2e.a149, 0xa241.e349, 0x3d7c.e7a3, 0x613f.69db,
0xf1b2.770b, 0xdd1d.4099, 0x27d2.e6c5, 0xde35.572b, 0xc90a.ec01, 0x1a46.f377,
0x2af0.339f, 0xd7c9.dcdf, 0x4020.9c5f, 0xd78c.0796, 0x57af.a6ae, 0xd5fb.dc7b,
0x8c3f.1651, 0xf65d.a412, 0xf380.f2f9, 0x8390.0266, 0x7027.11b9, 0x445a.d1fe,
0x65f5.ca93, 0xb678.4c88, 0x3ee7.c5d7, 0x55d5.f19c, 0x7ee9.4f1f, 0xdafe.33ae,
0x149f.68b5, 0x7a7c.b8af, 0x0622.1678, 0x4536.e2fc, 0x8edf.5727, 0xbbf1.5b06,
0xf5c5.2fcb, 0x57b4.1bed, 0x02d5.c031, 0x32d7.8d29, 0xae33.89fb, 0x67ae.2f5e,
0x83c2.caf1, 0x91dd.fe74, 0xbddd.cf7f, 0x185f.e79e, 0x7370.a702, 0x7dff.4044,
0x78cb.a8b8, 0x1b8a.357f, 0xeafd.7b76, 0x7a3c.1deb, 0xcd77.0b27, 0xd286.4636,
0x7226.2d57, 0xdabb.ef99, 0x494b.0735, 0xa40f.7f1d, 0xbbe3.8d5f, 0x70dd.c1f1,
0xcf02.d5e6, 0xe6c3.108f, 0x1429.b7e3, 0x76de.ba5b, 0x1918.0f1e, 0xd9cc.76ef,
0x08dd.feb5, 0xea71.97bf, 0xbe24.ddca, 0xe3d1.6e3d, 0xd018.4d81, 0x2ff7.3cd2,
0xce11.4445, 0xf495.2afd, 0x22db.d750, 0x537f.4bd1, 0xfb1c.83b8, 0x7730.960f,
0x9844.0a2f, 0xfb90.98d9, 0xe19e.229f, 0x1d71.d225, 0xf9e5.9479, 0x6ac6.717e,
0x2394.0f11, 0xc3c1.a7b6, 0xfd22.1ced, 0x678f.c719, 0x63eb.9fc7, 0x2eae.1bb9,
0x7ed6.1e77, 0xaddb.7cb5, 0xe02c.241f, 0x85e3.741f, 0x9b95.fbf2, 0x25bb.fbe5,
0xffc0.9f5c, 0xf3e4.e8df, 0x11e9.66ef, 0x57d4.bf5e, 0xca37.fbc3, 0xbf0e.79fc,
0xe57b.f1e1, 0x0fff.02fb, 0x772e.133a, 0x7e30.0232, 0x7cdd.f9d9, 0x1751.cc3d,
0x43f1.664f, 0xe122.1f17, 0x2d9f.19d8, 0x1b28.0e98, 0x3fdf.2d3f, 0xf8f4.7c5a,
0x5bbb.643c, 0x9e9e.278e, 0x95af.d7c8, 0xf075.cfdf, 0xd4f0.e2f0, 0xe33a.57ef,
0xaf4e.e2e1, 0xf9e0.4c37, 0xbd53.e3a9, 0x01df.8ba4, 0x96f5.ba40, 0xef41.7a89,
0xdd2b.f1b4, 0xb751.fbfc, 0x57e1.d0be, 0x4f13.9f07, 0x80ec.b825, 0xd9d3.c4a6,
0xef16.ae76, 0x80f5.3a57, 0x576b.a555, 0x5c9f.7c4b, 0x064a.1098, 0xe365.ae87,
0x44cf.1c8f, 0x0beb.767a, 0x94f5.e5cb, 0x7bf3.f7be, 0x659f.1f23, 0xdc7a.0b00,
0xa7a5.e12d, 0x6cc5.afdf, 0x37b6.12b6, 0x4785.04e4, 0xe34e.be53, 0xc7c8.fef9,
0x4a3a.708f, 0xfbfe.fe7b, 0x1e5f.277d, 0xb078.7ba0, 0x7cf5.c4e5, 0xd591.9db4,
0xa039.ae0b, 0xdf80.29bd, 0x627f.7059, 0x0d34.5bfc, 0x76db.fc69, 0x7014.37c6,
0xebd6.0974, 0xa763.bf8c, 0x3e16.5107, 0x7ebf.d78e, 0x91ba.7b8d, 0x0042.b3c6,
0xd72a.3c0d, 0x01ff.8c5f, 0xfd61.33c6, 0x5afe.3e7a, 0xffaf.2022, 0x5196.73d6,
0x2f54.f8c7, 0xeafe.8250, 0x0c07.ab28, 0xe2d7.6da9, 0xd5e2.57f5, 0x28f2.fa71,
0x2e7a.0bd5, 0x7947.372f, 0x8ad7.f846, 0x8a3b.83f1, 0x70ce.ee85, 0xf19f.7db5,
0xbd3f.1166, 0xbf03.c71d, 0xc4c8.0a07, 0x55dd.9cf7, 0x80b9.6026, 0x1e4a.7e32,
0xe538.d601, 0x180f.55fb, 0xcd09.fca5, 0x0f1f.75c5, 0xfc19.9734, 0x4d41.57cb,
0xd175.e727, 0x02a4.293f, 0x6bbe.7ca4, 0xf73b.a019, 0xa675.f01c, 0xfc79.0c6f,
0xddd1.d58c, 0x9ba3.f189, 0xdcae.5cc9, 0xaa43.d3cc, 0x7502.6416, 0x8faf.6727,
0xd9c0.51bf, 0x4bf1.dd3b, 0x232b.0289, 0x0579.8385, 0xeead.e3a1, 0x4dea.d196,
0x2769.ecf2, 0xec53.d837, 0x77c7.7730, 0x4070.e88b, 0x917b.ffac, 0xeb4f.5661,
0x6af2.1e17, 0xd2d5.fe39, 0xed0e.301c, 0xe900.b28d, 0x7151.f6ca, 0xf7d1.9dc6,
0xc92c.f1b2, 0xda4a.e5e5, 0x881e.ac8d, 0x719e.2480, 0x3cd5.c6f5, 0x277f.3800,
0xb920.3e4b, 0x334a.47d9, 0x6caf.dbc9, 0x5e21.65a3, 0x0ff6.4ca1, 0xbf90.16ac,
0xd798.53e7, 0x2f98.f7d2, 0x1be3.5083, 0x8887.e5d9, 0x5875.1e38, 0xfea8.3064,
0xff07.845c, 0x0d6e.ac2f, 0x.0ae5,
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
local function bs_init(addr, rom)
  local bs = {
    pos = addr,
    rom = rom,
    b = 0,
    n = 0,
    out = {},
    outpos = 0,
  }
  if (#rom * 4 > 0) u32_to_memory(0x4300, rom, 0x1b00)
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
    if self.pos >= 0x5d00 then
      memcpy(0x0, 0x5d00, 0x100)
      if (#self.rom * 4 > 0x1b00) u32_to_memory(0x100, self.rom, #self.rom * 4 - 0x1b00, 0x1b00 / 4)
      self.pos -= 0x5d00
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
function inflate(inaddr, rom)
  return inflate_main(bs_init(inaddr, rom))
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
    local tmp = inflate(0x0000,global_rom)
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
87c9dedbb5c6567d996264a7ccaa196c563b6266510d3aa987c0c47e52802f410239b0a598ac9475252398ea3466aa5cee226c76f148cd4ba4048c381b5c6123
38c35e12d9c0c90060298a18a2a0d780d813042c438df01b2e1dea79d50455a5c3cc804ada402b39970d50d15ba1913c256dffd7fdfbe2bfc169455e142d8e6e
eab0fc56fa5b7daffafdf79db93333f7e7e8bdfad8ebff4d7fdfddbafdffdd75f9acebdfef49115e1f1eccf066eb2fa9fbb1e7a3abdf476fdeb6356447f8f10e
f27137e76e5df0f7981ff1e9f0ffe9e2fbbfcc3e590f73ce374f496cfb6f4dccba3a7ae3c1d351e31d71fa69478feef3ab4b1f70ff9e597b8fee772cfd3ff59f
0fcffea6cf0f3c0f1e7f3cf80f2e597af92bf2e593f931576ef5fffaf5cf3efb9fb9ff3ed4ebbf4c6a8f76f1e0743333fec7566e77fd93ffae75e5d1eb6fec9f
77e9e75fb2fa40a748f2e77662fd4dcc7871edaf5fffeeff8f79f7817cf7233ff7681a6faf59f76fec75e6f79f7033f7afec75ce5c726f207a4e7c5bbbfb9ff8
e2f7767fbd9d8ff066edff43c98fecbffecb3f59f0fbcfef7af18d87b71f56bf2a33eff7bfb7fbaf2ef9cb0ffbcfa66f1d793b7dfe8ef1ffb927cb4f7dff9ef3
8fb5fae79ff96934627eac72dcf8f73fedb4fccf3eff0ef0efef92f5f76e1ff7dfdff7bf76b9ffbefdcfdecf3bfbb14d0e9a3d6047e85cfb2f70f7fef5afecbe
f03bf8e7f7833fecf0ac1f34317e9a7cf71f1d5f3cfdef0fcf773f393c9afe493e3c8e1e4f1ff3afb5fb7f7def78ff0ff1ffbf9e39f017661242f881ff4fd9be
74f77ffbaf75ef7f4f9cb3fac4e957b78855d493edd7ef76b6f7df7aff1df7e9d74fb335ecc35900ff1ff79f7def0ef3b71e789f79f9cb2397ae9a3efb47fef3
9f6ef1ffaeb8f15ef9d72fa8920fcc8ebf333c0b073d06e8f1e49d3cffdff6df39fddb0ff4ef1cfb1d9bc5812fd93fff0f9abd168c783c77ebf81f64489ab689
27c0de2933634ec70340ffd07cf9f99bdf977cfdefe38d86b9e04d87de92eaff4191a2f8f013ef5b77c7cf72160e3d4afd7ea9002a71ecc06bce96b141c86cb6
c5ffcc7eadffb3f9e35337bff4fbc33f9c75687e13effbfbda1f64e8fc13efd9f4e3d1a9abf72fa40e89dfcf438cfd9f0f27a1ffefffe3eb6f5ffaf7ddffd71e
9462803ecffd39c8fbd1e2ceffe986cf9f0365ffe986cf0fb6f5fb5af7f423ef6d0fcf7ddffd39d8f1e7de1c6fcc7ddefd39d8f1c9b99b5f5bfabdfb7291ff06
bfcfcc7dffaefd804cb72c1f5502c34a066ff6c31d8f37bdf5bf2c5a5b0cdf75fb6f443efb67beb67b76e2f9f72d1f182f7ee6ff076e987c702cd58bd37b87ef
947ff6aa7f5859ef31feffbe67cf214ff9a7c7e6731333339e7d683c7c1b377b3d9c0bea7bdede9ffcfb08079f3fe319d25e636a8fcde7acec7e87bb460b1d7b
f6b9dce7c81f7e54083fa778f1f9f7cfcc9f1e053efcf0fcf9f03ed8c7f813e78a50067f33a19f813edfce0b6e1a6cfde1e3ed870de03e3cef30dfe474b87ad2
0ec39bf1eabab2f36e871bc2cfcbd33850c3ed878c0e01be8bd85af3e8208d5a12333c127a87c29f7e1990cf391848f3b70c2ece83b3ece83b3ece83b3ece83b
3ece83b3ece83b3ece83b3ece83b3ece83b3ece83b3ece83b3ece83b3ece83b3ece83b3ece83b3ece83b3eff3a366ffd9f77f9b76ff20ffbfbaf4f79ff2f79ef
2f357e6eecd71ecdce71fcfcc7176eb0333b33f6ccece7e620eccccfaf3575f9a76f9a037c7176fc1f5f3b7ef9d9b76ff2d4e9cfbe3dbd2df7d66f2df1f71e3e
f2c74f58ff7eb8f7cf5cf0eb8fef713cbaf2cb133f6c36132f17e4e35e89f3b93ec6e83b93ec6e83b93ec6e83b93ec6e83b93ec6e83b93ec6e83b93ec6e83b93
efc3ec1de32e8a97c3ae4972c3a1ff36f7de0c55cf563cf22bb27d1fd5d9e38ce4a6e1d79ba7af905f4dfcbe9cf8ac59bf9016877668662f56c393bf2b92e5f3
6e153facdc0a9ec5a1bea8b8b2faa7af55ae74c1e4360b7e1572e3ef1985f154c4cdf65b7ba3e7496769f76d44a3417277f8421c7ac60727c1fba9c59e4e7539
3fd4999e1574b7aeabf11ba27ab5e7d88a123d6ef359b73d502294b435883d36b8ae9a74de3d5d98779e36ff155cd85b3d4bcb99eaeb3971a2435b9e82dc4c41
ddf4ae9a396644d9a76614bd6abf18f9df486b5b27b69e71da9759a7276caf1944a9a23158cc5b3dfb8f5ef8c630ecc5f5ebf5a373909d739fc0de768e85b991
0896bfb6bb392f2df8e3ad83f493e33a55772c924ce67a1d4f37c5731783f3b9b1d9c93a372e4ffeb32419e563d11faae4594a7ca3aec95722d467d94cbf249c
b99097fc96bf8abe90968f5923d78964186e3b4ff57a56bad6a0a5eb03dc88c92afff4263592c698a15e4fdd5ef3a8433d58baa9e2aacb0d7e650f74c14e24dd
61affc5f4aba07f257c586cd9b4683ee7b85ef4e10a459b7898dbd4c63f15744802535de2381a966a27d5dc499438feba3fd2d76aaf79aff52149ad13582d9e4
d6bb3d0f5e471907ad6eae63d4aee471dafc83a6a754d21be8aff4a6937c2b5cf4c2533e7c76e5cab375e3947f4efc4fff5055b9c881efa2a99d98504c9fcd67
d7e85cf4c1e2a3d4c9ea40b17a30c99247c96221df962871f2658fcd72337099c07923657b1dee7792a57b91bc32fdb9fc0d55f33b0a251b2927be57dd5fdd39
7ec4a7cfe013f2dfd1c9899f1beec19fece13c6a6175b988c931152b3abfeb9c926355cbad6f14e29b5ced4897e4b18f85741a195015622e51f50476cf3a7715
e5a2fba567474956a50517a953015f53b4e35fb07baee0dbaeeae8213cf46042f8ed649bb99ebcb92676acdb497db92ad27cffae179f14b9870dd1539cbafc97
49b4c4ba963a728e66a56a9af7d3d7703971ba316b8ee422ec9c917b9974f354503293c5da3115572df07bbacdcc771f454473d6c98e3fbaf74a5463e23384dd
9d6ada3bcdd4978dbfeaef798e5ad9c14f4674d50f4ab641be905ba74aeff32794e75a983b3fda88e3bcd660ac7aeca17dcef6aee8f408dffa31702f572f84af
fd5384f91bd0d24dd5a5b39a2d3d5ff17e74178c7ec9c3e58997899caafed2ec93d0bce39c1d49c0da3bda5e7dac180413edfc98bec3df8749ef77fdf335746d
943db4d7a20a96ead0921213edcc5c6b0f009b85837fe19b4f96bb92622f5e5ef559b3a6dc2053910deead782202e0eeb20ffdfd42615eb1af7e3980ca3a2196
eee8ef3fbac2b445793c3bd1e769efb8639e47f5141bfb6d5ffb571bb9aae9d463e3ea733f4b14ff377e1d691d0442b7cfff796dff4b5a90df941a6f92b59921
27e2f2c3c8a10525d2f5bff2974b39caba727dfd673a4c250bf134ff7abd09a373ec577473abaafc5779b1842695371b814dfad5ea3f04f87e7394a12a3a97c7
ae5cd647ca3d45dffabcc2a4942cec11e3bb0db785ad9ba31be32a4af56e0cc1da671d6ad2475ffb47e3dd5f69bb82ebbeeb9285f7a4affa0ea7be79e96442da
62f952e9a5bc484aac9539c8f7abc4b17b5dc31013f454cc9f582fd26d5897a276aeaaa485ef1e5416fa2420abb8f3d413e3fd1190b19032d5ae8ef733d4ffb5
76b7d1f3de84d775702b9872eb1712a621a56dbfc028e96a1815482e25adaf27f5254e5ab8c1677d352bedf874ab6a96e41391e21096779829dc41a4d4846165
918ffa9dc7b5985faa79e4b18f93e8ec50b85e4b15ada02f64f393179d2771357f29e4dc64c45df7f71cb437b9d67e46e90d6a3f8cbd26524cf77b556c6cc05e
c1231a96f6f424dc29379d40545a43fa0bc9a9b6c9aeff7eb92247d265f3523a47ab49e4e4ed93ad813e74dffc7f9ebb9ecc6eb3c3d4ff726d7d621492f4c63e
b079faed6adb5048b983dd5a3b9c361f90dffaeacadbca568ebf2d66671b8f495fe761d53dab3ea52195a0a749263358ef317485ef2ddf826911b77c3bf98426
bd843aeeb1d4dd143052dbbd90dffcb452317993d02bb39c2b534c1d59bf886eebd5ae997382b731ed43e46ddd2865f1e81e2dc5c0eebd4e89532ab21df42eff
b311cf4eb27949e8a546b6e834625026e7924000d67b73ba8b6f7e393d240137185e7bdc46454d138bd1a651a009e4c9cbc477d75adfb267b9bc91ec8b061cb7
0d18621addc76a2fdd43dff06f37e853c2d5337a85af43afa9f564bf94f9abc7b9130ac266d403b7a9ef3cfffb955e2721b47819559f77f8174dd97d56f00446
6bb235d1f3b6bc660c74f626a8af7c20077ec61be3b854ae50bdb7071ed6671f92b18e4eb227dfff7d6e7628409b09aca7593e31d2baaf330bbc4e19810d95f5
960b23765d66b3fee0990a563b46aff5768d7b8a02e49c027de27e3d555cfaed5c30e3c53fadaca88c6e4db8678e1ddd1c435996a30203bdeafa1160b3cff1c9
770dffe5de80ef4f9b5e2321d5576da50bff2a04be95ec8be8c301b35022d76a108296cd9d0194d5b0b4f4cec72920d11ea6d8ffd59ed9a487d88ceff983ae24
98a4bde9f91c50796f6b8516679fc71f1fbf43d59012d735dc45d28add4f82572d4b69bbda0cff3d4b6be8b59c7549da4ae5c9bd91a718ed9bfeb098f225bf2d
3e6e45a3c98253eb0908c30ade21ac7b6392d0b433e500890dff4c799c17d592d8f2aeec119db96b25735a33d86fdae6ddcb6b7a901e44603ad6b09194b8b35e
b1fb6adb730fb6f99148b67a4d00be8b84994a20cc3e7c2f240df9122ec7272a9c61094ffd3bc0ad5555579c47ad19811a933bf627c00d6d1755c73a313d9f39
4c4e7db837d7d54a0ebf3a444f156c1e4bf6267f461d0ff9446adc85feb39ec6e3ff43ff6bbbda6f41326576ba4798c5d0ca8ae1c58ef47c11354ffbe244ab57
ef79397c5b5c99a96b6fdcabbe99a48a96bfbc24092071574c2db524394d67773d5de4c4fb63bf0df22568d539a1d89d7abf1b86402d4e5774f9abea1abcb964
624b409c5ee22b9b33df8ec6aaec87015e02ead4f91e383907c068de3ca390c4671e4f2bee89594c0536ffc4ebbec927d69866ad88b1a855d32d814e3f577d75
377e63bc66d98e9355ffb029467c33bab8a200e76bef766ed6acc457d31c1dcf823299c9c215a3a9263c5e26ac5f4c9b7aca3be2203a985193de0ba85a5a71af
303dff737ade7b85b7a1798f71edef6898013c7c8cfeee45d46a4493de29bade0daa81ad497251e6f3a52df3a25d2a575388a37d411a46a3657508ff7a15c624
2e8b1f9a3d4d3d0a66925c52f4be92b24d6339f28a3e79a31ab8444cc998fc2dca948991e77de4a7c9416fef2d01120f4bdc626476334a1f8f4d4e769fd8c06c
e412d912e1035278f25ebb964e4d0ece51645d26c3542a9647ba49d74559841bec4dfbe9e5216a30bea4ac4312ec9f07a8ef7dd9f062e562e01dcb66803b3bfd
277157cdbc495a41d1eb31bfe2fccc624c59384efad0607ee1a531cd4ddb6cf4f567f5bc5176af4555c0ff33f54e7dc4afd57e6f8dfbc74220862e5f2e721f3d
63f46318c878904664d45fb0b655988350547971c2185d1b8298463de8355ff7ae9521bdc672eb0cab39b68c61ad1d7aee27c7ae2ebb63d57bbbfdc845e461b3
faaa0eff38e07fbeee67b423d41651fbab4f77633c1d69b6a4fac731e73612d5862bd79903670d3194693132b92bda6a870d2237bd1fff999eb4728da1e24fe1
e2474fff45fff9feb7266b6b0684b90df6dd624ed9174b6a339a37430948e3ec59114ad2551adc9bb5c58bd92aff1787adb5306ff6ddb1e97970fc6ee26462e1
514d6e49b4786d0416920ac7369ea79946bf47d66b7d2e8475dc07057570a6e6f4bd4d9cb41e3ec05c664e3d0c3d5ff786d104631932b8cf265e117335f41310
5e745a0766469abdc44523a943d415f6ee89c005c2b9fa32ee9e347f3d39bddeaf080cefae10efe5edcc1187bd9efdf9494f43578ffd2008b7dc411ade46ffae
24eb91ffd40d0d409a02e5763122d59d2eb6f36636389b3d3b3b3049677a8e4b56fb69af5724c8d64b00509e3b3e41bd0e3fb3d0a57618f2822bddf5373197a5
8b2d75e3d4352bcbd4f972a3779f3a3dbcfaae9478abd43edb4343dff9fec663272b894b3ab0c317171aa2f388b9cc30adc802affaec82e9888e394675d47e07
f5d6cbb23a1641818083b576b9ec6bed5b825a8b9dbd0eff796d23a662b2bf82dff9cfe27f7fd6eecf2487b9333a0af59bfc2dc443522b392072bc09b41e48ef
73355244368a0153d40ca29ff96b198435793ad9f396d0637c6f25ffe5531bdaabbaff42c699c9d90b339d51376161728dacd6dd9495d6d214ffda88d9fa3b89
9b4588a3e9518600bff90394bf84dff6e15aefc9e336117444a06cd7726956baaa3ad7a8248cc63521facc9b64e763d502da77ecdc4b3d8364ff3c0f74ef7eb5
990fff19fbd64566c16ca0b80250deadc9f6d4196892273a9a65bd95979a71d11272e75ca1c8ff580db1fff0bd2e6348284e96b2d518b5e1e0a0dff4306a9a87
42f5d35e82445d768aae875e98b84322c964739b0d0604c5b46e0a4e6fa3bbcce2ccfebcd34a3d277d3b215fff245e76a33babb71da3a57bfbe07dd4ffbbbfa8
b0962128feca2ba26ddde4d54662f3a5593d8bd6dd96ae3e06fff2fa524005e637aee4472eadc5518ffa6cf2d7f7aaef76b999c99a676c46334dda7c9b57a352
d6bcdccb3eebcda33fd7e4917959ea78ae0c39abdc0b266b388ca94bed5e8affb03dd88c40b98458847ca0d04555dd58e798a698971fec01ae07517ebce2a94b
52ec699f0c8489de18c6199fef001eca38526f1a574213110abadf83afba674b9d7b92e59c42f235f77dffecc619d19d5d53cc9889fcaefd7d94d4a677074aef
b97c7fd9a1e7dd621b6236fe48d8ac8f75c7ad46a686fe681c1fda24ef1cf7672ff49dc4ec2aca1a350d51de335d43d1e3d6938f2b2dbf63a53d63f1b5b3be31
18d575cbec31b79230ff763481ff0c5e98a12e3aa8df4b5c162e3781cefb7700b466c738317442df496308eeaabda3b2491763f943b7d5ba9f6b2deab57bd564
9edca2bdb639605646d9c56acef41202579affe3a7878364ef70f34724dec6a63de0b493f2671bd89429c9e9ee3cb85d04183e8acdb64d95f1101845178866bd
5b2e441d77b79ccd8764be3562a947bdb919ff2c88c5ae2fd7e9ad5ddaeaef762e99f7c96765b779276c9272546f19baf0eb9a4f66970d671d4e472be9eaff9f
262e56d12470aa19ff2bff55f3d65ad98921f16b5ad64b757809d9ab334bd926f0cfb8567781587437e454602f3e41234d57c597534de24a516b39cc4244655e
8a32a89512f4023c517ee2d173a32aaa5a73aec929adfbfce3174d99582a0973d03f49da3a3ec448c9229448a3e12baf1d63cd3f40742fbebe392d377212e8a0
79a0b8a9daf0512aaee6b4ffbe65f7f41d16174ae4431c74385b141aac50973d2135ddc173d9edb6a37a672043ffa226d88a0cc7903027fe5eb75b6563b6b58e
7620b31a1617bf52b1e07bc4ff3a7d5053f585852b7c542ac28150939bd5ff1e44179853667126f196899efbf0c985d539b9f1b0502c61fdc6628015a6766f27
aaef35520e43351c584300ff7b170dd04bcbf66be908ce5039a11aa5fd9bd429c47743e0ea67d233f6978df51a306e5eeae676bab8ab2eb01dec0f592be07fc7
cf63a18dc8ff1d786de604ae63b5f4b9de42957c02eb66ff3398b6adb23b0effcdcfb1d556fc4ff332b8eb2df94ad7ee32a4a9675098b0daa897b9679f5ea334
9b317f65421a980b033e21f4275acc68431d203c88281fb58f1f66b95af9323d3736fad156d4a0cf6af3da56ebeced9d2db81bbc94c104baad17c45588b5d278
ad6a9f221aa2f5ecbcbd09fa9f1b9417de7dfabd42ae9d194953aaa00cfe87da675b0390f933fb8f01581ea7af0b4ac1ad64dea7e390a3aec86ad4ecc09c64c5
bd0a17be016ccb9bd3c28dc639e08fa3232d57cbecf0f10d4b1d2a6d9c9fae2bc8bf21ff5ad37f39119eec81712a62e6efbd6933e6bb75fc843dab17f863ef58
d6fa913f384bd9c6a9625ea92e7a89280ef8edad51d73f0737079af9917e4a0f98601d8b663b6064b191ed8c426fb471fa85a4875fd83c9d5883c2215313fd9f
c5767ffc93b9b177019eaef2741b07160a3c099a869b5a8c3aeb1d8693ae73941962fc8d1e2f3d6c71994d9f7353faba3fbf653bbde16eaff630c23829ca7546
a76b5a86584edc7bd8f8350df7d96f991349e6da50a7b146b53a14fa32e4ac0615e0fbaac0648eab30940ee8943b5e1f390f44f65eb3842b0dab71b0607e86bc
8c0c2001c6a4371e26faf7bca92aa714e06d4bdaaae8eeb321c32298cd775e40f6b0fabd9cca57e92501862d03092811c716609798732787c5f672b9058ef727
e857ea642f105356ed9a21e3f528dc39ef70008f01aff6b3f4e83bece09fd2270ba1c0cd9b401062debe4874290c7be551ea2d3df5c8c06c6bac5398bc4b86ba
a62d64c7dad6be9926b9108dfd3a2e4625e5600080af2fc8dd982d421e96728c394e9366cd0cffce6b4125767c8ff79e1a03062540f91bdcf02bb5b51c5b9acf
dab90a6442963dc5d46ee95b0cb4ca0637ee0ec7ce873a0df789dc354ffbbeefdd4c446f7693bd06d275dcee94ff750d2c7f23e1582d4ad36c91be4bacaee548
e6e955816e5b892c074341a79f386b96cf5e52a027a58a5d12705bb256b2c0798b8e4d53d7aa958b2131be185c001c9f3ad8ded094c4b5bf6cbb4e98aefab4b9
4e703689d3208c2194302a2e0205f642b9feea5c3ab86cf0def479503ed7bdf6646746b6924013956a364d2e57660fb462107f33323b4c80721f72f99b67810a
9c0a0794be56508b004bd7c85effba8cf7bc30afd7041456398a523a98f4605987901263dff8843a6fdd93958213473787f606d28eb5594c1969ee6d294ba570
72920020f50ffd0c643c05ebc4324710e5cafd1b0b57b9616994666e89046804ce4c39706dfceb38f351280cc4e4d7c7441fa98e257f29d6e9bb7e2aae823d6f
3d11f6a589502215df28ef709c4bb93b9e9b3c7e7c60b46e6da49aee8ab9e3bc759e46ea3db8b40bff6d9f943cf3083a3e3901ed47b0a1e7c6bc175c9d2cf738
2ea009853bff414b6317e4b5ea987896a69e101967ede81ee8d3f342c416cf72d9c3899c546b6df7835605bbb10a408908d6300b35ff3a1ef2876ad34de03ba5
9a2401c9168d8729495b9b3c139bf51a7b52239338f058ef3da39f532d905b8c15bc344115217b72af0ed28ff9ca0d50b8142675e1623834867a0ef7c5525dd1
4aef2664596dc4287bd853cb81bf9affc3af60589960a6218ce470580bd87beabe5c34b94aa2d3b9612a554de309f1a1a895273bad0dfe95702e6e066dbcd1d8
b7fcabd635574b037b4354692c8795638840bcf4d6b926856603b5f94a1590ce1e59a58d8ae9fb26aef748fb6a273f1736eb541132b8dcaa20fb4b967f54c599
9f4b827491e6a37b818924b8d5b575a8164f3cb89eeb6a10b3da7a4bd7549fc8c5eabd48b33a380f5b3d0e6fc1ffd20ff24af4732838981c4ceb0e314beaff47
fbcf0de295d513f391da1ad066e29be479f857e7091c2e5fe54b36cdae248dae58a61a87e8c5eb79aa51088650eaa6a340da107c51310ee7a1a45da44aac8985
7a0abb9af8036f29f497e2017674cf73388717da5719b256027dff0ca98bfdad11b45ab4967f554b589cbf7b1bc96d01676c4c8c3316f2b5c00082d16b1ad6a7
aac4c62910071b2f514d9e0d93152428b6128b852ce37c24187f20ad95899e559ca53b920adcd68d0c183bb68d1e070649a444134923f574dee259fc8221ec76
063ebd035cd063738caf0ab7e7b8cd0539505017ba68f9d256984f30978791ef2335ef3e354df333b0df1b8aa597cd53fccd84855689e7697f635b39e20a4fff
dfcfa0833814fc264137040a860986d3320c96d2f05dbc2d0ffc8995a580ffff8ad81fa857db4092f24542214af9c3cbbc615c033826c7dcb5eb0b969dff5388
30bc0cc761e29caaaa85a0d24a27173e02b34352a0f7b65b4ae5a079b35b7cb763fe56b26dec4462287fd7b5149e12bdcd84297617bc5b79e7a25200816ccf0b
e6333f157b9fb3f933a8aad1f2cd2a9fb59dab72831db95304063360dd876ccda4d197f43a3d6284402055d2c575dd560454bb0a77d8dd86d993522759425a0b
ccc385d852c0424ef01800c5ee819ac665912b472803d50f68c2f8444d5f0c9775beee81bb9e70a07cadf890ab9acec2cb10fe30637301880f06c97ef08ba86b
47dc61b3b2a25d577dc8a995d7739632c343f28c69b0bfa38e0b56bd668cf7791d8e0da6f1e557aa85e208bd2bc80f86baf07bb9cfeead6ab707d303cbdca657
fb190af04986121ef181bf770e40ed836b2208374f9964189624974857ed046cb488ef65998688cc299a0a0d6be1529d96e7e08bdee1ceef650bef6518c73361
93f8f5834648357230029d039333d3679e3dadaec6d2e748be146b497b1fc1081fff801d08dd7e31cfe1ebf3a79d50ccd697625bc71b9b6384aff2bff6aff3c8
2e21516e1e33f3430b02efbcbdf6333d137b66ffee5a4984b926a4fc5f8fc8c77bd136e540be63b81ffbe8a694b8b7a8ef7553d431183683e5a104bed01f17b4
18fff2d23492d509275eea39d553a4d12360271c0c53cadba7c9a33e29b6003ebd810145cfcb558c12fb1b9f250e602d4b8f23cf52c3fdcaa0b8ead6e8d39541
da29a07c110018762cdad3c1b6367effa6ecff0abc1cdf952466d0aad4d0475bba31093229f3409e235bdb84c698b837f2210c003f2c527e9ae603ba04f004fd
b8b00ef31c15da8e8948c46c2b57604d281184d319df6b063118de640fec934316104cd0b74e58d3afc01ff70dfdd2f966118860ab86e283c951568eb44026da
40ad9bc1c056891a07e0cb8c2f503ad62fcb457d6261985ac80bd78c34e01653b5693bc4fffb4244349679004e2e830568911b2c347c875741cfa560f42b0853
817973923b4b82d3ed7046732cadd90f0eae2c6f0f52996f23599d439ea266973c9c74d4601512e4e7f4025f0198b5be2b640e10cb58e919060d4a9b2dff84c5
7f634b5e872c4bf6adf3c6cb0a84310bc2fff9350880ba431053dc4d0898e0caa0885892f3c6d1680690776cd5c0262f02a91aedb9e7b764281760d371a7bd7e
6e5c69828a61f0e523bd257cba6384c06be51e3c206b5cabd41777d49ed43ec85296fdca81f34d4bffbac819be4b88ad03032151cb41313a61a1f174a19456b5
4ba424ff1c7fb02df7a89a177ecd3434e3628069f43abb1e3122c95ccdb94291b1c9b9d3ac4440e39d487bf50c6646866dc40ee2193e646d3469856e615affdf
c2c6199af6dd695ba8bfcd9f68f6e56fdcfbc4ef709beb5bd54614bd982d862dffbfc2a3c0af347a1480081da0574b304e58d240355b87fd3ccaad29f2959a0c
dc1d9b58d13effdbc07e24a4193cd559387d58b001bcec5544eab9a58ca1492ee5fd49f02101320a71eb4aa6dc0a9c46f48eb1e3ce07b52ce640edc73b9cee9e
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
289bdf3faf78e9dd8fae9251d8a22cd45c4c510c5dffc9497ac539229b712f5622cc71dd9263bc25404e73dd93bb3b51582c081934e7201c7bb400f05f32773bd1cea21da0c73bb1c60ab3818f3769fa95bd9e9d6797d62152b1a028fde57d160fe5554e10c86819cafbded275481cba3034ccc124b85d8533765542d39f6983
2a8350379687a1a3277dea3f2f2b1c7603dca54589393ae27fc86c9f00d7adfdd10ed100e435da66189d0be7fa31158a9c04a9c0f007fc97e596a5f75e12c597f3a82782ff427bc6ff8f2800aa5a2f32fe4717863a1c92bbc51461c96b8a26fa0cd26cb189ffb89360cbf2cb118a98bd1478e6e236f6d7f7f677c37f6eff69af
__map__
f6f209100f76379becff39f21f0914241d4f887f0ee9a8fbaa4c578a61842c5a0005c8d2cb7e0308ef280b4740f80352fc995a5b25ff8fec763be3f9826ebdbc382bfef733fd7f0695f72a998fedcc1de0cac0a5f471d5f0902685d191ce6c9a268b5522cb9c41f7aab0f41fa97bd1f47c934964847f30fc3d4682ab8b510e17
1fb8606620c32c20920679f19eb438679b5a6de58c32ab9623534febdb154fc45f9868eb4a79c3e240b779f249f7e4ff6de746e66d50078cf085b2826d3eb669a244ac2951468b73821227475fbe25976c7fe14811d7ad9956e0e988a95cd3c41cbdadc9f26f840c09ca2ec12006fe4202f8807972d9a69a5d5667c5e21c68cc
4e1b7e27fd875c81866eb7fc9a49f133a4a57e40064cf7e5e8c0b22acb17b907d4f1021dfb82f7c15c40d407733f4f073507170835890b9999a7c749ce55374019d92c51533b02203e59b54d2d6ca63a45547f5bc88031cd00d66653fa6f3a7f6c41f232bc74a00f891b98de8e3799ad1e20e835671be8685cbc071f86e05da6
821a364703c06cff2c0cee25a0ffd54afe9f658ecb0f1801ece046106cdc5630d3170c1a70616d7e7b26b9b1bccd5839b2a1a6db64eacaa4c604185134a257e3f78a0986e5fb6c611728a928b92e2464f59766e74e9a0c7bd4def6431fdc54a971e29ef9935bc07f0305cb759b555c231ac80f90f8e57b3d2c3eec4efc0f5c98
a1160e2092d0ff94ddeef79a4e6442d3445bc1963479dc41433570a9be873a583e2e1d74b4ccc3f77943feb943e6652c1073b293803b5c26566b175e84fec28624673126aa117e33ad861d0f34b26d0da8ff0f7d1af2df0c3ff80f91a793b844ded8452dac5f8d4ab4bc4a1e5c3aa43435436f94644a699b928f697e646d0517
99cfb4455d26b4b9428b6754be45bf93b277a03a992f775ec9b02effc6ec1f11e1c350d47a7add1aedff56ea9755cada4b520933e36b5d70c144932faf88b0c8fe5b47a01cc1116f6e56a057a90ce2de445ac8c446c33fdee080274baeba23930ddfc6482031dafa972be0ee4d3fc20cbc21c71c7ba0ac4aa570a06205bcbe04
6793e9eb193054dd2ac1268bff17410fe05b7b1b408a99e1c47fd77f548216ad1112aa40065db6b8847f88d1e1618cbe569b70dc35d47a4ceed01c606705a62e221ab39eac855a6264eb334881527d8ffe7f15be1f39017f8c9cb128acf665359ab42218e40e51ebfd2a11dfcc2f2335f1bf761fdf4498d22676f9cf2f5d8496
9b848292010151a3b688062d1d3923799d5953041a84b9f6f03f39140b21d02f88e18c3fc5dbc5133e5b2a5ae10c921bfcc0c5cc010eaeeca8e0bc2dfef3c62c24c5bd0f94f87f474e82d1ca22f86fba69d32dab845231c1a6c68606269d7d1ee0c430f19f3220fd070e82cb636298989c888d7e011266127584dff9748fe6f3
6828f67b4b697fc9d773198e1d564249075b0390c705b82f5a7f9a363c845c98f810cd68f7083bc93f461d66f422fe0308a90e1f901c66ff077979887e2041adc4bc4b31d483f3357e330124d3a7c522351023bb6798a12c7bdd496d160d61f46bfd3f242e407434ac05ef167c2ab3c50cb6e814c97fefc4363da71d35282681
198bff0cd6a97540a815b03328689696eefe904afc60a18ddb9997a597fef7254449ff7700a4518782089135f655f8108e11912aa0cd9bb45cdb951a49fac43730a1322c617bf0a2739eb99a030d5660d396e6dcfecf32f6374f29d30db380ba42112ee150a3480c41f1f806e411c8ffa629dbf10ac0d608ca992e63cbae74e7
e8ed774ea4ff46fd79e42a5696fcd938b80ee7aff37e40a0c759b88b217128ef4e1e62f7d6420a3b864ceed891f21bc69c3046c0e89cf83f269c32769a66a3a5d90b13c7cb8c4d19300cc878442d41952d9ab3bfb86b851916c83660f6d8f50c7e606ee0ba7818fd3ff1ffd69090f7219935d649e321423420b645cb10a10f05
64c3a9089d04658c5c2b44b2e03f2eac8493d978cb31eca0e3fe2217811fb30f19ffa155a8464cb4eae930f96ee64f3695bbe443c75bcf419eb8eec4e798e401567ae34adb3632f34a229a78cfa3e91796907482160425f116403312f3ca87ba748557c4ef24d63c092ded0ab3180eaebde67d92eeb2c6055f22e0a0724810c5
7ff3d1e652589003c889f6dfdccab294d7c65c0efa66aa042fb0c04c5ee2ffa56df17f6681fa0ffb4f7f092e26fc4fd80f51d6bad8178065107c306b7c85b9fa4ad95cb8a015ae1e08e6013ca75d66564599e865596d23ac09d216ce301598a5b335034af3f950fe7f10f517a2b00c4802522ff7a4c5f2a430845b6a22740e81
fd6af790ff6716d4d0e58005f0e49be65cea7a2ebe686e51d467b2af1445f2fecdd8966bd4356f82d5c1e9530e66ccba3dc3e099abee49995f58d545a41363b7ff9b200f16768995793aff677a7a5883f8bfe4c0cbba148648a4915dd6bb1cce3b1ff53f1088f84bf9cd072bc0dbb4e56b54da3ed20d5798f8bcf2505d417434
8c912831732416f88888abe7abe044d6846bedb45b4baa2fc0f41f32917588e1471436c67c034ec5ec8ffc6dad1b92e49cda943845c2e05f98073c9d655eca53356b91ff4d4c8ec0664b7e3cea8aed1636f703826c573c70848b8386c0225a61e50d0200d38a40dbe87b9ad87c6efc5f33630f7b6f44377746f004a73630587c
ee10b697745fe0251f224d42ffff9233349068cbd496308c11f63cf4900487f71e46fe07da2f31afdaa3f7369b7cd96fef586656c30f42e50b0a171e729af360d202f92fe7222583b22a957101909ee97233df7d731c4e3b662f699296b6182cd89c272bce7f8bffc64a364a5697dc2759ff1fc1cdcb7a26159165d5e67d3f2d
20c9ad948bb0b500df90ff2be27f8cf989fe621a40fe3fbc25da37d1eb89905718f139fe578b14170a7ccbe7dca19f4bb9cf8bb52c36ef153bf15dcd2e097ecff126429e64dbbbd467ecbeb948fe2b8c53ba55111360e882fcd3456ba5311bb74cb2192db5cecb50ca23e3efe200fc9f15d911b01d46fe9f28e3aa1c0164450e
406c247e9404c9102b4446865481fa3c2ccd22ec09ba6dbc910452ef912096bfc88e92c47f7c61545a066a7477a94a30f81f94664780fb504d580a082b0517bf918bbe3d791ca80dfe7fd5e3ff9882f53ef1bc16dac4665c8a38936e43c02f54fe1f2a3d16fd71a5622630f9167583510921aada596690268c2d0a84fc0f65ad
94bdb9bfbda259a1da6eff779cffae4ba6ffbda1f88a248a3da0f3a5e3e52cb3ba43fe835eab0385f4330f3df48afe1f1096fc578ee1501c66c4375f518d215eaeff6bbe711b8eab561e4d023ca0bc10767e5b1ab295b185c99335dc543e4bfbbfbae310050e60955186f82f7db9704b51d0d817be3d74404dd85cf38e1c34e7
8f93d386a116123ada6208e6dd22ac8d1c7bde2ae2b6d65aed31b588ae04991d4b726131069c33608f04bb4949e02041294206eed8326a61c5e94ea8caeb020f5908233517fa91ff88ad36d57bab95af3c888d591611a120455ed1e43f50180d373cde1150043837bb4bdd97561f26fe5fa0cd70d38fae125978fa86994586f7
3085abbcd458218841416019ccf012146d51fa6fb9616651c4aaa4ff348cb0ff58116aeb3bf0a8d66270c5c1ffe209dded03ec583e852868339bb456128bbe8980ed928cd7aae727ddfed327fbf30d5077ec2dc7845de365c5aa19c6e4051115cb5f9ba4b18548782e1ca2a0819708b7d935db3066d0171754c1daf6da58edcf
565b94b60e7587029a6e1c6fb8fd3f91fec3601f0d7d667404807ff369cf3a7b7533f2dfb4e98a01e919670613bf2bdedab54c3638d4dba2cb959f208771ff87ede210fcf78c28596504be2c9b012523ca456d80983d65a322fff9448945440a2b4cfad0002832251241eecfedc06d9a029e44b250f0eea9bd8c8109398e5e75
eda33f74fe9b1b91f6b386a2c2d00bde179e8460ac1879d943a143172448e9aa337e138075a88c307b6623e7dcfb63fdf156d1941cac5f9861e8655689856f1a017a1dc8d311c97a54d11739ff4139f0f670539c153f848db604b68e8edcfebb75e5ad5d2b51ff176563673d2ca5f11100339aae9d4760094caf08c40fe03d94
eb62cec9e6b38499d9745b4ef25a3ca54ffe4b048c0273cc70ef508257288f972a22ff43a26ce33f6b41724e27c4940e3210adcdf21fb3a0db9b2bb7e4c91677dcfe0b78ddf76eba558951f9644ee9ff80463bd9ade874a211dd64b98a6cee29488ed0fb50f9418ae520eb51a70540320401308374633d720a177762df558ffa
cfe09cfa073997c65fc1bd3a8c92569cc0aa96200327c9e96bcc98ddbcaa6bd14843cbe45fd6d057382383693af880b2032624fd778fd1577ec2f91f3d23a3c25e66cd802239ef110acb40bc78bcfe91c7692c4d7cc2269b13b7df2662b7f8d67e9c44dd728be8199645493967d422871eda6e42e82bdedd123352fafa8ab2b5
b4fe6a19a1018f310c9e83bee0a119600e103c6f2d969a465c4884841ac6914ce649eb3d00401a4c8faaa4b84aa0e761760a3b000517d5862e08069c3188513e31c08a7227888e6748d4232da9cf94c389ca6c91ffa49157db51f53f74aa311c50b07f09a1aea9aaf41f37d41ebae05dccf87f0424820ee15ec6c53969084ce7
03fa45d6fdfbe4bff43fb8aa77bfaa4083faff80eea0e73125616ae4bfa46b2c03f0409194b27e3b19ff09b56c75737df28c71ed80a9c4d4a4e4e7914c9e0e015a999b49569e19f03e21ad0c1232bd0ad5304606138836ab592a19bec92428f244a0364337e9bf70cc454df400330d33d647598bf7ea46a443fe5f065a23ff69
aae10413fe47e2c8d26c02003b27318f832c625f1a4f92be3488fca7d701ff9758a675feab3662a51ca516e64935e60788792419c88b88ff734831043bf4bc815b3d7b129f6c1d6d794e01a9a45eb42c2b4a0b5d9e91ff2757074adf0a4daff92468de7ff30d18ed39c0cfa09bb0d4b0ca1bccbfb689b0ab49d62806e73c7bb5
e41250b9c791bf078e3f62796006179af53c36d44605e05a251fc6668868bdba7ce9a5a1f75d53e83df4452deac86c757f2933810377568c4da99c2bac183096dc249672fcf7fe8d13e9d482a77db81fa4c9914dda44c0bfc940e0c2059dbce3fca7bcb8902ec5241bf57fd5a12fd18551895d067dedf544b92d8805f51fc0d0
0cd2b79e7f7fc953006361fa55e6cbc9ff2395e6e88998d61e7bb8e80c21a2f270931b5bf37cb288b1a9f8dd826c53fb41bd6147448634b791ce502452e29ca0c80355c108b95d4ee4e7ced1e629dbd5a80b8f6df83409ac7fe0feb6133e68689efe45ee6413cd0f3be23fad8dea2e0fd89ae420db5d04f96fa750a98e909f90
febb21b345c3b4a2a8cfb841898d1de93f755eb686dd1914b939f50e306d43fc0714a7066147f3529873aefdb3ca01b91d187a9481ab41542f21d27ff6f970604b282b10b108ba598bd32dda46eed8128fb71814e32a427c7dc18ba4ffaa630fd9c1c93cbce73d612fccf007d607e6efeba6019cea90c269cabeb9075eb296fc
f7e0c3561c454100b926c88be34ecbab3eb094a3e592ee83e44704ba6af04438a440c02e8806ae792831256369cb3125d9f8500682c641161c1b26ff8fc6ce7f139c4bce7fd7ff8fedf5377ff1ca3615b352df37434a453f82b9ec073780ba78e8e8f684ad10e80766a842d847834bd07ac2bac703ec27401ccf40c1384011af
__sfx__
a900f0a0233790d05c0076d1502a3713e1421b014140f2452a1283c0662a53828470363632972b1c6003d14e3f2013f3652c006194400e7613a2141101539270227271f67d326183b31002215171212527037425
decfae790801d3f77034274247680e24909314264702771327676117111f02c1771f227212e66b2900f2343a0a20d04366187201a015070581e415103540607d07440185751f7751f444054252e61d1d63d38242
4f7ffcbe071332a73533742124160e0090e139094353077f2401c2d73831277227402614e097200f77c063073613d397782665b2d662227392534131775101653524e3e7710f243395460572020524145481172c
bf32f49e2a1230f31c1100d1b0733810a280261556d1c718211660845b247200800a130322614d2a73e214183a24c1c35410101164523f65c0366d3c2012e3733b2240f2173d77e2905e3801a3e7130374b0c722
d84e1841137290353c3f71f1e47d2e52f12156063101c51b0660d3f715102633f7370b42c2006f2f57c2b31d1d4200f46d00642164241646e355130003e3f73f1c57f27326005012111a232502011f0a01b1b370
947c514b0611208257284262e41e317333046e1721d3e55f0964c0c15a3340630479257130e440296663b0463a6233010c2453a2e309031340c71d2370f3e12c313350c167310021371f3b04a3867e3d62e2c150
ba734ff73e1721c47d1654a0960b103123903b0833034442150631505f3c03d177572e352187361252c3221b2c0712e47f364711d0013000d0c46b0833213377035701563e2863d1947f0f26d3e7191600828555
8be961762171b0233d3f064095751871a0557620006253691a6742210f09722046100c21a0f2020b2652e226313503a3750e0370366f1f7200004d0a2743832222441346371177f03541062232734a2256a3866f
f9f0d9f503606312353607d0467d38103273341d5003e52a20326190732c01f1f329176460360f1646f287543c16f0f6643a17c137652c57c380590d6643f61e2457f0f4292b2771e06e3d5071846a1d75b3833f
21ed4c05151281a13f32724091331f0372357b2a40a2772a344330022e1a35b1963c0a2391b44319764154691353a2e669050663214a2234a3b0382a41e3f31b230692d4070b13f3f559156231a6380b6542e31a
8422f41d2416f1f17828326130343e5343a77c10777071150024e1f430232460670617108086120621b3b16936752330003616e2f71d1246c2d32e397752a63d250510f6031321b08205251320c500153590422d
521220f31c7720e55e3a61326167041320566d040580c02d1375a3e11531227014691c009267262777b271272556e376381e7020630e3d1393970f2401b2f70c207383f7733d32f1b3240d404180011d5582e24f
865812ce362001d37f094151d26a0b0723b1370a3702326c2e353336460c15c2b6713251d3f3032d0090c40a2a75c0f46b220530e74f3f12931777157423737228700066102d0023901d1317c211092b77b24370
b7b9c10b206770514e205210006e283393254e332483b4062e76b091042d25a0165f3b23c3a76d3d141016640f1132607f2b43d073731962915563183560c02b333031e347211750531927354342162145822429
c7bfd9953207323215300302460f3451b3614c0f3692e70d3e7781d1001c7000a57f353640665c0972601229012391f467245403507b0a4302d27b2214b0035f0f2012a56a2965e13404117041010e3d24d0621c
932e5ed53671c1704b30276061280134e2545f0f5283a5692600f074293642b25040366152a773097243e7762927a0855f3f111013170074b2410f11573327772b43e3f27e03235315581e7142e1070707e24556
066abbba0345a29279387600d02e163621342123710183772877b020081864f2b75f3d6251610337211094580e23e1f64f100302d0743d1763436d141373447b1e44c1744a2a03b1844f2f27e0c1161f64f39524
695cef623062c3e50d3e12d3f72d0903f1f42f1843907755022350e41b360793776e381781a126077172f31e201230a5053d5583920e053772a5190943c2e47f3733c3917f0031e032451c04c120712e3223753e
1a39f336004752d139376463130d1f1081a1272277f092430f16c3714a3830e062582d35c2c6623227e3e07b05511306191b7770e5060c73a2435d35707372092b7733c12d2227e012502e55f0511f114533773e
0ac09ada0325f3f7061067e3555f3b33f26343074161e375013752e7393c70f28204141443a3280545c0b0421171b20476306623663f1015d0f7110931d1c71a1524c3f15e2d03f0e5472754a0c76a1067e3b105
ff0b5e252010b3c46d035380336c3c61f1b3091f62a2d379375380f1483d7503521b3c31a0213519678382002f7681047a15107047253c0751c71b2f36e3f024085313b74a0a03b1a12923066300321a53d2834a
eec41a593317f13564362311475e01127325273507f3b2781c0622a46c2a7361b70f362440051e1d4761c0332d7470f6590d23f0516f1f4351e42b353473754c152470f509190452363420275107473a5770b400
df48f1012c73f0652c1703a094642f3662c414124710d0602a5451a61f0e158281630c37f1f1212c5170a4433e7711f0193f32f000282d35b2d26d1441005621260283a524157531b62c3b5302e2050a2723b15f
c3bc6a291976f3c4280031b2b3090763b1651e2c5352175f37518217553222c3737a3d25d1b7233c75b2b74d3107b3041e2810d1820010361011270e65b160432562b193023c66d076740d4770c4071f24e21643
ff9733cd344270931510652087011820d2a6431421b0a44c2527a16158237610f6042a337080252c1010f7792b75c0d6663b2732d5681973b3a5040272f0173c2a7650c63f0156b026460e018070403f16000004
33d22c401b01b076470e40137424086282570b1a43709413192611d32a3512b3e3250b162232580d3741f229336073807b202251002a006141762d2b75f27400366632016c352641821930246000151127d23352
ac7a68cd3c67f3c1631e731077262c71c114641137219260252333e2300c04136271083062c51f3e348150563e35b29334303582e351136431366b082110017d1f06a1f04b3271e1e12a0d74a3c7782944f19730
a0c7440a1f24d304623b74f0877735250081273e5501831e0a31a0212d2751a1c67f0276f0b3521b2541576f0553f393612d6291266101145281010d23f0646f0c400066662a0670a66f0b274275501a2741852d
37c9afa80f033215052e320316733a10524345144110d6350b65f1c4271a7551151717026070750251c3e5791d42b0a6581d1400661d0e6743262f110450370f3f65e262231e51f1d54a1363a1464c1f44529170
d284597528718104602f33013247305313c3230d67d0d47f3d6202c1673301b1f32e0443e3e53d3e35b00067070142151119403153230c36d0d1552a7482e1741013b1602302166327420e6752052b177450c312
9f5b4d393f0461616c147692e63d0c7200d65d3b67e2924d3314c1b164090523646f266352310a02059004603f01a2c608104512366033676011502a65b1b4630772d1b7262b6091904e2d4250614f1b10410232
c546f41b3e473220090114f2576c0c6701124b1355300067341642727a3a1701c5233c10633038164102f13a2f4781747d1723b3824210711211552b11a3833a0e0391c17d0e4711f3643c513364380d43429003
ee99136c386471002d013432b5320466319155143743e4473d57a376011e5621806b1770b1e0213b73e2f66e2663730001264003b35f20300386562006f1f11f3f3353c17a0021d2761b207713c73d333740670b
59afa6db2615d07370083432917f2b1233457e2a0683140c381751d12d2b075241771e6290f0510c0491b6793d650090002454318734387713647b2f22f193223d63e2022c1b20c0106b29610351413f65923037
ef52e5611e47230011165051277e2802c192380d76a3d2513d1260c1161e1020671e0840f362533133f2345f041100b20f3e2263f7470347b27074096700c14e3f40e016530233d0d56123264076391640f00729
0e9555122675203673107672b4180d23d0d1113602d33407311213412e2625e0275e1516c0746b0673906671360012301e273723e66d151623d5521977f0c67f085083e00a322573a36f131262b264397361741b
d00b2cfa36346075490b41b2416214475001542676d0c67f3d3471b3710c604052112077b3814c32233042302020f167300e57333025366772b47f0116f0f03a2266a335673515c15167026002b21d2a2120c621
c6ec47d82a76424109113020b43b153600850117162360493d2192e037315042620d234472312332433177212b3282375d2f7363e76f0324d2a7083c339267242742c0f177363723246b3367a0766f0540f1e53e
c2ba9ffd273303d76929052187750962f0600e2153e2173c375373f3501025c1b32a1162e081210c0421e0271b0012433d0e14d1d729055030121b0933c0a3150f4500c45c1b53d140541144c056213f65a3b47f
c155869c366662d17d1b4620076c0b3521a51c2c06b070760b6331157f1f31b0033c2955412428134761100f0b65f3275e11567360641b0053d73b157511a6451776313470170312254935312381701d32315513
689fa596372532b2450210e3114e0535d3f443214381626f0e10e2d5700a2142c6561e257181371a27c2345e030003f36b2c10e3333e0510e3f6763436b2375f2b27b1f20a0805c3377c0051e3100d3646836756
b504f22f2b0183751d2b114346653045d00479341471d035000162115e0b07c031543602c391670f32e18058243062e07c31142295712f6573800b0f57d32634281572941f3f7520f46b046483616a0c02132053
ce9c5b6c3e03c2612a0504b0b42605668314761d5061551e0605a0a50b314143e270093120b769270200c32927622272793b32e236243f6142970a3b6741b5372515a316063e17c0420c04067207741c74b0436a
057f72c3314312d0260804a2633134367343603000a361620067f1315a28420395272917d0b7192a32c181482d6333a778372212952e1e55a14142377552c43b1d5772b7470507b3635e1d0020c427251020803c
51815bfd1625b0b6720c6252b304386733707b0351f2100f2b30d271462b6663b56d3857b0e61b2b448010702453c3603328513360092a44a204522022d3e37b3c7733d27f0f042231330b065194501d2371335e
0adf10ff060193c049395710802d2f7573950516109377573862200657383122026f1c3620322735668397731e37c284193070d070313376a08436113781255315066107501a4042c54c2646e3a13f044761d028
bc317395116293c27b382211b55115647075243a07d2331a075281d0722b26f2b2102b336043400a70d0016b195213245924250170713642f1e6322f1090544f294271a67f2e16b0750c382783e576330180265f
0b62df290a20f2314b0563d0163a0d6450660e0f04e0f60922373004590163f0c77d050360743e0e4210f0673643f3d70b3176912411346120853c080580e772024580375602163233330474c3e1030c0001a123
acf87f0e120631715d3f76c2e10023633300423a660265613a36b325040d062366171816b1f4180c43d1f7783d76f121092f1521e723310082172d1104b0c2560410224730326783800c3f1101551a0337215212
fce1b31b2214f2d4153614e3f778390303f37d3b407241571d60e0914f207510a07d3d74f2b0642271f19615142641706d183720a7363a5410040d1924609076105031a528396363e33e073452a7761d53938510
9613085f064071655a1f14d0637b0d12b3c25e3a02f1e62d3c30b2a601322550703c1451f2c5080522e1764628464000143d010374183633f0343221241366040310b2e1102111c03442025083412c185483c76d
ffc6f67a1b0031416f1750d2a00a292112905031067393202c67c0a141033210c1113e1423304b2b63c0c76c115332c4072313c2005e3573a3a6661405f3f37706366034701f35f24467120732356a1a2633f173
b16df6272055b1e40c3e6032852b0d14403242294063c46e3906e3e5473c52d3b40b3455e1b3190a1302c737011523050a330242d4412647a0302012470127310c745091742d3472e4553073a306581f2671360c
fe6b02073f40a03648145261e6513e71d2d27b3913b3d1071a3103466004543070683613d1121f0433c0f0283b70f1700f1d26e3603e2f65b0d5320c13309408113201622b2047c004200d27b095602375c0d04e
d83753030755d2a45a2f303076232417f3846b2010f18066110383573d21523265573a6443135a0176b1e717394392d02c211733035e3532932313225031572f01137324710307f227341125a313662066513207
ea3dc11a1b7392005b297020e07d0574f2c07a3f36b1226e1457f37240161303c11d033601f0600827f0115b3c30a0720e0807e3503d2d33c077213b0002d3482c6331b00e390223c21f0d2670446f3776830624
a63a4048185001662f3e03d015683c5692412a0257e1273b0146f192440054d2166e3025f3b34d3f46a00700343571f0050000718338000702223306241090460025e3a667202051f3100014b054000451700421
cc1f26870573c0e7600b2793a1442c63233409112081c44d2a4393720b0344a3c0562c20c0c6731564434303385323277b1036e275413935b0006f2207537431130310311c1e563247232451b2b5482055c3410d
23cdacef1f461370493a70d3b3790d5352d77b292270725c3942e3f3722037f0402d0930d227771f6673f347200521314a0a109067360302c04642037401a27f2872c007262b36e0372a1531f2363a2744c3c714
e3572692324763b656283783a5661676016361373430070d0d206257192100b33000080013d6782a04808645004192045733658004473d510260171f772015493226c3064c044063f37a2220c1730f0a45a19131
f5f8cc0f2a02e3e77c197061003a221741214a122683765f0a07a0b7300b66f1e44f0e007175703864f0d3652d6063f62213472324610923e0604a1161b3f06f1d7371c610206561e1063d7332f3193f77c2573c
112693e1145001c54f3f1581861b0f7363d20a176180f62802766342522635f0301d327143754d2446f2771f3c620014093436f0044b3b0652476f1824c3d71d1f35f31778334510436d366493f1732064424538
22475c022566431606327663723f010071e3713a1793634c1914c090270f675013420807e0954328440082013653f040302171e2d1431b632154202c71a1d2380170c3e02e0967c2e4452831f3f70a3a7020f040
e4a3348f3d730326210c1561a7150742c3b54a334540b7722e6222b11f237703242531478285771d4501b4433664b1b439140793e3122247138767187331b30a273760e4133e56b1f6422105727277024700c50a
__music__
0a 536e1265
0e 2f762971
05 2b1d4176
0f 3a7b4318
0d 23412d08
04 4d62032d
06 2a575813
0a 0e5e455f
0e 776b4c06
06 0b300f7d
00 020e3606
09 1e1c4359
0d 745c2c52
0b 29791019
0d 0e414c36
08 5e5c710e
05 3347655c
0a 2a6a180f
02 19305235
0a 10682371
00 1266306a
0f 471c1f71
02 5d3b3e64
0f 19433328
0c 3b322c2b
00 2a0f4204
0c 60107a1e
0f 2a3c4202
09 78784d68
03 52135526
0d 5d0f595a
0d 3522502c
0b 785f6555
01 43161851
06 00005f21
09 123c4162
02 73192614
03 7147513f
01 5a7f4642
05 703f161b
0a 767d676e
0a 1a713f3d
0e 326d002d
09 540a6f50
04 0414621c
05 5a63262b
0a 63307f34
09 37470320
03 146c7c56
04 1643606a
04 3d0d3431
06 741c0671
01 555e5c29
0a 5a052476
00 14410d18
04 38496862
05 684c6623
0d 005f140a
0e 2815366d
01 6c777e0b
06 5a4e6a3e
01 14187033
0f 79360066
02 52382177
