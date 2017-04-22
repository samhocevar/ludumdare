pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
--  the chamber scrolls
--  copyright (c) 2016 sam hocevar <sam@hocevar.net>
image_width, image_height =600,252
facts = {}
big_data = {}
rom = {
[0]=
0xfa82.97d0, 0x1c0b.04fc, 0xfec7.3c16, 0xdef0.b17d, 0xe611.f410, 0x4e58.1b5d,
0x7cae.61c2, 0x805b.3cec, 0xf49e.0031, 0xaaa2.e056, 0xb0d6.c4ba, 0x5402.cfc1,
0x5c0e.f847, 0xab12.459c, 0x618b.7251, 0x4e8e.9ced, 0xfc27.2947, 0xeb5c.3e4f,
0x755a.390a, 0xab01.4a8e, 0xb10d.673e, 0x4530.ed96, 0x2377.f013, 0xf2e6.1507,
0x305f.e5f1, 0x154a.9956, 0x83f5.fa56, 0x7798.d71c, 0x162c.2b9e, 0x54bf.82f1,
0x92e5.6f1a, 0x3297.6bad, 0x62b3.1139, 0x3936.3ace, 0xa4dd.bc31, 0x25dc.7986,
0x3709.55d6, 0x6b28.f51c, 0x439f.f5c6, 0x7509.c561, 0xb2ba.c46f, 0x1cd8.7806,
0xc0e1.b509, 0x1fec.d5c1, 0xec29.380d, 0x8478.0e0f, 0x7a4f.549b, 0x6b44.130d,
0xa456.a92d, 0x5855.5299, 0x4782.20ad, 0x28bc.3b4f, 0xab32.ea38, 0x067b.1cd9,
0x12b7.3b56, 0x9d34.4798, 0xd582.680d, 0xd5f7.55cb, 0x5754.5d39, 0xba1c.daab,
0x7772.aaa2, 0x6da3.898c, 0x6d2d.f32c, 0xaec1.1444, 0xfbbf.3663, 0x6f92.1924,
0xf3b6.b847, 0x51a3.97de, 0x6181.3b3a, 0x623f.bfb0, 0x936b.4344, 0x83f5.706b,
0xb73e.e3a3, 0xb583.837b, 0x2dc4.e666, 0xc6e4.6de3, 0xd409.93f8, 0x478d.6b5a,
0x1708.e703, 0x6bae.aac1, 0x8e74.68d0, 0x65f3.e490, 0x69f3.1b7c, 0x7d6d.cf7f,
0xf8ee.d585, 0x26b3.5ca5, 0x6be6.acc8, 0xd351.786e, 0xa9b0.479b, 0xdf8b.33f1,
0xde24.79e6, 0xf372.ab80, 0x5860.73d8, 0x99fd.d051, 0xfd25.ab87, 0xb424.ac00,
0x4fd7.8ddd, 0x2fb7.2347, 0x4348.fea3, 0x83c7.c105, 0x43bb.c0ff, 0xe699.1781,
0x1ae1.8900, 0x053f.1958, 0xb697.6440, 0x0dc6.ba96, 0x17bc.06c0, 0x5cf0.e6a9,
0xb50b.8fbc, 0x08ca.32e4, 0xac24.6e33, 0x7b39.f2b4, 0x4334.2f9b, 0x8d74.4135,
0x73d6.5be4, 0xfd1f.91c9, 0xcd35.8b35, 0x5e65.88ca, 0x73ec.e941, 0x54aa.cb25,
0x4a2b.06da, 0xce95.98de, 0x4eb7.ac78, 0xb07c.4eeb, 0xf64b.b836, 0x6c23.e7d3,
0xe0d6.d088, 0x8eef.d6a6, 0x6050.4e10, 0xdcee.b84f, 0x2299.ae69, 0x2c09.dd4d,
0xc9fa.cff8, 0x518b.0909, 0x5eb5.31d9, 0x79c5.0579, 0x3877.523b, 0x1c86.8c81,
0x9584.5d04, 0xd34e.3598, 0xf2eb.b18d, 0x50b7.da6e, 0x2836.c30a, 0x0228.972b,
0x5aed.59ae, 0x15cf.2c23, 0xfa5c.99e8, 0x51ce.6a0b, 0xdbae.25ef, 0x07ec.28f6,
0xe09e.4fab, 0xb4a3.baaa, 0xab79.1e27, 0x1196.fdfd, 0x5bc7.3ec9, 0xfe9e.b82d,
0xea7e.47be, 0x83a7.a327, 0xddee.f77b, 0x6db7.d3b9, 0x822f.ada0, 0xd562.2603,
0x198e.46c2, 0x8e37.c92e, 0x8526.5a99, 0x1652.43a7, 0x0b95.81e7, 0x6269.a0d8,
0x02cc.9586, 0xd34a.6ae5, 0xd796.e82e, 0x1b35.0828, 0x03a1.cca2, 0x15bb.b393,
0x8197.2098, 0x3e44.2128, 0xad46.8946, 0x899b.0f37, 0xee05.1588, 0x323e.9952,
0xa3e8.64ac, 0x7ebb.be63, 0x3c83.d4d2, 0x4554.53ed, 0xafb3.c8fc, 0x9ca1.d7f7,
0xdee4.a7e3, 0xf7fa.b4ef, 0xaa2c.0dee, 0x68de.e0fa, 0x1d81.8f70, 0x13aa.a0b4,
0x4dd4.1b40, 0x2b02.db74, 0xb295.54a1, 0x18e4.be0c, 0xa9a9.1945, 0xa2cd.6a4f,
0x1c59.4427, 0x75a4.6c3b, 0x9b92.859a, 0x5fcf.cfb4, 0xc41b.1aab, 0x78d1.5899,
0x0f1d.6317, 0xb7ac.25c7, 0x8ddb.6c2b, 0x887b.5af8, 0x79c2.a54b, 0x5610.b3ac,
0xfdea.3f8f, 0xe926.1a90, 0x2d2b.b687, 0x932d.cee4, 0xfb47.34a0, 0x60f6.2d30,
0xc17c.8b44, 0xe4f3.71da, 0xb478.380b, 0x445b.c9d1, 0xa426.9589, 0xd9d6.ffe8,
0x9ae0.98b1, 0x6d6e.6331, 0x2937.e79e, 0x7aa2.4f0e, 0x44e6.757c, 0x0934.e750,
0x39ca.36b4, 0x0a74.c959, 0x5355.1b8a, 0x51b2.310f, 0x8c4a.c8f1, 0xb5cb.1634,
0x1388.d2a4, 0xa76b.ac54, 0xa2b4.18f3, 0x5623.cf53, 0x3f5b.7ab7, 0x0eb7.a8fc,
0xe497.7840, 0xcc03.f584, 0xf0ef.c04c, 0x3ac1.219c, 0x885a.4484, 0xb411.e945,
0xc8b4.cc75, 0xf93d.3d75, 0xd3c5.f462, 0xb833.6fa7, 0xcc93.fcbb, 0x53d1.edf3,
0xb00d.7a78, 0xba3a.891e, 0x84dd.5250, 0xeb8b.1857, 0x6faa.cccf, 0x7226.6158,
0x5820.1c45, 0x0c75.37f1, 0x5dbc.e2f0, 0xcec8.6d2f, 0xb333.9ba7, 0x4fab.5c6f,
0x3fbe.1468, 0xa46d.44de, 0x27f0.32f7, 0x179e.aba7, 0xfe9e.1593, 0x1ff8.a3f0,
0xc8a3.ef38, 0xbef3.9f7c, 0x521b.f93a, 0x7fea.4118, 0xb583.05cc, 0xb290.fd51,
0xa3a4.786a, 0x8528.9926, 0x9f4f.2759, 0x9f8e.c692, 0x4196.148e, 0x4f88.2035,
0x42b4.06f3, 0x5558.6aa8, 0x46c6.89c9, 0xa397.1797, 0x59c5.37d4, 0xd2be.27f5,
0x4991.6974, 0x878a.b341, 0x9190.e575, 0xd671.72db, 0x997f.7933, 0x38da.5f36,
0x1b73.2af5, 0x316d.4e3d, 0xac4a.bcd1, 0xbfd2.9f1e, 0x5b9d.f656, 0x0c3c.8b44,
0x9423.e9fd, 0xca7d.8f20, 0x0504.fb4e, 0x013b.4008, 0x35f7.382f, 0x6f3b.be32,
0x922d.119f, 0xb231.7016, 0x7b9d.d6fd, 0x3a9f.02e4, 0x8ac2.b213, 0x9fcb.6817,
0xd568.945a, 0x3361.e724, 0x32b2.262c, 0xdb9d.48d5, 0x675f.c6b9, 0x98d1.d99f,
0xa090.a40b, 0xb67d.853f, 0x78fc.d9d1, 0xfab6.a575, 0xbb4b.5d6d, 0xa756.62de,
0xac72.b41f, 0x7356.109a, 0x08df.a3c8, 0x066a.3a91, 0x6232.0bf4, 0x6ac1.084d,
0xc019.e21f, 0x6c46.0d6f, 0xee04.eb95, 0xa7ea.01ce, 0x7bfa.b91e, 0x1ec0.f644,
0xf1f6.261a, 0xba8b.4abd, 0x7726.a3f2, 0xac61.a141, 0xe4ca.1536, 0xc69c.f126,
0x656b.1c95, 0x8afc.f55c, 0x33d0.29b9, 0x358e.bded, 0x5a47.de5b, 0x57d6.1a98,
0x8fc7.9357, 0x1f8f.a347, 0xefbd.ce3f, 0xb5bc.f80f, 0x4586.1dd0, 0x79d5.6bcd,
0x0ff6.6b78, 0x6493.5af0, 0xaa31.36f5, 0x5770.468f, 0xada8.b5e4, 0x6408.33d1,
0xad6a.f629, 0x0d93.ec1d, 0x5584.bba7, 0x30b0.742f, 0xbe7c.338d, 0xf845.1fde,
0x0fc5.caea, 0x6945.6583, 0xb21c.3a41, 0x355d.4ab7, 0xc1b5.c2f5, 0x99a1.95a6,
0x57da.6bbb, 0xe5f9.b726, 0xf44f.ab9b, 0x6088.f771, 0x1f46.ae91, 0x0eac.f2b7,
0xb1a6.3f39, 0x97d2.e490, 0xa8fe.b01c, 0x828a.fe45, 0xeb61.7226, 0x23c3.f86b,
0x8ed3.53e1, 0x2122.ac39, 0x1642.ab91, 0xcf38.ac48, 0x24c2.d6d1, 0x86e9.7f32,
0xe557.f65c, 0x334a.07eb, 0x3876.9aa0, 0xbb3a.64e8, 0x4ef6.9d53, 0x22fd.fad3,
0x172f.cd8d, 0x90d6.b7bd, 0x9500.39fb, 0x5b56.f2d7, 0x5168.de94, 0x18de.84ce,
0x4d70.eafa, 0xc25a.3887, 0x42da.e035, 0xa511.192b, 0x0b52.d213, 0x7c7c.7906,
0xf1e0.e3c2, 0x7554.21f1, 0x4627.0272, 0xfaec.976f, 0xeba5.2908, 0x9abb.7cae,
0xb865.0500, 0xb79b.3f4b, 0xe131.c44e, 0x26c1.3659, 0x1882.cffb, 0xe6de.647c,
0x9769.9192, 0xa9ea.b40b, 0x9df2.183e, 0xc9d7.579e, 0x2265.728a, 0xba2a.dfda,
0xc649.6cd2, 0xf510.d232, 0x90fe.8e94, 0x8682.922c, 0x235e.16f5, 0xa158.4e17,
0xebc4.a6a9, 0x6d42.b514, 0x78f7.fb07, 0x15b4.c382, 0x7c25.e561, 0xc7c6.dbd3,
0x03c2.be5d, 0x3ae7.76d7, 0xe924.7457, 0x6fd9.e973, 0xebbe.5a9a, 0x281b.9de1,
0x772b.29ad, 0x3913.4fb5, 0x9b9d.5a59, 0xf556.19a9, 0xfbdd.70d1, 0x7c7d.6098,
0xa34c.3474, 0x9ffd.7ae1, 0x2d0c.b24b, 0xa6e4.dc7d, 0x1f78.eab0, 0xb830.7e4a,
0x0877.3a35, 0x901c.060e, 0x1291.a372, 0x9edf.621d, 0x5f06.d63b, 0x4f1b.81d0,
0xd762.5c78, 0x9694.c4c2, 0x4666.c92d, 0x207a.beb5, 0xc05d.4f9c, 0x0c2b.6f33,
0xce6b.966c, 0xddea.9a2e, 0x9d9c.23d2, 0x1610.d195, 0xc8ae.9320, 0xdcf5.7b67,
0x7b26.ed92, 0x5d57.d668, 0x329c.65b2, 0x6f2d.ab84, 0x8c04.811d, 0x3479.bb8d,
0x6bc8.5662, 0x67d9.58c8, 0x7ec5.6bad, 0x856f.ee90, 0xd8d5.c958, 0xd918.317c,
0x0139.c6e1, 0xf471.29a8, 0xee5e.144d, 0x5f5b.8eda, 0x6e88.16c1, 0x73e9.5bf6,
0xb20c.7292, 0x0209.633b, 0x62e0.dad1, 0x9c8d.a856, 0xdeb7.bad4, 0x1ad8.70c2,
0xc422.462f, 0x2231.8bea, 0x2527.63df, 0xaeb7.9019, 0x8076.d49d, 0x9f72.9064,
0x9abe.8923, 0x1894.2bdc, 0x3fb0.1324, 0x8704.1978, 0x8bc2.8d41, 0x651b.0a0e,
0xd708.9cf2, 0x8e57.deb2, 0x7c40.ea5b, 0x51c4.d752, 0x3de6.8bca, 0xdcbe.64dc,
0xfa83.2566, 0xbeca.ba8c, 0x0d6d.0869, 0xb6d6.9487, 0x4819.ef32, 0x231f.8b0d,
0x468e.6f56, 0x896c.d560, 0xde7b.ed33, 0xb81d.571a, 0x6f50.7338, 0x7075.4c4a,
0x981c.750f, 0xe065.1227, 0x9606.0ea2, 0x4f96.92d5, 0x453c.5148, 0xb8a5.6e7d,
0x7506.44cf, 0x565d.200d, 0x1c52.7d4d, 0x29b5.5484, 0x72f8.4640, 0x235b.5002,
0xfb06.af4d, 0x7b83.9569, 0x329a.bbc4, 0xfb58.4eb2, 0x51b1.4eb2, 0x5878.7d7d,
0x6e77.23c7, 0x8b66.74cb, 0xc8c1.8703, 0x0daf.9d13, 0xf517.04d7, 0x1f6f.03e0,
0x4713.939a, 0xe653.9f0e, 0x230c.ca01, 0xd765.2bd8, 0xe7ba.fcf4, 0x5ba3.7618,
0x5540.29e5, 0xcc53.2cd4, 0x3941.337d, 0x71a1.1318, 0xa44b.0a44, 0x8e4a.7cdc,
0x4108.feb4, 0xf65c.29a0, 0x4b21.beb9, 0xcd8a.58c7, 0x83fa.d8fe, 0x2a0c.d449,
0x9cff.7f75, 0x0590.5158, 0x7da6.1eeb, 0xcbb4.f410, 0xaafa.befd, 0xce4e.2226,
0x51fa.3199, 0x8d6a.dd12, 0xaaa6.c368, 0xc0d6.fd9c, 0x5d7d.ad04, 0xd17c.56d5,
0x9059.35ca, 0x24e6.5ae6, 0x7b03.d854, 0x6aba.51f1, 0x5125.852e, 0xe782.70bb,
0x8282.ece6, 0xa3d1.e6e8, 0x1ece.7747, 0x7fbd.10d1, 0x1a70.8077, 0x1eab.b9dd,
0xe7b3.c9ab, 0xc372.73e7, 0x860d.ed57, 0xeab2.8a2b, 0x0e2c.dcad, 0x1153.0a77,
0xfff5.f9fc, 0xef27.d5b4, 0xbb6e.c47d, 0x0e23.4e05, 0xda3d.1fe9, 0x12c3.a91a,
0xe583.c644, 0xd873.7540, 0x8d7a.d59c, 0xa6da.ba6e, 0x013b.1600, 0xec66.7bf6,
0xb3cf.647f, 0x81f0.ed1d, 0x4f96.cf5c, 0xa31d.7ea6, 0xfb7a.d8cc, 0x0092.d12e,
0xcf36.fe4b, 0xeefa.53d7, 0x3ae9.8666, 0xf228.54ea, 0x48d4.1c49, 0x674c.0d59,
0x9f05.64b9, 0x991f.9945, 0xc510.4c1a, 0xc799.124e, 0xe7f6.9427, 0x37be.c979,
0x3962.bb82, 0x3d68.63ad, 0x5375.cce7, 0x504e.ec13, 0xf27f.50d5, 0xddb8.1b59,
0x4e55.d2f6, 0x712e.0e03, 0x91ac.7896, 0x11f3.77ea, 0x74f4.5672, 0x9ade.01c0,
0xadc6.b91c, 0xeb69.f1fa, 0xf593.d467, 0xbffd.7d56, 0xfe08.a3ce, 0xf5ab.311b,
0xd9cd.50fe, 0x24c2.8fbc, 0x2064.febf, 0x7da7.470f, 0x8575.eff2, 0xbde9.f6f5,
0xe833.0c91, 0x5222.3ae9, 0xfe29.3c8a, 0x8870.d11f, 0x667e.5b11, 0x136e.0c8b,
0xfe42.f640, 0x2812.5662, 0xbaee.8f51, 0xcd06.e047, 0xbe96.357d, 0x06aa.92b0,
0x0847.d19d, 0xf677.5a5b, 0xe8e2.35f7, 0x1cfd.4c5b, 0x4d69.6330, 0xbb1e.37b3,
0xf641.95f8, 0xaa8a.238c, 0xa294.c19b, 0x630c.b5cc, 0x71c8.70bc, 0x119b.9d0b,
0xef1f.6dac, 0xdd9e.1980, 0xbd20.72fb, 0x1589.27a5, 0x06dc.e945, 0x0ec4.688c,
0xbb57.2d6d, 0x816a.5a70, 0x2958.fffa, 0xf27d.2877, 0x0a99.5bdc, 0xf175.131d,
0x32d1.eb87, 0xb135.b5ac, 0x787d.56ff, 0x089f.cbc8, 0x62c7.9d56, 0xb5b5.a839,
0x9322.a735, 0x23e6.1586, 0xa380.b2fa, 0x0980.63a9, 0x0f23.144a, 0x5ed6.e9ac,
0xbf09.f33a, 0x604b.3e2e, 0x8923.b221, 0x0d4f.c01d, 0x8e9f.c498, 0x2307.a274,
0x3dce.eb4d, 0xe899.d512, 0x14d9.dd8a, 0x26c8.b94d, 0x02fa.5906, 0xa287.1cfc,
0x5405.befd, 0xab8e.faf7, 0x4486.87b7, 0x239b.0ee2, 0x4423.a8a5, 0xa841.2dd9,
0xc123.73d3, 0x4397.9d66, 0xd5f7.607f, 0x7b11.fcd7, 0xd2aa.681d, 0x5931.efb4,
0x1097.935b, 0x55d8.6ba5, 0x1754.4dd9, 0xb7a3.ce38, 0x9251.32ae, 0x21db.3acd,
0x3407.336a, 0xadfa.b546, 0x9d1c.bfb7, 0x0539.3d9d, 0xd9e8.ea2d, 0x0cc4.74c0,
0x668b.e3dd, 0x108e.f4d1, 0x35f5.5913, 0xca00.d5b6, 0xc997.a61e, 0x9a32.9b88,
0x076d.2534, 0xa538.565b, 0x91ef.7713, 0xd60d.1e29, 0xf85c.ea4f, 0xce9d.bf57,
0xa04d.35cd, 0x7f52.2a2a, 0xfd00.8327, 0xfd5c.5237, 0xd1c8.5dba, 0x19b3.b127,
0x4637.b90f, 0x5424.b058, 0x004a.3865, 0x63f7.5210, 0x98b6.8e4c, 0xea43.9d15,
0xa03f.e313, 0x8f46.cf5f, 0x6c58.58cf, 0xda0c.ee88, 0x6a8a.5874, 0xe432.22ac,
0xfe6b.8568, 0xa561.c8f2, 0xbb53.5d79, 0x0ca4.6a8b, 0xa8a5.3885, 0x5330.8d05,
0x4fba.4742, 0x8183.46b4, 0x1a26.9a0c, 0x3792.2414, 0x56fa.5eb1, 0x671d.364d,
0x9b18.27ef, 0xbcf8.d1ea, 0xcde4.0211, 0xcd78.4d47, 0xe6bb.91be, 0x84a8.270d,
0x4c84.c63e, 0xe9dc.a793, 0xfed9.1921, 0x3bf9.9e5d, 0xa419.cbea, 0x19f6.f7d3,
0x4035.a237, 0xec9f.5624, 0x9761.72aa, 0x57f7.1c02, 0x6073.881c, 0xa332.07d5,
0x4790.3107, 0x8652.fc66, 0x389a.c206, 0x4dfb.3e99, 0xef24.e4ac, 0xb850.490e,
0xc733.aac3, 0xd119.d066, 0x53d3.53d4, 0xf580.d181, 0xa190.2354, 0x0094.313c,
0xdfde.aebb, 0xaebd.3893, 0x5d0b.60e7, 0xa840.8da5, 0xef48.86ce, 0xc1a1.05ba,
0x12c7.5b04, 0xc21c.e275, 0xa4e4.f106, 0x3c1d.5bcb, 0xc593.dcc3, 0x0cdf.4341,
0xef12.fb60, 0xebe9.2b8a, 0xa035.d68a, 0xc69a.23b4, 0x0b8e.03c3, 0x8823.f9d0,
0x6127.f20a, 0xb440.8f91, 0x67de.e233, 0x6bd9.94bc, 0xcd49.d6df, 0xe5c5.3427,
0x5b13.b94b, 0x60fb.d735, 0x91b1.d4d5, 0xeec4.f7ff, 0x9d75.958f, 0x96f2.37dd,
0x0e4d.27f5, 0xf5b7.e9d9, 0x4889.2dd6, 0xafd3.d011, 0x4560.c7c7, 0xe675.aced,
0xda69.cb15, 0xfaf5.e745, 0x6591.8546, 0x4709.c948, 0xb0ac.22b8, 0x4c8e.c516,
0x6686.99ec, 0x691a.6aac, 0x4e4f.78e0, 0x5fdb.a29e, 0x2925.6cf0, 0x7ebf.60fe,
0x04f9.c467, 0x3036.be94, 0x9355.a723, 0x75fa.7dc9, 0x281a.8975, 0x36fa.4f34,
0xb775.47d0, 0x9846.3f59, 0xfd6d.2340, 0xad8c.0640, 0xeada.89be, 0x79f6.11e2,
0xeb07.7beb, 0xebb3.1f8f, 0x8f41.dd6c, 0x60ef.28c8, 0x90a9.f966, 0x9f3b.ab05,
0xa7ae.1590, 0xa7d6.1c33, 0x9517.23d3, 0xc7d5.1c1b, 0x983b.e918, 0x4aa4.bed2,
0x8b86.df49, 0x2393.185c, 0x90d0.cb61, 0x3651.a068, 0x13ad.ac05, 0x38d7.d88a,
0xdfec.1e54, 0xa03c.7c45, 0x5842.9ee7, 0xa33b.8383, 0x342a.49ba, 0xf483.701f,
0x7cd7.a8a1, 0xec64.1600, 0x12d5.1e6b, 0x8fc4.35ff, 0x6b4c.7463, 0x96bb.2a86,
0x7678.3f9c, 0x5084.5b9c, 0x990f.d6b7, 0xd63c.3ad6, 0x253f.93c9, 0xeed7.3771,
0x9413.b810, 0x5b16.08af, 0xfeb0.1ea6, 0xec7f.ecdf, 0x5e95.9465, 0x5a0d.327a,
0xfe93.febf, 0x4ea7.3efa, 0xd6ec.8707, 0x8c69.b04d, 0x0c19.7e88, 0x2989.49d5,
0x031d.45f1, 0x8f7a.8774, 0xbd5b.41a0, 0x8608.8875, 0x018c.78c3, 0x5d41.82aa,
0xde6c.a1fc, 0xf875.0fef, 0xc249.f940, 0x8b2c.1c0f, 0x10dc.11f9, 0x37d8.acea,
0x6afb.1ec5, 0xf9fa.ab99, 0x44f8.748f, 0x0f02.7574, 0xf1fd.0e49, 0x7ef4.c727,
0x9e78.03f2, 0x27b3.f932, 0xefc4.cb62, 0x27fb.bc80, 0x6cad.5a8f, 0xb8fe.a761,
0x0f22.2d95, 0x8fd2.3b3d, 0x3b1b.72a1, 0x0e2e.7d9f, 0xd754.7bdc, 0x2265.a26c,
0x3035.a529, 0x04fe.cb3e, 0x7272.5e5c, 0x9d90.ac87, 0x6b87.8d14, 0x8d3f.962d,
0x0f5f.f8de, 0xac8a.afb3, 0x9644.2b2b, 0x00ca.554d, 0x9798.e267, 0x6c8f.b143,
0x7188.b48e, 0xc4a2.93c4, 0xf69f.6e00, 0x0087.01f2, 0x8567.ea26, 0xff66.6661,
0x5bbf.8780, 0x4091.7cc7, 0x73ce.b8f3, 0x5aa3.ec10, 0xceea.cebc, 0x1393.ef3d,
0xf1e9.f772, 0x3352.b68e, 0xe233.0e1c, 0xbce5.462a, 0x4ff5.e7ca, 0xbdc1.fdd0,
0x0ac2.bbe3, 0x3c6e.be67, 0x435d.a6bc, 0xa319.eb9b, 0x0708.e038, 0xded5.c85c,
0x4a7d.3d1b, 0xb068.4eb0, 0x8614.a9e6, 0xb355.234f, 0x5f5f.7c6e, 0x1c4f.0e07,
0xfec7.937f, 0xb874.7f4e, 0x8d72.9486, 0x5dc2.1e31, 0x625c.ebd5, 0xd185.59e2,
0xd1f8.0e4f, 0xcfee.5923, 0x7b2d.2815, 0xc80f.f6b4, 0xca21.d708, 0xe4bb.d393,
0x797e.d9e8, 0xd3b8.3c7c, 0x6ebc.911a, 0x4272.727d, 0x0bec.ebfe, 0x99e4.1b9e,
0x6cd4.fcfd, 0xcc0c.6c0a, 0xcecc.9378, 0x7818.8313, 0x4d87.366a, 0x17de.4e53,
0x1284.2d56, 0xf035.e37d, 0xc0b3.11d6, 0x1f04.7b89, 0xb107.3945, 0x6ba7.c3c2,
0xee7e.c877, 0xc69a.0c88, 0xc8aa.fb9c, 0x4d81.e621, 0x3e80.e971, 0x64f8.f8e0,
0x355c.4d6d, 0x0d34.8c4c, 0xfbc0.1d3d, 0x2935.1c1d, 0xae23.c0fc, 0x3f76.d18b,
0xbf62.5811, 0xd188.f8a7, 0xd3de.5b31, 0xc758.5c27, 0x2f10.d82f, 0xd79c.c53c,
0x39e1.09c9, 0xb9e0.7e1d, 0x6bcb.3dc5, 0xe2e7.e605, 0x651f.c6f1, 0x14a6.e232,
0xb0c0.9956, 0x8baa.d7d5, 0x2388.e806, 0x1d6c.1064, 0x1595.0e1e, 0x8f71.86bf,
0x5067.7fe4, 0xe046.ae87, 0x099c.c234, 0xd4c3.58fd, 0x08e4.ce2e, 0x34fd.5333,
0x0e1f.eb28, 0xcb1e.9f0f, 0xd03d.8e98, 0x9e43.e38f, 0x3d4f.e15f, 0xd0b3.9590,
0x01a7.f213, 0x8a16.3a43, 0xddea.d81f, 0x1fdd.5f7e, 0x21a3.bd0f, 0xbdd4.076a,
0x0fb7.d3b3, 0xca3c.e3b8, 0x1992.201c, 0x3c52.1db1, 0x199a.cf43, 0x51c2.16f9,
0x29a3.2b0b, 0x6943.2db8, 0x2687.16dc, 0x38d5.5873, 0x78c9.e466, 0xa686.49ce,
0x1919.2d3a, 0x9e23.b1f1, 0x8427.6105, 0xa3a5.109a, 0x3b29.d677, 0xdd81.40e5,
0x84e4.6916, 0x11f0.9060, 0xc484.903d, 0xe875.3561, 0x2ebc.3544, 0x7fc7.48a6,
0x0e40.67fc, 0xea6f.b01f, 0xec63.1f72, 0x79ae.716b, 0xbf4c.87c0, 0x80e4.fc9c,
0x58f1.6403, 0x8297.5a20, 0x4742.c10f, 0x953c.078f, 0x7a77.bfd3, 0xdade.e94a,
0x3e48.6c81, 0x13c9.b8e1, 0x8e3b.ea37, 0x8732.531c, 0x0a17.df2f, 0x9633.7c74,
0x95ea.5e75, 0x0326.c4de, 0x5857.586d, 0x81a6.7a9e, 0x4f81.a2b2, 0x0ea9.a6ec,
0x6bb5.6b98, 0x7d90.d1a3, 0x75c6.4710, 0xa20a.1e88, 0x9170.8178, 0xb83f.e8bc,
0x3bf5.a7ac, 0x20e2.9512, 0x9f17.3424, 0x5dc9.fde5, 0x4826.dcb8, 0x16d5.f7f5,
0xe5a5.4931, 0x132c.81a6, 0x27f4.c042, 0xf7f4.b474, 0xd86a.e780, 0x5746.5aa4,
0xeba9.9798, 0xdf4a.8498, 0x7e15.c631, 0x9f0f.dee5, 0x816f.047c, 0xfa83.f8c9,
0x36a9.b1f1, 0x96bd.23ae, 0x9949.ca91, 0xb13e.a187, 0xca1a.5a2e, 0xbca1.b8aa,
0x98a2.69ea, 0x8fbc.6071, 0xf92a.532d, 0xe919.5a07, 0x9e2e.faa3, 0x3f83.c9a6,
0x06af.44fd, 0x8f1a.c690, 0x747b.387f, 0xb090.eee2, 0x3fb0.5bd6, 0xb19c.3713,
0x3a1f.c33b, 0x84a8.4df5, 0x3879.a90c, 0x6d84.8144, 0x6bcf.a0f8, 0x63c9.e8a0,
0x3b08.73a8, 0xbb91.9883, 0x1050.0e1c, 0x9947.de3e, 0xe2fa.cfe5, 0xc6b0.fabd,
0x01e9.5b21, 0xebd2.e487, 0x80cb.7a75, 0xe604.f22c, 0x0409.447c, 0x47e3.ab9d,
0xa8f0.9eb7, 0x5b0c.e2d2, 0xa082.ce06, 0x2e78.987d, 0x1625.fa3b, 0x25b9.434c,
0xdc71.4991, 0x1d2b.47c4, 0x0c23.1343, 0x6f6e.6647, 0xc07f.6ea0, 0xd0f1.a197,
0x3c9b.de4f, 0x00a2.d304, 0xf89d.1eea, 0xe2a9.9616, 0xb172.9ed8, 0xeed6.0001,
0x00a3.cbc0, 0x8078.2642, 0xdd13.877c, 0x3611.e4e4, 0xc43a.c3a3, 0x6a95.4eaa,
0x77a2.f113, 0x4084.a7cc, 0x63c8.4a92, 0xaf0f.0535, 0x7b34.c45e, 0x88cf.ed73,
0xc4aa.d1d1, 0x5fb9.f880, 0x2908.dcd7, 0x9f5d.9932, 0xf583.1d2b, 0xd402.9c03,
0x9a77.5a60, 0xc3be.0af9, 0x8874.eb69, 0x6b8e.04f2, 0x475a.f238, 0x0f55.ba30,
0x3be3.cbbe, 0xbb2c.2523, 0xacb4.42a1, 0xaa34.9cb4, 0xa9ed.229b, 0xea34.0a84,
0xd784.2173, 0x92ea.c89c, 0x9d21.fafe, 0xfb7b.fdc2, 0x9d90.d6de, 0x0383.ddd9,
0x4f12.9e71, 0xa9e4.4841, 0xaf1c.eed7, 0xc74e.f471, 0x1773.bcd1, 0x3870.fefe,
0xba4a.b184, 0x63f4.5987, 0x693c.f199, 0xc342.3a72, 0x4194.bb03, 0xd60e.4ffd,
0x521e.1d1f, 0x4032.754c, 0x27f4.ffe8, 0x7769.c188, 0x085a.b7cd, 0x0622.74bd,
0xd0ae.16a5, 0x3691.78e2, 0x05e1.4e8c, 0xe8d5.d046, 0xc9df.6308, 0x6eb7.5be3,
0x44d3.7319, 0x1938.8f4b, 0xa6f9.7af2, 0x8b7a.f31c, 0x7476.dcef, 0x993d.d49a,
0xb74d.c6eb, 0x3d4f.7586, 0xd561.d0d6, 0x16c9.72d7, 0xb611.6d78, 0x0fc1.227e,
0x57f1.72c6, 0xf0b8.d218, 0xfd93.152d, 0x7e00.14bb, 0x1908.68f0, 0x608a.23d0,
0x41df.bfc8, 0x1d29.060e, 0x1c83.b3c2, 0x4fa7.ad82, 0xdf6f.eb07, 0x8487.0d1b,
0x143a.7d90, 0x03ca.7ad8, 0xd203.8301, 0x768c.43e3, 0x3922.e794, 0xe88f.e820,
0x6268.38bd, 0x8358.8f75, 0x1798.f355, 0x0464.8c7a, 0x380f.5a80, 0x75d6.6a4c,
0x9813.e8a1, 0x3a79.fe3b, 0x0c91.4f21, 0xff6e.3bd9, 0x9eac.9a7d, 0xd3d3.9c12,
0xf90b.be53, 0xb871.1550, 0xd1e1.e34e, 0xa82b.e788, 0xf85d.717f, 0xd90e.01b0,
0x3b7c.7bc1, 0x0dbd.53d8, 0x11e3.189e, 0x1101.92b3, 0x4f21.dcc3, 0x1dc7.d083,
0xcfd9.0f36, 0x8964.701f, 0x876a.118c, 0x3e87.8653, 0xbc79.e47b, 0x8a4f.ac20,
0x11b0.d2c1, 0x7b21.381f, 0x8536.f27a, 0x0621.58f2, 0x4fef.2d56, 0x8286.af29,
0xb16d.b29e, 0xa51c.06e4, 0x9f72.c1ae, 0x82f1.33c2, 0xb4fd.fa7e, 0xffbe.0779,
0x1963.2f18, 0x4c03.80de, 0x39d1.2458, 0xac21.3846, 0x0b51.36f0, 0xf0fa.d37b,
0x7b83.a290, 0x4764.03f5, 0x3997.52eb, 0xc344.53a8, 0x4609.c4b9, 0x6584.23ef,
0x2164.0923, 0x980e.c426, 0x773d.45af, 0xaab8.78f8, 0xf270.129c, 0x8746.b1d6,
0xb2a7.b14e, 0x0eb1.b21a, 0x47a0.3c25, 0x3afb.4880, 0x527b.1faa, 0x7953.a14e,
0x48c0.923c, 0x08f9.7426, 0xcc68.a6c9, 0x8277.f0c6, 0x5dde.0455, 0xf55b.ab8a,
0x97d5.89b7, 0x8d58.1610, 0x4d26.5428, 0x9eae.c97c, 0x5f97.8f6c, 0x0c11.351c,
0x764e.52f0, 0x6081.1ce7, 0xc9b1.e721, 0x9b8e.d73f, 0x208e.7787, 0xf863.c3ac,
0x48c2.b041, 0x145a.0448, 0x6b19.d05c, 0x6887.81fe, 0xd983.88e3, 0xc4cd.1393,
0x547e.9479, 0xd16e.3e1f, 0xbcb0.83b8, 0x4dcc.deb5, 0x21c5.383e, 0x9475.c03a,
0x0acc.466d, 0x7b15.b9de, 0x9ee4.f2c6, 0xafac.1f08, 0x4312.9d92, 0xc780.f7f6,
0x7980.23a3, 0x7825.b318, 0xff42.e238, 0xc824.96e3, 0x47e9.c338, 0xc318.a971,
0xa890.0732, 0x94f1.7d0b, 0xc233.f832, 0x7c2b.243f, 0x13fa.129b, 0x67e9.930e,
0x1629.eeeb, 0xa721.9cb9, 0x75d6.a2c6, 0x4dc6.3758, 0x460b.4798, 0x3911.e928,
0x0621.93b2, 0x3663.a3c5, 0xec26.adb4, 0x7a80.7699, 0x7b86.6205, 0x2e42.9d04,
0x90f4.693a, 0x650f.e71c, 0x63f7.a65c, 0x59bb.3b15, 0xc7a9.582e, 0xa51f.78fe,
0xcc43.f586, 0x0d15.70e7, 0x0d85.c0e0, 0xa477.160e, 0x1e3e.df03, 0x8991.3bc1,
0xf870.aa2a, 0x82dc.3241, 0x3f56.f7ab, 0xef8a.ff20, 0xa1bd.0910, 0xc8b6.b889,
0x71fc.4752, 0x61e1.b622, 0x1e1d.d30b, 0xe2c7.66a7, 0x6909.cc5d, 0xf7c5.d8b6,
0xbf6c.c2fb, 0xbe9a.ab25, 0xc2da.9380, 0xe9d0.e98e, 0xf874.4795, 0x4491.608f,
0xb38b.ece9, 0x4320.2fb3, 0x4309.d85e, 0x7c2a.f16d, 0xb742.272d, 0x5846.8fc7,
0xeb21.cf9f, 0x1d09.fd5a, 0x5d22.b114, 0xa0f1.efc1, 0x80b6.ac47, 0x9043.171f,
0x05f8.12a0, 0x9149.5c1a, 0x60fe.b76b, 0x7861.2ebd, 0x8296.2473, 0x66c4.3545,
0x6c86.5e48, 0x5d0c.63ff, 0x8a91.cb78, 0x1c93.5788, 0x608f.90e1, 0x7718.f448,
0x3f56.f6b5, 0x983f.d21e, 0x7898.f79f, 0xeaf1.ab7b, 0x16e3.e9ea, 0xef3f.1a40,
0x02a4.e8b1, 0x655a.ea4d, 0x9100.c756, 0x7473.20f0, 0xe75d.7488, 0xc51f.2887,
0xb11d.de01, 0xa23a.7d0b, 0x39a2.0a88, 0x8a79.c386, 0xb7ed.f964, 0x02fd.ac51,
0xfe77.5b0f, 0xf4aa.215f, 0x.00b5,
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
    local first = i + offset/4
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
    local h = reverse[shl(band(self.b,0x.00ff),16)]
    local l = reverse[shl(band(self.b,0x.ff),8)]
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
  big_data = { [0] = {}, {} }
    u32_to_memory(0x4300, rom, 0x1b00, 0)
    local tmp = inflate(0x0000)
    u32_to_memory(0x0000, tmp, 0x4300)
    for n=0x10c0,#tmp do
      big_data[0][n-0x10c0] = tmp[n]
    end
  music(0,0,1)
  for n=0,#big_data[0]-1 do
    local off = n - 1
    if n % (image_width / 8) == 0 then off += image_width / 8 end
    big_data[1][n] = shl(big_data[0][n],4) + band(shr(big_data[0][off],28),0x.000f)
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
  local lines = 128
  local dst = 0x6000
  local dstwidth = 0x80
  local srcwidth = image_width
  mouse_x, mouse_y = (flr(world_x + rnd(mouse_shake)) + image_width - 64) % image_width, flr((world_y + rnd(mouse_shake)) * 126 / image_height)
  blit_bigpic(lines, dst, dstwidth, big_data, srcwidth, mouse_x, mouse_y)
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
87c9dedbf5c63295696e74aa5cacda6f657b4d35aed7857e285282bdf2e636af1aa10fad96033d4a06ace0194533436877367aab121581bb2a33710f848d9dea
928771e72f38bde5ee81d50849d608e96c430995850c606e176ce575f351099d9c882b2151595634e2b520a6aa03665612b0059c7eb37ecdb1732814a8accef3
6ca5733359419c80ed8f5c77ecd37ecdb11c259ef5d967bf76f3f7be5c7bccf6f3d7be7cf3d71d975fda28d22bde3d2dbd5afaffcccf6b776f3fbdf557e5df95
1c619f6f63ff59ecc592df4f3d7e8def3db24ffeba9d7decd6f62df5a3ecf9fb8abdffce5c2df4f7ef2e7af3f719e91d71e7a95e0ff8ff5c73ff3bf3fff2eae0
5e7bf36afb75ebef9e59f1be6fb7f92d39f61df74f0edcfaeb8871edcb2e24d2dfbdf727befafadfdbff9ef319fdeb4ce2eb8f47fe7e5a2d78f5f2df8f3cb2f3
dfaff47fe76f1e59f0fbaf3dfafb94c38e58f3e29b7055af4f5a163f0eff8f73ff2ce6ff569eff2ad41f8fdcf2e3cfafdefadbd5afcf3cfa3e1c79870cf617bd
adff0f7fef5cfdaf3af3df1a3bdf725afba33a73e78f75f1e78f5ff4fb6f7576f906b7c38fa1e58cd6fffbdf39f6ddafcefefffcfd27e9afa93f8f34df72f3a0
adf3cfb37cffcefeef4fb67c9dd46c7f5eee4dd6ffeef2ef1efbeff2ff3cf3ff7a31e5e37bdffdff4ffdbf82cf5e5bfd77f9bf744660f2e4ad027dadffadf9ff
39f73ef8eee307e9af3bdb2d78f6767bfd38c9b0bdf7d32f2afdff4facf367fdc4f6df03bbd3d6db75cbdfff2f77ffbffbdff3ef74ff2ff384f99f49fd99119c
49defba30fedbf74ffdefb5ffb7afcc78f6e8fbbe6fe17faa0ad1daf74fdffb3ff7ef7cff593f4df171cb372208f38ff6ef6ff9ff79f7fff2cd71fbc737cfda3
17bffb9fb8ffcb5f7dfdab5327f9bf2fd481079e7ef6596f8a3e0b069de7fa0e81eff9be78f3e79e0ff9dfb39bf83ad4ef8eacdb71f63d62f9eed78f61f6f080
58d78286b78f8c21639b24e80efb39defa49e6fcabdfde7b8f432e0a986cfce549eff40d056bd7acbdffce343bdf794b1e7558fdc4b3069e1db39c79d751b119
3d8f994ffb433d1ff7876f269e6f7ef5b2d79f5fdbb2cbdfd9bdabd307cc0bdf78f5e9de1ccdfbc739ec81eff332dfd51a78547efe7bddaabcbcbc6efdcd3bce
086b33ffe956bfbd4f1c6efd33d6f7586b5df7fc4bdfe5579f53df7fc2bdfb6b77569dcfb76bde7faa7f77b4bc8f7fc6bdfecb05a7daabc8f7fc2bdfdfddb25a
5ef6cb240fe917bfe118765149f5976adef58ddaecd73fbf476ff7a5d76adebafa55f679ef6d5976dde98cfb07bff2a4fccbd318b79e675ad75e95f8f16a737f
b7bdfcc7cfbc86fc1cfb0bdcc3c449a43e3eadeded54cfcdde4fdcced5f63e7db23b7708e3efa89d11ab27b977133f83587fbc6f8f842f1d7bf63c76f506bfb2
a00ea8ef6cffdcebd79eacede9e6f756feac51ade18fe20bdfe96708f8eb4ab5e506b73fe6ae3fe9e6f7b7fe26bd33b3ede9e8f98fd4e86172570ea8c9d7afc5
df4eb0e6fa7ac8effbd52ee0c5c6b76d0ee17f3e6377df226008f866dccede9ce2e24af796e80ef9d2848fffe506179de2bd56bbc679de2bd56bbc679de2bd56
bbc679de2bd56bbc679de2bd56bbc679de2bd56bbc679de2bd56bbc679de2bd56bbc6fb1a65eb9ffe7df6cfff8ffd73ebaf5bfb1f73ff6cb8f245e589b71ac3f
75a43f5a9b259b4f795e2fcc00b45a6eb8d871f6cb84bf89f2fb02f8f6c59b159b1f591f7373b8795a7dacfdcfbe9b72373a9b7a3ff7d3ff9ccff5dc3d3a9bfb
c2df5e58e44e54edc31ad2c5ee3e27f179bf8bcd7c5ee3e27f179bf8bcd7c5ee3e27f179bf8bcd7c5ee3e27f179bf8f7517f1fecb3fe4fe57e6feeb3dbedeeed
f66b5fa7fe4c1ebe12f7efbf94cfecb3fb1efcfb04bf54fe57265b7f3af11afafe4fe7b2d78edbe1b0ba83e4ed98f73d72b66f6fb8edf8ed9e190b0cae7b34a6
7b70965258d2e8b72de7b2d3bc7be1475fb0257dbebbfb1ee0de0120022f790dcf4b5410d3baf38a997a2cfda32b77485df2e73ad19d504264086481c8c7a7db
4a7fa76edac44361a62fed9ae15776787f28d22320d0994f37ac18c555f8055cfb1345483284592b36f96c8c2fe09d26cfaf49d258074540cc54a1561417b822
3f47cfca3081475055df66c3a29e98e069afb507a6e57a130fd1c8987eee28185acba7af450694411944b059b9ae3f2a7ccfe0b76f7df731ca81451372e79f5f
466165ab7a422ad71489a0f10966de7092b559671306fecf2e9978911fd0977d0ae916ca380054d5c92f15fa7cfeeb31fb33b67fb7ca526051e3b4ff9d2a9b3c
718daf91e380aaf847882f9e42993d48f119c85615670e2194d93f15fa3855c3b5097b3ce6f0f73c7e039061861abfbf554be5fc1fd01e407d0ca53169cfe983
06ff27edeb983db3feec4ca46f84bb4e370fc53c2107d47dbf3bde69ec5ac0623bde993c723a3b95ecc5f84851fbb7eeb314ac8dece03da7e4958c98f7ebd78b
d4e416471e3101b60643b8b506fee7e937fd1625eced0664fcb2b0617dc04b668c320762f9dc982cda05ca9cec5ecddab7137e1f7ede03f86027f2e3ecddd92c
7ab8ad40b6ed5d8d69a5849279f6db13d07e50e188cd867cf765d860a612c6b21d97e781116d47f3bc8e3ff428f93bb6e4e69261ae12612b911c978d672bd14c
6894ae34c6206117cab6095631fad117cc7ec70d4a6ee1917766abd07f2c9e2b2650511b48d52e9fed4a64218d1e63d222132dad139120ff3663196b49995066
641d137e071b61465a42b7b96ab97db73d85912239e5a49cc8fbb8e5cd1ef3bb399698e221dc7dd123e4b0c6e3f2fb6421632458fc34a672817f798edc4119eb
e46f331f5c928a6717893b5522a094a6bd94c229c8280fb40ee37922b4fd550ec166e64ddf22c2357c8f87a0b20aa90f94cef776febee03454ed1997a978d813
6458dc06a0c9770990d9b1bb86d146cc186c31414b3354a5d34e585cf25c317057d386a73c502ec2e21366df388b5a26e41906904373902bfa6a4b62e7cde61e
0f2bb2e116a8c02e9cb7df1d4a373db948a25574c39e30fcf6816adc1fb3c9c498720391c506b54913143da8a030b37e7517867739d4d62c0764bfd947039c40
01ee09dfca18d0bf47b2c1f359693862acd31acb6c085254593837a1b3bad9944477629b9e94caa8155ecf4fb71c3390b01988c1574ae88a08e4a1434036d6cc
0176f0181d67c482db35c259940b620ba24f543eb7e87ad81b31a1445a0822fde01758dec38518196d5ca701bb82a0514314925c1ef41d88a507216729b07668
c2a2d01043eec9c0b623da02f2da90d6742fe27f5fd9c56865474098f50228266554f6d2482171de37a5b8d2c1fd4c8e996333bac1cac93d2e4912ff9d6601c9
16842233c91f0c2e17f3439c32c5cc361d88c269721e7b3866a1ba9c2d37595b361656ecffe6edac663c03ba5ccec8b50e447e91f48a8341fe818a2033ee5e84
41f8c73b2c2f5b6239153de27a3a9365c2ba3f70387f66b8e1f247cf710f85b390f1d91d4dc2a1ac2ba1726ebb0b2dc3d5cad67d8926fc539432ba3f07dc6416
c205b9608fdb0ed8916798680985300d86ca9f5c0ba0575ef4285c76d675c993ad851f38e5ae5a380e934b288ecf32b7fe222b2238d91d3695451c8b74f980b4
f757e92f7c74e47061ba70697bb9fc1077c6a1b1ec81bbee4a360cea4d027cbac49465657ea6576c7b7ce4297333c2bfcb3a6a98ca8db107d28c6cccb36cc077
3531c73811eee9f74762a7433658944c77de8d1fe50bd99d2ec5774cb7c4b4fb1717d4413f002e5d39066385eb3ca2fab2f721cad537c22ffc474c8d5eede1b8
58f8afc5ffe436c9a055660dd93382379cb371d85cb758bc916c69138e166095dd460a561699f1e6cbaa6fb36e3ed0ca4401cead6b3e63c3163024786d4aae10
05ce8ec9bb94534a3162fe80e221a8b99debcf94235c37bcb4a44c68a46f84b816d81b2f5aad5351658689817851bcc3dbd58564e06cad4ee8af7b20344adc12
ac8c61eadfc73baee9d62098170d7ed4eae81f2983ea575ecf9705c4bcf023f6336386e9f0c05c9c0b0ef750293278cc13a171dc89c0dacc1fee075570390019
dcee32bf926ec8ba8b87ebdec91c28149cb70e0e6279c88f4baf96d4d7a7b17f4692b2fd1659785ea516fa092d295a5c3b1464f721948bead8d3e1fca3a11554
9a0bd92056adf886ae4105f2d95edd937742ce9d05d967a3b1c2f33fc4e855ae3fc572f6ca0391fa90a57139aab24b4b44446e46b44a1671ab86fb5e1a3af759
b5adbb94e9b0bb275677e683a1bd38f179dcc0aca47c24bf85fd8582d28682bb8c3b09a9cc5329284d0210b67252519be5a22d160d4f72192ddad0184ec85189
65a5d56b13b4a1784169d22d06d76065e71db72094e82fcacf2265b8b893d09ee7332431c5c1a894001b32e8e06d7af65da1776a29d953b031eb81b5c13fb59c
8bb2fdc86c4a793951f1752331ba2285eb565ebe468931469b668b4e0823ad337c72f03b813176a97cc890ea1f52971f6ebb625c0093719f927c8b8c9efb73d7
55e8aca20b903f3b0c2b1648dd18d7c9253749399a2f8b278023cb8d17930c2b4aa0165e4b56ec08821c1a331661b7a68fab99ab1c4c47eb8e41d45851449623
96d813274ffe2ba956009c0d23d2e4f9e94515b1be970292817f802d23384c4a97b99aecd76d0716a1c23aba0ceb6ebdfd370b66cf084271764636d83fec46e9
6911b1fa7b0c147c31d4d633c9a933bf1c5c05510ca13656e7f1fa96dcaf91e88b2cc2aab8eec4959faf834455572a75afdb137ee6bde0e07cf95bffadcfc3c2
f5b848628998c4c8a54550c95f35c18511fa529174533ee3d8f13f5bf53dcec0ecddd071c9cb4f9d4659f113d565e21b22d5d588991c515839c9ddc4b7330bc4
c193d6de08509634c2394750fc68a2539397c14641565673595dc6dcd1513d06ce2a0bca3da960b43524665bb365f09e5c9697df2a0c2751c173a0d8c409514a
5aea7e3a5b491453e8166385ad73cff39314cdcde4b4449185b9ea7083f8e8337b3918666bd02fab27cddf371f230ba8042f72e8d8d7311694063c0ba8757ade
cb715625779461a72628e7ee387239273d353fc96a9a3eca2ac0ba7e435c862a35fb00d2e7742c0b20d4902f6480c2219bb61ee9be86a9134eaf0711656228a4
b79ea79a8ccbdf752ca299ab0b2e240b0d859540b2b71dfa92bdbfa647223bd339a862ef30f7cf377a3b2f3d7aa8959e3de6698fc74a4f30ecb125fc7a5e6ad5
c13e6ce82acaf7f04bcb12efdd0aa8b049d7e2b2bfba31149fe2b27801f9fe3716526efb4ec1a55c90d46abd3b0c23718f68d39b2607733b0dc7720dcaa26979
7a0ba9a678e4c90656393d595539fea3cf940b21db0493237403d9554331fa92dc56549ee4c66a594b0bfb325cd639eb3f020944fe4fc482c718fcc4d36b90dd
d5d594adcaa6ac0327ec96e0590b4bca299682660a531f80c60546ed19af7fe9173e6a0e36581ab0618f9297566bf83f35f5e674739c7fd7ea66a3eae327682c
c4e9b93a56e287775759445ccb213863ba099d8651c67a2da4ce4f7b28272e273db5198d29fd9b04e0262ebc4199bf7c5656b6c09e70e890430bc82a3f955292
ed9d965af9a50b992ba0c61c729cf97d8cd28670210ed4178a36aaa027bb84b9a6c23ab2324e268592b23fb95655ce4e39137cd3b2c266594663b44d234aa366
62c1c8bef847af93f58ad9542f9697835939d9372f56e4e4282dc0b2fd469818c94c1b320bcaca4ba0dfcbe5aeb3e38cdc60bca5bbbaa6c7e07755e6460c749e
be789e74506b34628c09f57a2c2577d605d4b6358551e114427f5a820659be2526e81f280b217d0e33b59c567daee42035c3154515e8f6a7a47ae96113f3dfb7
e5b02dcc9384368828320ee842adfd0451fafc95f8f6f4c9c336f04e2c0bccee2176b2c76b37e6d9db9332e4664584407d4185678cb91b56682c96ca489406d5
6ae33983d9a4c67cd1fcf3b2ca4c2c277779ac4229245b3e50c2c2cf945ae92aa46aa4b2a4db2dc4d22df91c45659a0bc55c8165e67ac8bc7785d3bc0689bf53
25b9e8cc8c79a7e47a7892a61f447e54cc713d4932da9985915a768e9b7295dd49a35d1b37d3ba11acebc976c00b0ceec3a47ecf20553f8778b820a99995901f
22c53dd6035231465756d77546c1c81678345b7c4e896c44642f3a8e8e21bca8f36ceb5c2ca429289a7c3f4653ea898c9a43c46e5e68f0547604b3aa4125ff0e
21bc939d06c5277e4e3d18112ac34f284753a8b11e9b435cc03917d59ab3d9cf96364a43870bda45a2f24bb361f8f9958c13995983425b83bbce0384234cc938
5b8f2764b1c970b233e9a3ba4235bebc50fb94e8593b980da988a2b14281c459a8edcd0bcb02cba42cb22d8a2207859f549b9b1b14106ebbc049a96ffd1f0515
616a378b3586566097d3af4b74a67f939691bdf2810f6a2aa175490327c721671ebf561e6363c6e4a4735139d080c516549907ac13357dc1d2b272c3d9aca86b
8ee28f94ef5f4dc0354aec319c8dbdb096934a45035180883ace06c6ffe1fba9959b9195e93e0ccc148bc1c5461d81d9027fb9986223cb623b2cb651f71b3959
65634eccd375cecd7a18a0477e51693526249b046ffa613ab119abc81e9e6c39682c4c9c10daf784ff549e80950cac1047e3c2bfff0b21589c2d2ab0b29c2bac
a78c06cc60725cb0ebeab846a618f5d25744fb9bbfef95ff2ad16f95b59b254c4565e849ccfb8431d99185953fb4a8955afed028672168940b0a76f30b1128dd
83a43bae2673e5cbf77eadd58e561a3678d890dc47e38520d2778588a07c2ccf8f69eead98ad7a40c02b313cd3fe2b6ce03963cac672db0986d22a33c2487c99
024d9d30445c1975ea3e546389d570da4a6226a4979c1745a4d17cf59abbb24656915a2fa823e1eb84753e69015a177409856a9ff8b7085fbe9a2b8af517ac72
38b3dfcd90e1ac052b8a4744ba45a39640436d2c4c9bb6ca5f6f44b4326557a536cb2f63864d5cf34586eeb9c42b6361f1a1db54628a03f6acad0524eda8f670
808556172ad88d5e393d6adf8f980b2b8a878eb6bf95541ee4e46ee8e44f39ff337f39c8cceadf27b7a705a66c049046cc6d6e486aeeb25b4456550edb1f22d9
19a07ba69ac47671f1a236685b3db12755d488b05369a3c2ca5dc48b191569d21fd41718e8756cb31e1dd1d458cd4169013efd1f3c1979a4bcf02d1113822fa5
94036e5ac88b2dcf7ce9967d6546413501ebfdea25b75ce9a95204b2fc1bfbd445a8de44f6f1ac715b458d76da668f4060e4ebec7580a4a80c9e1bd2d24bd1f4
01ad6e0bae5afc6e961065628ca28f853117a546ae7c284f1b3651ecc0a92b2a65e93a89f2ac146e6b4c1d0a72f11f04fa9f989161b916365df98b0f62324b22
459686423cfb34a21190d458597a5596b3aca2265958418d74a1c86acaca0bc1572b932c54c4e1b9967451d85785651bdb0309165736f720ca0c4cfa310652e4
4cd28ac7b0a4dee49b4f2c85e4f4c8ff3c49652e2f20ca29a8acde3936886c3381b24310bb4475e2bac6633643588c77a0829e68f84eb692ac3b2285dd5d94ca
4e312ffc4645562684ef9b09af4f855c4d3072625ac94c9566179d181138f49c77575ef81ca0a0e0e4c40d980123d759f50d3dc9f2d9a2e21955c6659203da6b
2b2f3b05c9f8b42ffcafe0aa4fa25ca49227ccf81391450d2980b8f17f23668ce9e355615a06e65d128c1cac70ee6d7d891df2b3e35418d85b9cb1ec6c92d786
859c99682e6538cd96c9d0654e4d7020715953f313731d558d315516e12113b464959e8a820b2d99d802f3c1a5d5506e0b43e87bcaa827d74e607eb1f5e8493c
ac0caeeae4b507feae8d585eb35a41c1a45ad92a2175ed3890a2cae9aea8f375916e4c59185e6e1e9145946bc13e4cf9957659fd8a25ca9a81f78db088becc6c
9c1f83b2fa39944c66226183567238a87ff67cd36c322125935f4095af82ced970b25959932f4c905dd66d3cfc609365967b94453e4a04840790ba44d57a3343
7c9e572cd3985abbe55c6c433e6489d3f49e3cc69aaa2d65dea903141a8a77ae5fca93a9f8ee98f0b902daa8b773f367a869690f9c69af2d07d7ca7c8d06c945
c20b85741622ab2bea3d6251e8eac0b244e07e8ea270bc7db3219545d94c9db33a2b617db851956b1f0682ebfdd11131313cbf96b8237f3284c49af87cb3760e
bcb765b57d950f7c835291df4291b806c71be1c4aca8302526541775ad13331ce58e8e3d51b19a9d2455c2b2726aa4d8e2f0925a5c60a161486a20b2358bf0ce
47a8397e9d160327aedaa7245f4c7097f451b5a4c7562abd6b373237ce8f675f85d5f826bf6bde89c9394939f9ef9087d745eaa3ec8a2237264959af927c2ea0
1596c51db20169baca8c8be2b66873c1b733a6273803fdea12c2764451a0bae65ce7d04595141d3efe7e2099c0a294c3ab8d9452bef7462514544abcc1c71539
0c270dafaebac68f9db07a989c961b8eec5c5c2e730b237254af5c042c73f37eb236722ca4d00bd95151b0669482903a2b595d2d6769556d605c80b1e1a77eab
c2b1b69f6f41917f49b861c7eee40e8fa2981aa848454ca268f757dbcb312c70d6fb0a1e3e904d91ea7fc4915491852e340f0278a294951f4ab93d094d463faf
2045aca27d3b84e78e5aab9feeab76abd9b004528aa91585c75c89b19cb56511b06b07530eb1f6eed911ba7fab67dc9661695340b34e85458e4a0ba540f952af
1646575fa23b2b3ad88d0618fba42b32f839bb46945036caa223e7786c003453ca9995dbaebe2a179e3a185190ca2296d9ae5303ddc59f6c77a04428a28c3a2e
31ab4898d521297e97d5a62b3d4eae5dd6725df22d51abb349ec59b8af5975256b54156059600a1f4d1cf2b63867f4d35b3475855cd5a8e338aaedc33172eeeb
0e67ca0455a55640ba647d9b9680f340ba036b9b75fa0061d35dd1e47ff03d859e9ab0d2b21a4332b2ca4e563a14b05de0fc3854fee350baea79d07f27721940
f9355998dc1ca28cc7ff9d291651a909f263ac27565cca474aea4ef313b0ca005991205159a3e9951414a4eb6c2486bd3ecacf5c1febc0b1d0ffd87c3ce6a94c
a9448cde9552f1babd8dc31265b9ccaa36859f68599016c813a3364565751c877c6a3b2f5390c8d8597a9d1fc88b261f71036ae4959656165ec5690112a5dd4f
92bca2a4fd75e823319429bbc83b2ad190cae03b2b5a11b302a185cee50ca4a3739ca07253becac4465711549bcaae8e0354a3595c6bf97651d256bf45e279b3
d1bfbd2d2d2e28eaa29c2bac1a21304393503ba23bd06365bbd0fd5f75236c0bfddca0b8d63d56539da07a2aa8d8106f4344fb09ea859541a0e2658e8cb315e7
e3cc4f901953480c8078a64718c7d53c2130b451893456c0031785d223bad6f2016e8f7bd66c0717621b915db7aeeaa7e8fba922ca8a8e92b5b503175d4c8047
a9ea4fcbe22f7fd46bbc8b383935342af0e23f2229e03c0b1babd5be463677fdccd5b2aacccbb9a6f5c1733ba501f7523026aca44451b9c96a7eaea268ea2dc9
5792f0b01ffe9e9d9d95187c2b93966ec04f4392e959517c3851e0a0b24df7ac9387db584f7462f3ac523d7949490f94b0b0a57a2e5fb4b8e7ec755898d8000e
8b1ca61bd5952ed9675575181d59dea93123cea6a26947bee5a53e850f57f1c12a428fbf91589cc1dc8b2e2850a39bd463fa98767652af74779065b9e3db28f9
946dfbf8182eecacc975a21397f2fa15ac8fa2356fc85bc4b06514561d8ea69495d2e2d6b390a999c494b7aacaa1a5a86e177c16525ff81db949aae7eba62f25
b8b2926654170477b766650bb389e09fb2a3a4a4d3889162a3367585ebd209a0c2e31b3c47a4532376a5edd156c4036b1e28a54584f94446a22f1cd563fb544f
04575ee4744fc9bcd4161addee66bd2c2b2b2f30b3f387601697a4ac2e2bee359fbe7e0221faf548516d14a46560a5462842c22a596aa3eea6d4b371ee9c4648
80c22741619fef89f5f0578f1da96385d2c2ae1829bd9547855a389768591716dda354c1dd8cc95c505ff85e475b0f76b7d5f9f834b7d8ef7605957750f5d099
e8149940b698d342b36f5461619b77e830217959d26b4ab84644c484563d94c1316654e68ce1a9871c4f1585d2454a27ee1c8f1caac5ede0dd1e92b63825c010
ba6bf52988412c26a4e76a446f85c2242a0259d5291951f4044ce55ab5f9fa8f3eca6a9d02fda8fa203eb2379a4a2cb472d229c8ea4efc05ff8b586f423ca2b8
a475e9898a6485d20604148a2c29e49558546389aea8da068ae0b4ceb27ba28c87f0cf78dd6bd195526c60db64bb13f85e425fb88eaa22628cd3f50ca9eeac20
cf69d81b22eb01ac7b8a62737627223f633cac040265d52b37926f1ec2d22587b412a9d8fac2b2732541d513e13b0742beb823d394fc4bca0949e848eb8473ee
65a15b21f13d54859f03d68ba26fae489ad516fa596176c9b6fccb24246af592bacc3f2764d99ae35d51739a9bb0ba847a33d5d59d6c3592256119a5f726a47c
39f4d1fad7b8c99c8fe6d423188b23f2316c9418d0e4165c5e94285413934064ca0dad95d595da411d27bb71d83c2ccd5ab60592b244bfacaa32cacd9328cad0
23ea8dfa158911d5fe03c2616519cacde05b35314fea59ae23a139e31fc1e64e950aba94d88590ca2bff273c32a50d5196dc77b8e765853161e68508eaeac29a
21547b9836052caadaca6133caa7ec45d56d60934e7f979ff547d7eade9fc9c59f95fbe500b2545ba4e8875e454755787b3675c57ff20ca468b5aecebcd12c10
75f5a527859985122d509d10199495c035251411ba0034be2c242a301a565d5f13294911d282baa88ea62d83822ba524a1543a025f930e53a5d89aaaac0ba018
a656bc2b299f8e5cb80bae0f0ab8ece20fa715c0b8516fde1bb73857d8ec571dd677849b6c05b93a63d4e7ccfa620d9252e6d142e79a4528281caa2b4b493d5d
4a8fa2418ceb2b204bc833a3f5753f37375bb91a16525345fe24abae0f1d0b51254675ab14e8b8ab4d967672b05e3de524f49c3647d6ba3a575a8059429bb60c
03908c9e3d242a5f5b495105179188b0e09aea2de9d8f838b951edfd6cf231c5364b0811f787e3b2db99072f27d6e6ee6a2bae92bafce7f809f5885d2478d9a3
14a6798466b0899ece4c67dbf13a2d865847cde6350178cbc08a6e6e7ea4d69b23aaa67daf9912a96f227f75356562f5979093e08ec29688551cf647aac6af19
aeac145d3f99d3d7a621c6375e325103a2594e679718e2c9a4e9029f7ca696c951d67714d55997e7e846d519064928812651b9aaf93e3d52373a365293751f1e
8607f6b0a3e150a1a380b2352da29d90109fc4af80af4c582b86a8f7cd0165e2c9c49468e15051565e392eb181fbd8d750a3dd8b8c63d87c976551aed25bab56
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
faf3fe645657cbea104a58cf452924faf04dfae17d16675869ea3c8eabd120c96474155b1bb4fe0a8baf6b1107ead729b55ac489be6f58057cdfbb8e87b5c1a4ab506d108e0cd7c0f2caedaafd4e107b8453789939fd801c5e0d8de4d2e3346569a3eb25b8423cd20968be299087db4791f92f06ddfb0fa7b232370efdce75ff
fa222ee647c83afc2c51565267087045244b0b31835e5d078088b56a5293e989ae4c9a64c741613517f1b5f0e6d63a6d651582151df8038feff7818545a83380150da07c7f00b9e07163c3fd0615732fe27c791952ba49fe87d73f6171eecd46b225a178920c71c39055cf93fb9d8a48b11baf8a01eb6a67e9a569acf08d6ec6
__map__
6592ea0bb1f2b1521a3103622b1c75a55c87d74a4b7e81f39908f15ff5eaacab465d0d1104179d7368cfa561b560270442c30a8bb6a10285b558b3fe2ac32a2f2bb05ac1edbc832e89b66c2c50271c390be0f39d635585f8e9ace659d1a75f905599d357a4568b58244c3e6b89591958a952304c7ecfae9de05bdf04ddee754a
518a59455c0e2960257de5d222f718c520133338ac5c58e4adda5657f47be9c1d50756c125a7b40deb8e12b760c9ba2b975957b2cb6e576746a20bb15a621b943302630a3adc7bee6a92cb6a3055153d7c031b86e96a9ceb4b9358694137cfaaddae0f87ad8f1e3f7e3cf4b4883c2cabbf9aa8abcd12877eecdbd183e4b5eb29
abb6e327b01c941fd9554b4165ceda608e55d8a85d8055190321c3627f4563dae20dea7f6c61b98d0c3021569ff7e4ae66efd1b1dfda495e4d1e4cb6c18caee4336908594a2f2ae68605330536e884a28165354cdec0ed9cc02a7158998f1556eefa2e4f3f6b2165f5b2d40ca2d3c6456dd014b030bad0e1dd68bcdc2966f52a
8d6cc4ca7ec12bbe77af177e2fc3ca765aaa4b7456179c09cc905909236b3628b99717a6b042be8b6b685356bbf10387d5fdacfa8595b542d295fababac38aeb671763257d5e12d728014c87728909ba5aba4eda4e59f1b770840f1fba36688b0cbcf218aec8d555c83183b0e219335e5fc4ff8dc7a24e47436245bef49ad820
6e64f8e09be927dd4faf39a3cfbf5a127765d7fc801542ed155305e501092ee2b3863f73c13d9071905de222c0459cfa53ccd01b6385e540b89a21a7ab9d3079787da95057bccfa509ac3856e0b85dca7d45e360ba3a11acee632104d2de2cab30ab2b656596edc79c09cea90d9eca2ebdae483ad8be002b5f6c90ad900f0c23
384e42af4058c4aa739d5951ef79ad0c7f1ff7bb413281955612177462d061b520bad2556afc2d0d4bdb63e360dafbb0b73937779f2f9deb0e95d5776dd74aedcc843f825fadc74aee41ace6e6c4b7ab4486fad52c49b73b81cc7883bf5a1456a084c861895dc9182a5966d6615d19dfcedf51bcf3eef509acd4275416247316
df1e528e23e5f086693ad2872eaa0c2bae5d95289d736d30da947a5a28ac7cb37a60498d5ed7334357d708d57ce91b55cb0a650a6c02995ec00629011458d05545b2041abff3ba9269f6571f3c4cde675db9ac92e4e1041bf453560a8b049259087aaab994979842925b934953e77813d7ba577d8755fcbd1b8eae1496870f2c
092b591a1713ab1a27186d6b83ab58b952add5ebcd0256931ab14272c0e133e2ac36970610ebe41c96ac487fd58fd406cdf414bef0ed7af2b053c88a05b3505e341328b2f0394e7a8edb3eed65d7f7d8f26946573d87d590bfab9b58053754f0a5cc1474e36587156881559732d7d4065725ed2755cd5d641c5c6456eadadbb5
05f624a5bcaeb0ac619b585d4d94554e57c5ac162519689bc989d0acecc8b430534d906772e3204e5cb57adfb0c28d7c61cc35d706f512644cef9474f904b3826fbf59e9ce498e131b56f398d1c50633b30a2c2b0c7ea4279e249cabfabdacaed8130aab8c0dbec1ac1ed29ffcda7e6285c18e2f347559c93a716e4f0443d873
e7336de9c6b2da956bfaaad51a585102aaacbe1bdc088daedc5533c3a0c45774132de935b3227ff5cabc8919363730f87753c39f9995e4fb3720ac6b1554af96977df1a726420993b6d5555cc08a7cfb382ba4b35237e971cd40a6d913fad9d836a47abddfbf95b86b0a42f35f2e16a57c705e59a9ae62d706332b8cba257311
7c1b490356c4938e4a648775b33fdf4b2ebc024b58f95a496af86d9e0f5e662b66d762582d943adb46573b5956e1fb09b3ca0718b6c5eafcc02a20571274b752563428addaeec469c13dafabcd2af54c59f5945534e6af962a52888d25f7e7409858ad3436c06ae5e685018db1e22848ae5e401e7c6d996d305db70697504e75
b593f557afbf7fbd40573c5eb33284942c4323f56f870dc434b79e28add34c8863573d8cb362dfde755995e473e272ca8ae7f04a2664402487d7571a18092bf5f6e9f3b2f24d42b828ebac3a6025a504d145c2964faca2eb1956b75457d793025d85ba863c364b37e45f370c6182b7525636258bcd5556e1b80d869bd65fc957
0ff6e2ef5e2d8de90abda7805af384e46aa7c431c332e90abebd3d7c1e563c2761920dcbeada86565d5c7b0a1d5d99efebe22fa32756df1bd755ba82d1ae41939257c25ec3b2ea255b4e876c8dfd342d4cf00e98d55cd7b5c1aba2abd8d1953453882547c5a52cf2290d6255bdf97cac7cbe4d91c9361678f4ed54c42c42f9ae
dc305d1afb2a54f6a30cab9d1dc32a5b4895b282994a4e9756ad6edd7a0c4eb7e447e6823dfbaedc3a64e831b0ac7e9984c2ea7b9695bd1243ef206774f582b0ba368f751e956aed7959d9f88aaf24eae888d2736c5059c5fa9db23fcaf9abf8fda45857991c0544700b8fad37df3c63af6158ddea054aa4a74b3cc40eb3ac62
ab2baec9f00dc91f9674e8d062051c5a996b550eab32992cbcfacb1426d4372e12238cb16af0a40cd2a845f78b061bd2f98caec0eaa1b5c1373fa7966115e759a5a852f1c4a760b5eb7ce7de9374ed587a117b389195cd7128fc28c9202bbae2aa615bea3b5956b1b2ba76818271112b677155e6be88fcea69212bd1d5e7cc6a
cfb08ae21cabcc645f6a67c95d821ceab7f432a853c978362b0b61cf8c01bd311b9471b0a2acf85b70be9b185de927daab7fed35ae57d9067bcbf3f51ab1a2b8fd79586deac798662fefe8e9950ab1612527ca61b5e7b07affa1bcd165e52e72495d52b2a5acde345f46328ae1dc312b54f74d07e29c0d52fb1658a9bf3ae52f
336756e9a25d55657a1d81cbea1ab1da98ab3f8fbb3ae7fd61987a2bfeecc8b1c15df1573b6a833959256974e4343aaa81b27a62be5863885cb8d7483c6f584fcd30ccb30a28960c8cbf7a435845a139cf725d4ae67a64c32a245624c79757fc5f25abb1cd256848af724f754594ce44579695984192247ae14b6c779381e59d
edbd17cad59aa2ab55be795add6b799ea7ac5856e9e82052cfb1da115652e0717415ba97bb4b7c05df4ef9cdc6c6af8f95ab2b97d5ee58cc40acf85adc8585e9ba82df697d71866bea9e48d0704a9122af7f6f78adba6774158bf95b56dc4af3f7bb159755fc305d616946d00c29d195b042fda53b85d573a3ea15ea4a597dde
b3310365cf886d965e7b69aaaea8b35ec285a3118a4758725ad716d5b9a699e822dcb8c7d73b3ba961fccdd2dc6b5d338fc3acb8b8610a877a6f932c2a61452702baea4ed5d5f3c3cae92a89525626beeab1ae126675ff25376618dbdd922c12e1e4000b462b1b555c0384352f3c47b8c0eb73d4fdc85d3f629715e98a2b543a
0ef2e06b6e9dd3eb396668af74c7241e44bb4291d14aed39638669cdfa2bfe58fceb251358bd9f7caf9db20a72f195692f60c920a2e736968d6c6c68fed6d9a86291c002c546ed7668ee44c5e7689c55c7d555142b527b1541d6c327c04f3d211b5ca1d0fdd7c8aa6759a18e4290d4b8f2acde43cc80af165f1456321555e0ae
36b17cc16b34dab8ab61a9a82ddc37918b5cf29bb541f6571b1a8b5a564e8e6d4606232c523bdbe0721dac4857bf461b94b81d5f8b1505a199062f64959475b563ca6a1cd6a6f14e9e4cdec882202dfcf2f5008bafc529ac715658bbbf710d75860c2bde37c9306515a6ac1ec4d0d5b5faaf9955ac0e8b57252415cf1f63c531
16585de76cf241659c95d32cab8276ad819f8dd78cbf4230eeb04a9855654ee726de54df1ec74657ab8da8a15712b8bac20c2d58dd6c10ab69f1d5f3c3e29c01f761088676d16f86d5aeb2527fb594f09c60b10dee6cea9a495d3b9969b59a61656ec3988b195e800d96c406f1d5d7acab973a1230847c1d129d0d3a638eb412
9cbf4458618af0f9729c735049aa85310eeecae7cb39e23dfd5e44feb23661a53103b142cd62aaaeb820de50420d7de0b737f0df7cfdb5d0c24a8752fe8dfd5509990aea0c3bacaba536cf11c9c25b621583552fc3aa6459cdcfff3a5999fb2f763a0fbe0db745b4569595790762d1f7927793f77d2cf8ef2c050b0fca0b1358
89ae3008e44545ae64b196b2e26b6cc5b99b6e70dc8e7190c20c66b5c3ba0a788e48ae6febdc00aba5259d55917a3b58f5c00a75d1f95fa7bf92492f1ed713524b376297c5af7513dcb483cb41f1bb09b3ea256dac4a2a978bc7c11d65d57175a5ff63651f3f784df340d5558615d6c9a098f74bae21efed8255628afaab144e
1023acffb4ac20b3f27d1a7c318333ff6bd3551cc89563d0155fffa977c84d9415b9876b6db80ed3f8f2dd7699979dfad3745521bb1156bca2a12ba870a51b74f5a9c32a766c10b323b0412c51fa257a1033ab44c27ba32bf8ab2cab0eb1aad694d5dcaf8355621645c8848304cb3e5f356446f9ae5c062003e5c377af9bd264
6989a74ec675451e46fc55654ee544a64dd6c77e8a36ad32b5ed49ba4a3675fd15fc95a434f4b91cfac95c5afb5a9b5851409b48ded953560870aba821ff3a58e1fe51f48fe768f98a00994bea608093883c31555f6e9bd4e724c38a85159b6febb4a86e092b24fc0c6b716189120f46846dba791b0c0d2be905b3a2a801ac92
2e8d22e4db2946e66c398e1b1573878dc4dcc600f97679a14dbaaace4157183e7e859ce2403f8c768eb54ee672aa4e5bef2c636cd06d147b39ba324ba6e3247b99d60eb35aeb1b7fdec074818915e6b912e0b2e21cc74c42332cf02c53e03e377cc857502cf1f53f7a6795cd32b22638866ad59392720db78f5a6256a5156655
adfeca741507ba1c0a068e90d29973eb2ce92d720a59a9ae6ce3859c986348a70268e0baf502e36c5bc73e5f671bac99c190feea7de8b8ce600377a32bd26c85c7c16f42b94bc9c3eb94716b6d41f0bcf20af62f270da11716a197f8aa8515ac93c166bf0a4e7eba6eac2aab5e36716dcd9063519e7fab38be3dcb8a74b5e8b2
8aa4b61bf61ef47a1f273f7c43596da6695f51e80e6c3666d0db5ff48495eaaacbac7ec98bc162ff218cff255d32582ac90de1c16a718157eacb38c8570110ab76c59cc599175c15b4442e46aa4351bcb836912a145f871326c3882f585f32095cb1aec6596d7a015805d107a7faedd49b0d5ef0aebcdad470cbfb4ceeacac7a
4657ca4a75f57209f1d54662e6491e6285bba434b8e0a65ac552f076c0d7bb32ab05963b8756be7cf046e40c3c176a71c0a133b90e32e66b30117bb7083f32b7f3256334f72399c08a82d13c2be832800d86fe69b82bdf160fdfde64ff9eb158305accb10ae56e213d650572ccaa4cfddc60f38e718ad8a57298ded6dbb9f849
c7b3ac62d9ef3c9485f59d6c867ace2fcc4a1d45971d5f9b13d886e7f18c8c5c578c85d0b8e50b6e09d29ec00a61c5bb395638d480170b25c107f235dfbb4fdcdc79a9c453b73eae4c756e12c5ac38fb2dd2156d54ab9187e03944d615bcc6b6b292ef5950567e596d90a4354f0e1817c1574acb55d86864ee21710179ad3674
1ef51a1c1fba8a1b81815564be6813cb76f812cc4ab93c495760f5fe4b74dce59455f200b2d84488e68fb1325960be5deb76adae7aa2ab30a72bf257d55a24ac783921ee5c1633ab8459798695f157d80cac2abc18b68acb9874c0e222d394fb8bba87d8ed366a37e9a370811bc97213de7b489fdd908053e97b9b94da501fb1
__sfx__
52636fe32b7203e64f13767353263a5341454a152540431735431040271207b1a21e3b11f3570f3c27a05145214282d6032b2702e54607703285400376b28354274260853536374373452e61a3a2102b25629332
d565547c3d32e2120b2a66b14119101290c4600b17f39561240392a77230347135290b51a0a11f2a20b1a61039768150611b66b1d0693320e172692c3313321f3a5593f0040776b0d666223210e4113351c28136
58d554572f00416135047002a4243277d2c57d140350b76d0c5413854f3e644084652950e027692b34f3e0021a7340825a330323436426518092103025e307113525107204066291e34d096130a32d1f50a0e306
bb5653af0f4281521102452060351b12e0b3261a36b1c1650e70a093250b30b0074b2a2100336e1b3303646518416150112b01b0112909077003132320d2400e380461562f0575e39305007512245c2136e2640e
b908a98a1f0200d0752e07f1041a0d4351e222304162f61c013462e05b2c4622e067076463d53817453306563f5481e763203251927f10259160531d50c065363b33226370263331e02c3a4721325e2a03706704
c88a1dc13b6003f55e3e11f3e71c1245517525067331c17a0364b0735114527154501644c30475221051555d2d0081a1090d02f1a3373d3762c26811030211683b0740e4192f538023580665d2d3433267d1f409
95330e8a0537e3e1432426107631124321f7323f46c3d474226221252917709146312102231257371691507a3d2002a0240112e3a24f1242e2b2691834f065650d0651041c0f04b342281d0372340d155723616f
e55628323f2520d40b065392436f0030b2a4481b1160b1281434f1070e2b213257703c35c2952515273312553206a0c76a2c312176211d4430d218241272f466331310813017057010560336e002602b60218460
57652ed51907c1f15011709316773333807439066143b648296763a07c050170b57e26324052473961c2306e03303383711203d3003f383102922b123052b6410b1751963d3f312334722335f2b4341752608310
e63175771073e0552615529180543822b072171f0050b632273541b315381080111231272397202c2123025007206356283b359223523211b09308075361f61d290750f1131465f166040521b165030e67a12659
fe2501c50f63324242164682b1462b41f2835607174223613f1731e40f0a4282d1750b31f3d03132058213323d642350663c37d3044f2151a0d73d1275905160190352265a325352f020047260b5522f4183b460
3e51c68a2e25a0430c2632c2f4642052c2f3262f47b0237a1e372170441952c1b67b240740d01e355622613524128242791045605312392591d43922107221302160417163336282d5103231d1c4482f76e04262
e7f10b261c0671740d3f62b3e54e264750242403017327530f47d0763d2b7062a26b265190113b0666012236057352105c311451d528291272245a29007233000967a087122d21f2d3153e73d320021121c2b229
867a4e1d240092e0620a7400b75712315096290565a0e2431c359334312822a2c27b355712c20f0730b1a1181b43a3065c1375f3c016192430720d3244b2074e105781326f3d54e3937c1e03801307186490c46b
0fdee6eb37754013611c42b1544c0c4091b4121d76f0e0720623e3b641335060f6083d51c3901805070311073915205726365470247a3c221165071c23d05528154760557e2741022447340033875c2755e09416
d299e49b0c3313327b1d15b1637a355433906a0973b051543405f2041c2a332162510677d3606a2070b026060f6760f22908731221372120b0a4222d32a001712973735033236091004a2212627602024500970e
64b1b4ab1c038336643657707531064770567e2700f3b626255270d6340d33f3540917733305393e068332341d6523355c2d51c2a07e256471a41b0a6101b23a1422e2e071181270333334608337540914c0b33f
39d949f7386643831a1455f12135255602c16f2e22a123292f54e3567c2d3420c30b225250945a106280510b0e5033801c082541d6513074d1507f3e4510c56030452216242f70e32565376581150d0b51b1f507
e9f08e0c176770757c254271426e3050e2b01b240580375a391510c7251b55c3746c06041064563c526031261604f3632a0703d1f5012b0153d24e0a43f336082e443104792713514777192101c50e3f2603401e
68f3ddce07443230263541d396462b7212214c1413c1952416535014742b11d1b140185243e64b17270036763c2702f57b2a145196403911d197571d76e3d249361022c22f0f63336224016621267c3e7373846c
49e4e86a13020155250a37310505201043a3760c60115033227351c0350961c2a4011650419667116702f765322333960c053111e01905619264670811f1a7580517f0a312037632d32e32558007060556520135
0d8ce45101615226603c52f2627d137682b15e031792126424433095062141a337373734416502185470c74c2352515062263080a1422a75f1d5071945c0d05d23419254351a51e385083d06024104315532a407
e5b497b82c13115428066290835017479065400f7132031f084611b36c0022d2026f2c54f1a47e2f528032550e5271012c0212e19117075241b32f3e3311a24f021752a11f165350235e070381504f0f70a2252c
59bc87692e7710a77d304032b753242100c0350d6731c7102b2222a61f22052024230441b2235d1d007201013f35c2f3063c2591b344344610460c153432364b2926a3a04c3870c2a211190253d22c0c75307663
3184a9412e65f251780a0713c2180b0281976b1726e3534f2b0100a26b21564221101c719033473764c1a31d2f01f2c3263552d261350115c0a2063232b2c5461b4083b14a1716e2e5283a5112357d2e23811620
3596372b1037d23227077361550e1f41b2a3310b55804415272753e52e3b0612801f3533c267212021a142280970d1b3011b709073690f5450523915277353240020f3c7001f36a084471e7540b00f197503c12a
7b1833410a44a12514224732c40f162012225e0c10820070346010a1500b61a113052f2400a633374531441b0373b0701c0a67b2115b2c40a191122b638304410e4722e43f00202274162156e314523c5681037d
e54773a608458377201932e061432836d2f4541856307467311160364e261643a20e3830c0a4453f5161e7062561f3844a2b5363f5283b7371070c371052134a2c04c1070407207131273521c296222204006628
280cbaca12059255290e7282806a2b6692c6760f65d2052b0d7042733b044572843d371092e55425429232523e21926060314103d7383d41a2c4453767b3352f0f4073920226170193300135628534037403023e
0589cedc132101445f3514d1333d143311705c2a5182c5680d4423915c3a112195561d62d1547d260390b07d3845a1855b0c62606761007363764b2c26a2a1602b332225070925c1d1350d4621e35b135443e277
44344667220441910c2c414042433923b2d05b2a20f0a4131a7211663a0c4011604e152041474b2e4490547a2f25d131150454e1b1452e5202065a3c46d032512a56f1c0452b4251c752060571a61d257611861d
d27cd0de1c0743852c3c61b015163e01e361190c3612667d302760267c315741c214095322f25a250681b3222b0253d30e0075a3c07c0c77a001752c6520a673302733b3510e46c1854b1d05f3a6222750e0521b
cf2008cc231430e6520b06c170573a7080c5680876214707200282a064362400243436478393730662e2a24e0a30a2245e1b7161651c1f7102b0641727a3a1622c2101e1371d3143772d175421574a1524b16012
7e225ff420329210583d3030d4362a2181b0153f2582356f3a33c122323a12c2a66e3311d294273514b0156038328152331e46119031095620b35a1a623045391527d1075b2241b1602f18645110623933c35067
b7a448593c25c0b5472217339622302113b76d1556525003043263862b392580240e2d6780966218564142310062f2e67b1a1352006b0e718234032e6770b502261793944a051292b65c264501625c0b2653736c
56b20d56155271307b130740551e34441360562247239659204241d1161e752066252e409160551c6160501c0a57b152022653c097231055c2a5482f567056462406a064512a7391571522712331131b35e2f021
663a06ab113031c0571e1413e1070b4183924b3774c3823b3e65f1d0212c23528070251353825d231793e71b381522d17e2b529173662b329142681c52d0436a3a41c17623097572736c3077511406215291b56e
d63e60563c224181212423d3836f143391356525531167132d44b1d7730f6182a4522652a1363e1b35c0a67e396181362f03474177731f21f1755a3050e3850a1a446151152f24d0545232546033071b71f34754
f3b9e07d1e13c283130a3511e53d0a1600276a2a47d02726293323e779237551161f246622665b2b103150701c40527506253621c7333a2503742e084223d6011c1173f164320681b2722b25b033502e7540b551
3dd5ebcd2e2260331d050781b7120c556303061241b1977221277174482326e190351c5572b2152c3742f1020b065253570020a2275b20522126073072a3e5011632b121201653a304642c51f0760f2376a2113c
accce5753522f2140b3272f1901b050360572c2f25a1861e356563c1042507a166162012a2121f1a3171537112305355211861424245140430d753164441362a152553d41d0c3263a41c3a2350c3521b32a0a70c
1b729c1a3244f0273f39054345493f10c123382e72c2900c0853b084253a555384153b5162b757235190b77e353791720b1745d0172b1e7111d0353310c2b4633a32f00105126021e32416737132050946a0d409
676f55251207d3925a0c5110b5602a5042f226322360316a247251d06c1660e3d632302141b6132500a22465390370864d32229154310420334560190481705e2501f127603021c185142f263264253d26637543
658727b7113100f3072d2372332e030711f40b1776a2d00b1a02d15565030023a021115032f2773d67d3701b2b62a2c2430201922352261750a367034202652c25036246343867930469245720d2782635d1a500
459ada320a55a315223b439350230443d3541f3b367012591a74a3e50b346593d7293925f00265364462b55214658210093154d381601165f16039131630e64224155123600a41a3c5330e4602b66b0d3480452b
d5ecaf6d2c2371045f086012612e24069180613e13f05535337270f4260140c0530b0c0522923b301093d51103512273041c77a2d57403148326060531c235121335f2f03c3d60b3a434173291632a3d2651a456
e2d131b00a3303a50a39651384532f307286310e2203e6193c5151774c1b773260150c2521524e3c315221452d30f246423671b254520d02e1a72a3832d3101c3e13d037330d26b140310660c3873f2b36717613
115d5932181521c1611865a3901024327061763463a3d0161651735057175312a60e2d0352635e05754091270711d0a027156661c5431a056250331667e2b4613211b1541f3d37f12135081721063d3005a39414
9a820fa0377250806f1376c2436e167620276b0a62e194533251d006740e53b246550d53a1f64f3140b1f5361852b2a4722015e333182f6470a1211f50d290782a626154433b5421d514391103d5030346b1c70b
c9ace0db2243d3931f1c2242041e253343d11c220690f7320c72a34360285552840e127433e275364091b67d0c44f2e140191352021b312580545e353062146a2205c24741073453b029085733911b0a0353c41b
82cde3642901c1835c3611b2b303121150c25a0930b087340175d1424b14732292023b6712e2721773e2b17e257323336325308095421b7643e7693620f1b0131b21b0c5471225b2b2671d612177780d61715625
6490aa91123362726230666091740336c020203645f241480802527412154212a61e2645f3e45f3c71f082641141d1770e0770a1172d2d61d135322a141242741e34e2c67c3f35f357231001e3a6213b23609117
0e3b58e5387632f2121341219045150793e6593340c1047c1430c277333475d2727b0125839334214522d5231300d173131325a1300521250325173951015231123242440d164473653b205743d00c320243e53b
53c529970c64219011161611d3532375b3c1243c51c3d0640e43f1462d0756b0f0711b57d0e47a1e77c1841a0114d3f04d2f61a26304315123f110193381475f104153374b1c138137551e67225110002551d265
cbe3ef73175233d13d2f64b2e3373947f364132541d1334f12360302263c17f1407307260082783c703251321423a3861e0b0733f54817124005251c04f2f417253590245f2f7192b25d3a6282f0063b11831717
4a4d286d3c62c2c27d236093570f2345e302302327f3e65d2537b3557e3d7102e40c0f74933734274573415c396321140a13228335281202c1c7781d71c234521c50c0b5520657f3a77a2a4753032c2c20b18656
649323ac3036713706155261d5152d55f312650a77b1d030324601f6450b0622536f326641b522355140d22c077313511611751013532326d3a44a3764f1e06d3722a323072b33d2745a2d2290e3042e3321066e
91a2aad501267233101f66d251733d10f0c0421665a2b53d1a4391d34a0935404744346582b40d370282015b1c7443552b12349092352d17f1c0453c14f37405373131f1533d02d1b74f2f47c2525d162200365f
0de7268738151004031563e37507277481e428212282a5533916f0171e1b16b3c3680206a0f2742957816173357143a74d143542957b2e5380476a114631b23a2d2112c0622366c291462a413202360b62b3a554
ef75fb741534e0705c290133232b0d358276220b356264060d7642352b20033081793b5052713d1b0632e07a30349046580904f0c51f0a26f320723a73306110072452335426428336652c05a094792c2701306d
268bcea72b404116060f41f154713d0730310e2e7451d5233152c0d43c2d3330231e042073001b0525a122270a6010d74e24171223103c26c0945c1a30c2b54e3170d0e1070b0562c2631356432173287522b270
8a27ab1f1434421521041700e26a3012e1843e2836122435151350b72b2a62b3c426255351b625250571e63d0961a2d30a16470255023944f133090236a0f647395731c75f297703f22b015180a014014232d70c
f260935a0b7130206a2a132321030f56e1c2453a00f3523d234483776c3b70b1e7153b03c3a255207591d6511655c2e5263513125564006262f2210212c0653c2f41b3226e2143e314783247a0b3550a1120f559
c14abe7f0d6673b41b2a424372073914c1b40f264263e75a0d2753215a2b104373740f5743f22b315573f46f2172e225152252d243442264d1c50d1964326623176541534f236031e23b2c33c380703e0730916a
__music__
08 067f7761
05 7a755c18
04 207c1572
04 7c0a2c0d
0a 2b0f6535
07 5c463215
0f 44207326
0f 10054b51
00 7d3e710f
09 4250174b
0e 702a1753
06 15627679
06 65451770
01 14292478
00 6508593c
0d 401b1778
0d 516a3943
0f 0b50010a
06 5949152c
0a 65430a61
08 0566576d
03 4d2a3431
0f 4912421d
0e 667c1e47
01 6b35713d
0f 5e500b1d
0f 5962006f
05 79097f65
01 1735045d
0c 72087007
0e 0b384c36
02 3b510613
01 52556658
0f 0b48733e
08 4a036810
01 60000c2b
03 0809026e
01 581f5871
00 0a083d61
0a 56621556
03 78774373
0a 3f23347d
0e 0e0d2e66
01 30600817
0b 42621d5f
0a 5e626c21
0e 461f6615
03 3f710d5e
0a 4c4f6345
01 420d6245
01 343a7c67
04 1161355c
04 72604122
0e 49595778
04 1e684e7a
06 17671002
0b 5c6b690b
0f 7e2c7660
08 73033a2d
02 095f3160
0f 081f382f
02 431b3362
0f 05557175
0c 267c5730
