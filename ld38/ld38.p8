pico-8 cartridge // http://www.pico-8.com
version 8
__lua__
--  LD38 toy project
--  copyright (c) 2016 sam hocevar <sam@hocevar.net>
image_list = {
  { file = "data/skyline.jpeg", w = 1024, h = 128, tolerance = 40000 },
  { file = "data/bear.png", w = 128, h = 144, tolerance = 10000 },
}
current_image = image_list[1]
facts = {}
rom = {
[0]=
0xac20.5776, 0x4441.4263, 0x4b26.b068, 0x2584.2a9c, 0x1f31.56e4, 0xf871.fca0,
0x5e22.e63d, 0x83d5.3669, 0x7860.03d5, 0x51fe.e202, 0x36b4.808d, 0xd917.0f19,
0x4d9f.c8af, 0x3339.36e5, 0x231e.dbae, 0x0fd1.45d7, 0x32f4.c3f1, 0x8ecb.4684,
0x68fb.6366, 0x976e.5209, 0x5103.7c5d, 0x9269.500b, 0x2c84.745a, 0x6705.b3da,
0xffed.107f, 0xf25e.814a, 0x87f2.651f, 0xee09.2e99, 0x160a.76b9, 0x2287.6c43,
0xb7f2.52e5, 0xe5c7.6924, 0x0d79.9e4f, 0x98c7.175d, 0x11e7.f81d, 0xa2c7.8672,
0xc0d1.d617, 0xb08c.1b8a, 0x041f.69e9, 0x70c6.793b, 0xc3f8.e575, 0xfffd.ccd9,
0xe2c5.5a76, 0xce60.166c, 0x2356.6688, 0x4ee1.86c5, 0x3116.dc2e, 0xf016.23e0,
0x6a84.508f, 0x5d19.ffe0, 0x348b.8427, 0x44ef.b078, 0xbd6a.581e, 0xc35a.1ace,
0xa0a8.c735, 0x1576.f180, 0x18ed.d23c, 0xbd26.cb97, 0x9ef8.21ac, 0xf05d.b39b,
0x8d66.877d, 0x8125.4188, 0x798d.49fb, 0x415e.9361, 0x6dbf.8482, 0x266f.976c,
0x1f4a.8270, 0x2ec1.b08e, 0x6a76.6283, 0xfbd8.d1c9, 0x480f.301f, 0xc1f8.3d08,
0x35e6.19e9, 0xb003.ff00, 0x9457.c097, 0x99d1.91bf, 0x654f.99fc, 0xba1e.dff2,
0x88eb.affd, 0xe004.cd36, 0xf547.eeca, 0x99ff.efb2, 0x52b1.c024, 0x1223.d9d5,
0xe70a.3ffd, 0x2fe4.609b, 0x321e.52d9, 0x5175.f912, 0x8ce7.eb88, 0xe822.f3e2,
0x22bd.89f6, 0x758c.3805, 0xad02.de40, 0x14fb.b240, 0xbbf2.2394, 0xca7b.6930,
0x37fd.e905, 0x5816.548e, 0x5384.f462, 0x178d.3f94, 0xba92.f5dc, 0x916f.f903,
0x2135.30d0, 0x0925.0406, 0x4234.7ecc, 0xfffd.ce28, 0x8b37.f24b, 0xf245.ad57,
0x0949.310f, 0x4a2d.a276, 0xff28.be44, 0xa939.6bf3, 0x58e9.955d, 0xf99d.a9f0,
0x14cc.0d90, 0x80ca.86d1, 0xa84f.f6cd, 0xa040.c11d, 0x0340.76b7, 0xe132.c879,
0x7832.d89f, 0x1d94.5965, 0x2ce0.c3e5, 0x14f1.ebd1, 0x5d88.4174, 0xfcb9.fff2,
0xa33b.2a87, 0x4246.00a7, 0x8ab0.3b53, 0xdd24.12ed, 0xc776.a663, 0xe359.fcb9,
0xfd89.ae0e, 0x8c4d.b56a, 0xdad6.badd, 0x3dff.1da6, 0x8941.f4b6, 0x2ccd.1a0e,
0xbe4d.5ab2, 0xaea0.c260, 0x266a.8918, 0x9aba.0fed, 0x9462.5cad, 0x3769.4901,
0x81fc.8129, 0xf556.b160, 0xaa2d.e5ee, 0x3310.3c2b, 0x8e7d.9466, 0x598e.8215,
0x38a7.5de5, 0x67bd.7108, 0xdff2.58e8, 0x1d86.8d47, 0x8503.3b25, 0x1611.9df1,
0xfb46.5de3, 0x9297.75c7, 0x83ff.c8bf, 0x84fa.2f89, 0x31b1.87c8, 0x4db4.1637,
0x7d6e.e449, 0x5c24.f347, 0x9b66.1ac7, 0xd50c.370b, 0x3f0a.277d, 0xde77.c1cc,
0x9332.6733, 0xe46f.c117, 0xc1b6.2746, 0x6914.56b8, 0x9d90.e1d8, 0x24ff.420f,
0xeccd.a36c, 0x1c6e.aef7, 0x51d2.1e89, 0x2a3b.84e3, 0x1c59.c6b4, 0x77c2.9199,
0xaf82.7b97, 0x6a79.e66c, 0xa2a4.1ead, 0x0785.de4b, 0x2ea2.7ff1, 0xb1ba.73b9,
0x32e1.f40d, 0x3952.e385, 0x06fa.dfca, 0xf3c2.2b2c, 0x724c.2c1a, 0xdfef.26ed,
0xa6b5.888e, 0x3b5b.6b25, 0xd19a.dbef, 0xfff1.02d3, 0xc97a.3350, 0x2e52.b2f9,
0x0e5e.8c8e, 0x7fc4.46e0, 0xdb21.3ac3, 0x45bd.920d, 0xeb9c.e94a, 0x1657.c0d8,
0x4b64.6cde, 0xc1c8.b1de, 0x08b6.27a7, 0xe513.1d19, 0xc9fb.c97f, 0xdfb9.5962,
0x75ba.c870, 0x4c21.0845, 0xa67e.fdf5, 0x640d.5c4e, 0x9e9f.70e6, 0x4ea5.eaea,
0x7157.fb97, 0x3c95.c2a1, 0xd8f9.e9bf, 0x3aa0.2054, 0xbec1.fc0b, 0x27ba.4167,
0x7938.13b3, 0xc0f1.09ea, 0xaf66.74f8, 0xc001.b1d3, 0xe292.4b33, 0xf672.ceb2,
0x9f6d.a1fe, 0x3336.ce8d, 0x2a66.70a8, 0x1f94.5273, 0x79a6.ea5e, 0x51b4.ab93,
0x5d25.86b8, 0x826e.c85a, 0x0a04.c104, 0x02a9.a9d4, 0x7bb3.27d5, 0x3770.8fde,
0x3663.fffa, 0xc11a.9a91, 0x5ce1.a25f, 0xfc24.7ac6, 0x1913.44cf, 0xe02e.8d77,
0xa809.b83b, 0x6286.3f9a, 0x355e.4877, 0x1a6f.e65c, 0x5ea8.97cb, 0x737e.540e,
0xb6f8.cd07, 0xba82.67ca, 0x257e.a37e, 0xe140.53d0, 0xe9e8.3eb0, 0xb9af.7b15,
0x6f2a.c522, 0x14bb.1768, 0x99ed.b0a3, 0x4833.129b, 0xa963.930f, 0xa5f8.412e,
0x2759.1d94, 0x8bdf.ac94, 0x74bf.c990, 0x49c3.9cde, 0xa45b.865c, 0xa85c.7fa1,
0x0c2e.b9dc, 0x9813.fe5e, 0x6478.e1f6, 0x24f8.f7c4, 0x80b0.7fe8, 0xf520.b213,
0x2cdf.7798, 0x6042.234c, 0x1e1d.5b0c, 0x7453.da1e, 0x7874.84cc, 0x1c6c.e51c,
0x1f36.0035, 0x8d1f.0414, 0xa21f.b531, 0x7f93.3515, 0x2c8f.e511, 0x8c40.7ad6,
0xe6b3.c3b1, 0x6f6b.6a84, 0x6dfc.a7f4, 0x8ec6.e165, 0xac73.83ee, 0x4d58.44db,
0x2e5b.2b08, 0xae83.788b, 0xd26f.038b, 0x4133.ed19, 0x00bc.2dd4, 0x0dff.e033,
0xa206.c19b, 0x7c2b.c095, 0x576b.46d7, 0x342c.4879, 0xe217.add2, 0xa860.7fbd,
0x8ad1.aeb7, 0x817b.8fb3, 0xfd05.a958, 0x0924.acfc, 0x70b8.b0ac, 0xf21b.82a1,
0xa1e4.b866, 0xdee4.5fcb, 0x76c1.611a, 0xe247.fb49, 0x6c26.9bcc, 0xeb6f.9bc4,
0xd474.2afe, 0xc35f.2bcd, 0x765f.1bfe, 0xb4e2.f703, 0x1b05.c143, 0x389f.7921,
0x9f28.2ca4, 0xe0a6.3f19, 0xcd72.cc4e, 0x41df.8403, 0xb0c1.660b, 0xbe43.9ecf,
0xfe02.fd06, 0x73c7.f0fb, 0xb781.f544, 0x6d30.ce23, 0x6a13.98d0, 0x03be.bd86,
0xc30e.08a5, 0xeb39.f326, 0x2f7f.2698, 0xc161.b37e, 0x56b6.4fe5, 0xae35.ed1f,
0x03c6.36d7, 0x6586.64de, 0x2814.de50, 0xf089.1fca, 0x78ab.dc1d, 0x03b7.0537,
0x2c7b.ffe5, 0x41f7.d417, 0x3243.c00e, 0x0e75.401f, 0xad24.d63c, 0x3954.24dd,
0x0048.4efc, 0xc685.76c6, 0xbbed.de2d, 0xc992.595c, 0x7ad3.801f, 0x87ff.e0bf,
0xbd90.066b, 0x57bb.a252, 0x8e24.3bec, 0x1ffb.0a99, 0xc6f0.a794, 0x3da0.2236,
0x1e02.e279, 0x5fa5.922d, 0xff92.b6c2, 0x2f30.6570, 0x2b4a.d8bd, 0x41ed.e417,
0x0907.7ec7, 0xf6dd.df0a, 0x483c.e10c, 0xd0bb.5c75, 0xbc9b.d5c2, 0x1d98.0b82,
0x0e18.199e, 0x0e3b.049f, 0x38d1.fbce, 0x78d8.7e98, 0xc9fe.fd7e, 0x8938.30e0,
0x37a5.b680, 0xc377.fff6, 0xa257.337f, 0x0d03.8e19, 0x3061.2538, 0x97d8.c032,
0xffd9.32ff, 0x266a.b915, 0xb19b.1b2c, 0x6b6e.e1c2, 0xc785.9593, 0x2658.8e4c,
0x620e.203f, 0xde72.ab97, 0x8437.59c7, 0x2e4d.7bf9, 0x9121.0a74, 0x76b9.35ab,
0x4834.4f60, 0x6050.f591, 0xb413.820a, 0x56fe.6029, 0xa5af.ab36, 0x4a70.bf31,
0x1e63.ce58, 0x1210.a028, 0x3716.2409, 0x05c0.dab5, 0xa2cb.6c88, 0xcc15.e143,
0x92e2.dd2b, 0x3b86.a58b, 0x2eb1.1568, 0x7339.5b18, 0xde05.e605, 0x53b4.a062,
0xa7fd.0d68, 0xcbed.2379, 0xcd69.0b83, 0x2d88.ad93, 0xc847.ac9b, 0xdb0d.30a0,
0xfa5c.c895, 0x7550.59d9, 0xdb11.3be3, 0xb427.544d, 0x4ffe.20e5, 0xff72.c167,
0xa06e.6146, 0x7962.1d98, 0x83cd.785f, 0x2841.1ff0, 0x83e0.76c2, 0x231e.f7be,
0xc384.61a7, 0x02c3.bc70, 0xf9b1.c3bf, 0xf1f8.f419, 0xee3f.fd2b, 0x084e.7b29,
0xa54d.3299, 0x76fc.ecde, 0x4af5.878a, 0xc1c2.80e4, 0xef6d.554b, 0x3ecb.65ac,
0x1ae7.ff9c, 0xf740.2d73, 0x0cb2.0c35, 0x68d2.c578, 0x70a0.9f61, 0x9f20.33f5,
0x0189.8570, 0x1c35.e978, 0xb824.bef1, 0x3bb5.8581, 0x39a3.52dc, 0xf974.3089,
0x1b83.12e3, 0xf01f.7852, 0x05e7.bf1b, 0x6379.b423, 0xd7d2.ca3b, 0x276f.ad2a,
0x0e4f.785c, 0xa3a0.0d5f, 0x6e5f.414c, 0xfc82.cc22, 0xc1de.df95, 0x770f.d65e,
0x5715.5fee, 0x1fef.ebd7, 0xcf0f.8e9e, 0x4ced.854e, 0x8740.41ac, 0x989e.ed96,
0xdc99.4f9c, 0x204f.e899, 0xf0f5.864c, 0x3ffe.39b1, 0xb879.ef7c, 0x0bcd.0f92,
0xfef0.1c04, 0x0a83.7df0, 0x1c70.094c, 0xcda1.e43b, 0xaec0.361b, 0xde1a.7c73,
0x76e1.8e1f, 0x295f.afce, 0x433a.687f, 0x5957.9696, 0xf88c.7dd0, 0x42ea.517f,
0x3eb1.7ad4, 0xba6b.7ae0, 0xff94.6585, 0x0702.eb32, 0xe539.ac38, 0x327b.197b,
0xda80.12b4, 0xe9e4.8785, 0x61a4.332e, 0xc52e.ca71, 0x0fd1.c8a6, 0xedbc.555b,
0xcb12.d590, 0xf227.7164, 0xeff5.ab73, 0x88ec.73a2, 0xa623.0cdd, 0x036f.ac52,
0x08ab.9e59, 0xe26c.8cb5, 0x3c39.a940, 0xf0c1.eec3, 0x32f5.2dd8, 0xd296.2393,
0x009f.e2e3, 0x464d.6168, 0x5d28.ffba, 0x4da4.d922, 0xef22.c52d, 0xde99.b214,
0x84dd.170a, 0xfaeb.5c21, 0x6261.842e, 0xad11.9d3d, 0x46c1.d3c3, 0x612c.d581,
0x9ff0.231b, 0x6706.a0cd, 0xdc19.8250, 0xfe49.a1c1, 0x01ac.1343, 0xded7.8804,
0x10b8.4d8c, 0x70c6.4c34, 0xebd4.d8e2, 0x329d.1b50, 0xb90c.9cb6, 0x1868.ef26,
0x0be7.bfe5, 0xf089.ad0c, 0xb959.bd72, 0xfab3.107d, 0x1697.3226, 0x0807.512e,
0x77c1.d43f, 0x45c7.a60f, 0x588a.4b76, 0x6fff.a37b, 0xa358.4e23, 0x9eba.d784,
0x027a.2d4b, 0xd0c9.37f7, 0x601b.723d, 0x5021.f198, 0x8e61.a411, 0x2dac.843b,
0x4877.3ab2, 0x450d.91c6, 0x8624.6345, 0xc7cf.4368, 0xa462.f8cd, 0x4f3e.5eed,
0x2280.03f9, 0x014d.dfdb, 0x7ded.a9ee, 0x9a82.75d7, 0x8ddb.a1b9, 0x268e.1cca,
0xab04.0689, 0xa178.55b3, 0x5857.4b0c, 0xebee.1b44, 0xef29.4006, 0xa618.3037,
0x8fe3.642a, 0x4dd1.804e, 0x19c3.f3ba, 0xb198.3d74, 0x8bc4.de09, 0xb372.0fc4,
0xf8a1.3feb, 0x0350.b84c, 0xffe1.f173, 0x161f.0b53, 0x91c1.0e18, 0x3368.f21d,
0x3653.cb3a, 0x88ec.40cd, 0x5032.f002, 0x3e40.f18f, 0xa774.787d, 0x7dd5.39ee,
0x84cb.b986, 0x3ffe.cb6b, 0xf665.bf97, 0x0772.ea97, 0xdf7c.c7d6, 0xaa81.8f37,
0x3d75.d2c9, 0x3737.cebe, 0x2e82.b1ce, 0x79ef.123b, 0x9220.c853, 0x3fe4.6a58,
0xc3f7.e687, 0x3d8c.1905, 0x8762.d59b, 0x9322.9371, 0x32a5.35ff, 0x0af6.0d60,
0xf81c.2637, 0xc36c.50ad, 0xb4d4.935b, 0xc017.f90d, 0x0836.a0f9, 0x0eec.87ec,
0x5c56.935e, 0x7a1b.95c8, 0x6d18.5685, 0xe662.0d67, 0x8a85.b3ac, 0xfd15.5e46,
0x247a.8e5a, 0xf235.2b8b, 0xf2f5.4bf3, 0xb3b0.389a, 0x83fb.c390, 0x99ad.ac02,
0xc137.35ba, 0x2319.8362, 0x36b3.073a, 0xe721.9835, 0xcbe0.1f0b, 0xc2d8.fb53,
0x0996.27f7, 0x10cc.169b, 0xc80b.4e26, 0xd0e1.505b, 0x81cd.2cc4, 0x144f.03d1,
0x413e.034c, 0x61d8.80ae, 0xadc9.8ddf, 0xfffb.eadc, 0x61f0.aae8, 0x2d78.b6a6,
0x588d.fedd, 0xc075.73bc, 0x5903.b736, 0x7066.1fa5, 0xdd1a.e239, 0x3615.f595,
0xcaf5.1bdb, 0x9ed7.d727, 0xe9a5.eea3, 0x0351.730c, 0x0c6b.84a4, 0x1b2a.6397,
0x5c50.45fe, 0xbbca.8f44, 0x584d.5cf3, 0x9882.f442, 0x0044.58bf, 0x9972.56d3,
0x1ca1.d68b, 0x5b6a.3bb3, 0x3ed1.0189, 0xc1c4.2ddb, 0x184a.bb58, 0xd1f9.1e9c,
0x50c1.7bd0, 0x05e0.3710, 0x3b1f.01b2, 0xab8c.be7c, 0x7486.700d, 0x98ad.a5d7,
0x6e4c.07fe, 0x3ce0.dede, 0x6db7.48e4, 0x7a21.0fbf, 0xed20.8948, 0xf21b.80c4,
0x19cd.b0ff, 0x4545.b8bd, 0x8443.e133, 0xc211.80c5, 0xc2d8.a7f6, 0x3c91.b290,
0x17ca.2550, 0x4a7e.7260, 0x00f1.850a, 0xc885.7af3, 0xfeea.136a, 0x795e.2f7f,
0x131a.ff2e, 0x5313.2f1e, 0x0a8f.f909, 0x5f6f.4e34, 0x7af9.dd71, 0x1dd3.2b3f,
0xff96.5f28, 0xec05.3e8a, 0xd20a.bf56, 0x87e7.e8d9, 0x64ec.3c10, 0x15f0.060c,
0xd4d9.de1b, 0xe5ac.2f0a, 0xd6af.289b, 0xacdc.7b8a, 0x3c3d.8ae9, 0x789b.faac,
0xe51d.47d8, 0xdf1e.805f, 0x1f43.16b9, 0x17dd.b583, 0xaa37.6d40, 0x25da.eadd,
0xf915.e3ff, 0xaf55.c6d3, 0xde1a.edf7, 0x705e.c6b5, 0x2bef.d7ac, 0x9941.31a3,
0x338f.e271, 0xfb98.3f08, 0xcf34.10fc, 0x10ff.1409, 0x1ffc.1ff6, 0x00c5.9fc0,
0x7d92.2060, 0xf5f6.dc41, 0x21ba.7dd8, 0xd008.a0bc, 0x064a.7787, 0x3526.f316,
0xc61c.8b7c, 0x3e35.00a1, 0x8c80.7a40, 0xad4d.7e90, 0x1952.d9d2, 0x202e.4597,
0xf10b.986f, 0xf5ba.451f, 0xec90.6f4b, 0xc445.94cb, 0xb466.4ad1, 0xdf3f.351c,
0xaeca.be0b, 0xb230.5c73, 0xff55.0181, 0xdbca.b659, 0x06dc.49f8, 0x7bdf.27ca,
0x4fb6.c82d, 0x8c01.9de2, 0xbb79.ae69, 0x64b9.dc33, 0xfa5b.f920, 0x64be.165a,
0x6523.2ab5, 0x7d8f.3cb5, 0x93f9.5596, 0x9a93.556b, 0x7ebb.2958, 0x67be.fe59,
0xaac5.1fed, 0xf8d9.c102, 0xf5bc.f43b, 0x735b.98dc, 0xc7e3.e66c, 0x6c84.e340,
0x363e.dbf6, 0x183d.c2f1, 0x06da.47d6, 0x15c1.9935, 0x18cf.b89e, 0x4f8c.7c23,
0xeccc.0fc8, 0x9025.9b3f, 0xca99.f508, 0x8e0a.96c2, 0x0e91.4711, 0xec1f.509e,
0x8076.96c8, 0xbcf0.3004, 0xde35.5842, 0xf19e.0eb9, 0x4544.1215, 0x4344.08d3,
0x17f2.2b38, 0x457e.be6a, 0xfec9.790c, 0x7d57.eb29, 0x0199.0304, 0x340e.1800,
0x25f2.3037, 0xa162.f769, 0x9702.fd80, 0xbcb3.c7ee, 0x7fc9.2aeb, 0xade0.e41f,
0x7600.260b, 0xc3bb.7c97, 0xdbb5.d977, 0x9f1b.27bc, 0x79ea.d27b, 0x3984.ea07,
0xe213.79a8, 0x220f.bcf8, 0xae73.ba76, 0x3b69.89f8, 0x4fbf.0ab2, 0x9c02.c540,
0xed9b.7fcb, 0x4479.262b, 0x670d.fb66, 0x854a.767e, 0x5467.f880, 0x73bd.3072,
0x19c9.fd93, 0x1316.9ecb, 0x2ca1.c110, 0x7058.3373, 0x0f10.e67e, 0x1066.014d,
0x09e4.313c, 0x791a.81e8, 0x0007.005f, 0x3f5e.a60a, 0xa312.6b30, 0x3033.2330,
0x70cc.42a3, 0xabe1.cfaf, 0xab51.7fe4, 0x072a.f08c, 0xe0a6.cc8d, 0x272e.68bd,
0xfcaa.c5d7, 0xbcf5.c98f, 0xca5c.cf62, 0xb3d5.ee2c, 0x5cc0.5597, 0x53f3.a7db,
0xa727.39e4, 0xb783.7d26, 0xbde7.f6c4, 0xb87b.1488, 0xe0b3.eab0, 0xaedc.3183,
0x3fb8.9265, 0x0487.8941, 0x51a8.1382, 0xbd95.b1d3, 0xd6f0.b8f6, 0xdc0b.299b,
0xf031.e0a0, 0xe276.4fc5, 0x2c77.b8a7, 0x81c6.c620, 0xff92.3e4a, 0x171e.2791,
0x1d5d.bc97, 0xaa8b.ffe3, 0x2239.b78d, 0xdc63.37df, 0xd4fd.6335, 0xb419.bb7c,
0x1b61.1c89, 0x1c57.0f36, 0xba5c.d8ac, 0x0138.dec9, 0x7929.f49a, 0x61b4.60dc,
0xb382.0053, 0x4e86.6753, 0xa14e.0de0, 0xc669.4109, 0x7d7c.7fb2, 0xd733.7d4a,
0x3993.e142, 0x795a.6438, 0x0ef0.dc06, 0xf656.3ba3, 0x85f1.02f5, 0x78b7.3890,
0xd890.8085, 0x2ae5.9970, 0x5344.51f7, 0x1fc4.83fd, 0x190e.05b6, 0xb180.80af,
0xdd53.6192, 0xf869.5d13, 0x2ac7.5b05, 0x07df.8981, 0x284d.87bf, 0xf41f.7915,
0x319c.ae01, 0xb5bc.faa4, 0xe062.1b32, 0xacf8.aaf9, 0x71ef.dc23, 0xb11f.885d,
0xaeff.efc6, 0x069b.57fb, 0x9af9.19dd, 0xee37.cb05, 0x2ba6.ea5f, 0xdad0.96de,
0xe33e.e174, 0x26e3.7f76, 0x94c6.54ad, 0x998b.9417, 0x882d.802d, 0x31fc.007d,
0xd599.dc20, 0x01c0.6673, 0x7e7f.8473, 0x0406.f300, 0x373f.8434, 0x0ee4.cf22,
0x6fa4.07ac, 0x0138.30ec, 0xd1a9.fa13, 0x23f4.acff, 0xe21e.fc45, 0x3df4.a688,
0x8023.1039, 0xd8f6.0588, 0xb052.b1f5, 0xd5f9.0918, 0x125f.1fca, 0x1dbc.b225,
0x017f.4f98, 0x24bb.ece5, 0x03f9.3fa0, 0x83ef.0f84, 0xccdf.51ff, 0x4bef.0876,
0xbcf8.7853, 0xa33d.31c3, 0x76c8.79fd, 0x5d96.a18d, 0x8e6f.6146, 0xf49b.d5d4,
0xa5ea.7101, 0x947a.9da5, 0x61e6.1e25, 0xcdc3.2af7, 0x3fb5.168b, 0xade6.a59b,
0x00fe.dfc1, 0x4dc6.030f, 0x0808.f588, 0xeed1.0d3d, 0x0dea.a71d, 0xeeec.772a,
0xc5ed.c6bf, 0x6eec.b1c2, 0x64a3.bc65, 0x9a59.cf63, 0x2345.11d6, 0x7284.1772,
0x3ae1.3c26, 0xfeb0.f5e6, 0xc480.7043, 0xcddf.06f4, 0xf2e2.1fe9, 0xfdc0.7821,
0x4501.8053, 0xc833.9945, 0x13ea.53c3, 0x8f58.1166, 0x483b.e09e, 0xf87b.21fb,
0xac01.e315, 0xe020.6022, 0xd852.748c, 0xc079.e879, 0x3e2f.9faa, 0x715f.f7a1,
0xcf5a.c200, 0x8de5.e379, 0x9204.057e, 0xfcb7.7f1f, 0x6f91.af0c, 0x732e.0a79,
0xb4ff.eb0c, 0xfb92.dc50, 0xb2a9.9198, 0x9441.86f2, 0x0ae1.fda0, 0x96d2.ca66,
0xa997.6b3b, 0xd8a6.8792, 0xbcfb.d06b, 0xcba9.09ab, 0x0427.95eb, 0xb9e8.06ba,
0x0e9e.a57f, 0xbefb.c752, 0x4980.7a77, 0xc60e.1ba7, 0x7a57.7fdb, 0x43bc.4718,
0x6e9c.ee95, 0xf0dd.8399, 0xdf2b.f792, 0x91b0.fde4, 0x3661.e03e, 0xe122.dc15,
0x7018.e934, 0xe7f1.e6fd, 0x95cd.fbe6, 0x469a.e103, 0xe90e.bf84, 0xf040.ce01,
0xe1fe.118c, 0xf54c.cfea, 0x28e6.0d89, 0x762d.8e01, 0xce13.ef60, 0xe80b.f994,
0x0c00.7a13, 0x2047.9a50, 0xbfc3.1c58, 0x2be4.ce9e, 0x7822.0548, 0xc2ee.c19c,
0x327d.1e09, 0x92f5.860b, 0x4388.20a8, 0x1a79.ab65, 0x1c26.9e68, 0xcaef.815c,
0x2c97.aee8, 0x9ab2.767b, 0x09b4.be39, 0x7819.c8e9, 0xa522.fa09, 0x2376.6cac,
0x6486.7a07, 0xc12e.d4e7, 0xda2e.b0de, 0x3d9b.ffbb, 0xbb3d.0060, 0xd8f9.ba25,
0x15c1.7497, 0x1215.93a7, 0xe7df.b78b, 0x24f5.de8d, 0xfd9e.a9b7, 0x0643.f9d2,
0x3fad.0fa5, 0x67f3.aa26, 0x4f7e.b446, 0x548f.de6f, 0xe03f.d907, 0xf371.0aed,
0x2b3d.03fe, 0xc1bb.0f00, 0xb570.8733, 0xb790.e0ee, 0x8fe4.99cf, 0x4fe3.622d,
0x0467.c28f, 0xbaba.33ba, 0x8404.e153, 0x0292.31be, 0xd198.ed18, 0x7270.8a1e,
0x8388.d44a, 0xd31a.4419, 0x29ff.90a6, 0xf6cc.d7f4, 0x8264.df38, 0x90cc.4a2d,
0x0491.c031, 0x7c05.0611, 0x38f5.6f5e, 0xe6fe.0b4a, 0xc2af.4a82, 0x0434.36a4,
0x1eba.1096, 0xf28e.0831, 0x9d9b.4e9c, 0x95e2.ad79, 0xd760.a051, 0x23e1.0d52,
0x0144.185c, 0xb06d.2e30, 0x6388.b924, 0x08a8.d6e8, 0x25f0.dc3c, 0x187b.b55d,
0x6b24.2ef2, 0xf82e.966a, 0x7af2.a5d0, 0x3fb5.fe45, 0xa0cf.5d4f, 0x8b60.ade2,
0xa4c1.1fca, 0x0f64.a5a7, 0xe00c.54b3, 0x87b2.a9f3, 0xf0f9.e881, 0x17a0.1cf6,
0xbf31.2e6c, 0x2253.fad2, 0x1734.03d3, 0x60ce.c1cc, 0xe086.87ad, 0xccf0.4c66,
0x11fe.c1d0, 0xfb8b.33a5, 0x637e.a42d, 0xfe14.fff8, 0xde41.fe99, 0x67f7.a087,
0x299a.6f04, 0xda0c.4716, 0x1702.46a9, 0x20c9.e861, 0x99f1.dc3e, 0x1874.4bea,
0x7e81.a6ec, 0x9c1b.5d04, 0x56ea.b5a1, 0x7e86.5936, 0x4280.33c0, 0x1d28.da40,
0x29a1.bf40, 0x8a29.d5d2, 0x361f.65e4, 0x6902.b1d6, 0xb915.e03e, 0x1e7e.c15d,
0x8018.061e, 0x8913.f4e8, 0x8b26.70f7, 0x053b.2fa0, 0xe848.79ef, 0xcd60.29fb,
0x28bf.8892, 0xdb41.ae9c, 0x02cc.4fcf, 0xcfb1.c1d9, 0x8f50.23bb, 0xa267.277b,
0xec05.9e9f, 0xa7f1.c58f, 0x62f3.f996, 0xf8ba.1fe5, 0x0f8e.b808, 0xd04f.8aed,
0xf149.73d6, 0xe1dd.1f24, 0xd4bc.7fe1, 0x7f1b.4a43, 0x3e1e.816e, 0x9031.fe1d,
0x5325.c29d, 0x6516.63c0, 0x708c.c44d, 0xd466.0684, 0xfec8.04c4, 0x5239.fc25,
0xc442.e404, 0x2606.8873, 0x6cd2.6a77, 0x2810.eccc, 0x9145.0c72, 0x6046.a1e8,
0x34f1.de83, 0x2596.2e8b, 0xf065.1c46, 0x579b.053e, 0xa4d8.2629, 0xe4c2.94f1,
0x3581.4273, 0x6ae2.a9d2, 0x80fe.f43e, 0xff10.00a4, 0xa0e0.887b, 0xcd60.6a19,
0x527c.129e, 0xf00f.95a2, 0xc807.a244, 0x27ca.c367, 0x43ca.0663, 0x0433.7eb2,
0x5cc9.1a36, 0xda75.3118, 0xc302.2dfa, 0x9e7b.2a30, 0xac82.6f17, 0x2942.fbb5,
0xf9eb.e97d, 0x20c0.7a66, 0x9f1c.32ef, 0x058f.e852, 0x54b4.f96e, 0x957d.1bbf,
0xe7ad.467c, 0x6be7.c682, 0x7acd.f9e3, 0x5c9e.aec8, 0xeebe.77ea, 0x021d.04f4,
0x10f8.921b, 0xe03f.9ba1, 0x9a3b.f81f, 0x627c.252b, 0xf0ca.7d96, 0xd30e.eecf,
0x4101.b9fc, 0x60f0.1104, 0x4837.d233, 0x1495.0fee, 0xc8b0.4282, 0x0207.487f,
0xd01d.f8b2, 0xcd16.a0ca, 0xd438.829e, 0x3c47.3220, 0xc03d.8640, 0x9757.6691,
0xfc8e.4bc5, 0x863f.85d4, 0x13a8.3c78, 0x1e8f.1591, 0x24af.9f0d, 0xa7fd.9406,
0x2d3f.1664, 0x4c6d.493f, 0x7533.06d9, 0x6c62.1e2e, 0xd67d.890d, 0xbd72.2c2b,
0x3526.3877, 0xd3fd.a63d, 0x9dcd.3221, 0x3c43.49b0, 0x36c0.5caf, 0xdbcf.f06f,
0xa261.f112, 0x2b87.498e, 0xa932.5ffe, 0xf946.93d2, 0x7a26.19cc, 0x4acc.84fe,
0x87f2.0a8f, 0x2bb3.fa40, 0x3c6a.7f75, 0x4f4e.b1cb, 0x7773.d38c, 0x7833.3e5b,
0x0a1d.07aa, 0x30fb.da38, 0x9469.2070, 0xbc88.e675, 0x7081.0263, 0xf002.7069,
0x8663.a772, 0x980e.cb75, 0xeb61.9ffd, 0x6c83.4a39, 0x6bc3.10e2, 0x7f35.649a,
0x3584.e3db, 0xe249.a123, 0xe601.9c69, 0xd1d4.e33d, 0x2666.547e, 0xd323.1c52,
0x21ec.b6c4, 0x2679.65ed, 0x2028.a417, 0x707d.d40c, 0xd622.1e8a, 0x37f6.b110,
0x277c.8740, 0xf233.f681, 0x3b62.9f54, 0xb11b.234f, 0x460b.337a, 0xbb1f.5925,
0x1673.d28c, 0x592b.7bc6, 0x2f20.1b98, 0x2015.c33a, 0xa0f3.3973, 0x725a.5565,
0x7860.c23c, 0x893d.88b6, 0xdc76.c59d, 0x97da.fe37, 0x737a.f7e4, 0x32bd.1d16,
0x8002.9a40, 0x3e20.6b3f, 0xecc6.5c28, 0x4aaf.85cf, 0x4a29.75b7, 0xb426.8fe5,
0x5a30.d1a8, 0x9e72.7a74, 0xbbc7.261e, 0x97bb.c7ea, 0x00d8.eab7, 0x4638.7fd9,
0x9efb.36a0, 0xc588.08c3, 0x0deb.104f, 0x93e5.d3d3, 0x0fcb.07fc, 0x5005.1c1e,
0xec67.f8e4, 0x113c.39e9, 0x50ce.ac51, 0x12df.81d3, 0xe6dd.888f, 0x8c22.0da4,
0x19e4.8d22, 0x53e7.e802, 0x80cf.8f16, 0x453d.c0e6, 0x8c51.8e61, 0xc878.f666,
0xc33b.1446, 0x8d27.ce27, 0xb2d8.d17f, 0x106b.5f49, 0xdfed.a062, 0x3588.df05,
0xa9ec.b109, 0x3e3d.17d2, 0x4dec.91ba, 0xcb6a.4679, 0x4180.2098, 0x43d5.0344,
0x4408.6d70, 0xeeff.0116, 0xd82b.3f5f, 0x41e8.d84a, 0x18c0.7862, 0x40bc.d79e,
0x93fd.be95, 0xda81.e528, 0x7a1b.d3c5, 0xf52c.ad41, 0x9fca.9208, 0xc3e0.b743,
0xfe3a.4b56, 0xafc0.e749, 0x4c64.1ecc, 0x830f.e0b8, 0x4a8a.93e6, 0xefcd.cd3e,
0xd6c2.ec70, 0x1e63.62c3, 0x1e3d.a7a9, 0x0e69.6476, 0xd1e0.9b29, 0x7de6.f24d,
0x1c6e.c10f, 0xa13b.b132, 0x3384.2062, 0x4c3e.43fc, 0x9e1d.c000, 0x2fc8.50ce,
0x1fc8.02e0, 0x909e.6bc0, 0x78b5.3c23, 0x290d.0d81, 0x80c8.e89c, 0xe82d.ca94,
0xce84.9046, 0x1bc1.2a01, 0x2bf4.78a2, 0x63c6.9c79, 0x0b12.c695, 0x39a2.b35d,
0xab24.64f8, 0xf2bf.94ef, 0x0e69.f51b, 0x3995.0bf2, 0x6601.4cca, 0x16a4.b4de,
0xd4ee.0c54, 0x0887.4f4b, 0x6701.7625, 0xaf36.0c50, 0xf113.9a98, 0x4e7b.395b,
0xb959.b62d, 0x35e4.7cba, 0x333e.2eca, 0x66a7.9ec6, 0x9dc7.7bcf, 0x54dc.f47f,
0x2778.3efb, 0xc8d3.b2f0, 0x4df3.fa43, 0xf150.29fd, 0x7a2e.a2f1, 0xa765.487f,
0xf72b.1987, 0x74f9.e0a3, 0xc374.9956, 0x3311.e063, 0x6568.f48b, 0xd555.0666,
0x78ff.fef0, 0xd7fd.859c, 0x4581.bb21, 0xed01.f262, 0x7844.a7e6, 0x1590.92f0,
0x0484.e315, 0xb130.7e00, 0xa026.233b, 0x8c4d.6023, 0x4ce4.fdee, 0x896b.309c,
0x2b7e.8ea0, 0x1d4d.0780, 0x21e3.3d84, 0x4148.1ee7, 0x33be.d92d, 0x0392.c9ec,
0x4fec.1e36, 0xfd9a.e952, 0x667d.c0c6, 0x0f2e.e4a7, 0x57f0.2c29, 0x7310.9b25,
0x677d.eeef, 0x8099.3563, 0xa412.b07e, 0xc266.93ba, 0x9d8e.9fa1, 0x7df0.248e,
0x0801.382f, 0x5f9e.10f9, 0xce18.09f9, 0x8338.f543, 0x0177.4931, 0x23d7.1851,
0xadc9.c1c5, 0x6d49.fc0f, 0xc9ec.ef64, 0xfbdf.284b, 0x29fd.3463, 0x0c75.1263,
0x01a3.adea, 0x0cd4.0091, 0x74a4.f87f, 0x0500.49c0, 0xb2db.3d10, 0xe2c9.83d2,
0x18c9.8603, 0x956f.83f8, 0x0806.9c03, 0x99de.8150, 0xca07.f193, 0x90e6.9a37,
0x4ec8.7997, 0x9874.2b27, 0x4b29.9fc1, 0x3a06.7a44, 0x2005.ce6f, 0x1266.0540,
0x5f2c.8d20, 0x0ed7.d560, 0x6f6e.a674, 0x8f14.0b06, 0xa21f.2849, 0x5c38.384d,
0xcb62.4da0, 0x553f.d843, 0x3902.b903, 0xae79.5fd6, 0x65e7.a9da, 0x0832.1b14,
0x7359.a454, 0x3d3f.bc26, 0xea76.c455, 0x8ce4.9496, 0xf764.8470, 0x0efb.1678,
0xea75.88c6, 0x4b8d.3ae3, 0x01f4.ec3a, 0x9c5f.0022, 0x60f0.54f1, 0xafe8.129c,
0x2339.b679, 0xfe4f.8c51, 0x7487.7898, 0x3d74.410b, 0xb776.8bb3, 0x1793.fe76,
0x7940.1b14, 0xe314.67a7, 0xa46d.de51, 0x3bfd.e468, 0xa634.6a3d, 0xfc3b.517b,
0xc2b5.c849, 0x3b0d.6240, 0x2a0c.7997, 0x8028.8f35, 0xe9b6.da78, 0x7176.26a9,
0x08a7.f104, 0x583f.34ed, 0x4a7f.a89e, 0x839c.becb, 0x001f.08f1, 0x824f.c00b,
0x8247.01fb, 0x123c.8890, 0x625c.e034, 0x8799.219d, 0x4c55.18e6, 0x2062.8295,
0x1290.9c8a, 0x38b5.239c, 0xa138.1863, 0x9a41.8189, 0xc0b4.9b83, 0xa93a.d263,
0xaf04.88d9, 0x6490.9e42, 0x5616.0b1d, 0x92d4.f843, 0x9c33.2b4d, 0xf564.258a,
0x199c.e50a, 0xac71.4c7b, 0xd545.4f53, 0x3033.6494, 0xe041.7647, 0x0c7a.427f,
0x333a.5203, 0xeb35.9426, 0xbfa1.05e7, 0x994c.90ed, 0x70c4.3953, 0x51b5.f3a5,
0xab9d.eeea, 0xc5e2.9ece, 0xca57.febb, 0xc4a3.e2fc, 0x8ba3.59fd, 0x2c80.6c5a,
0x6dcf.8bbd, 0xa008.f2ef, 0x9e77.3227, 0xa433.fa24, 0xe3e0.4a9d, 0x52f0.f5d2,
0x8c7a.c972, 0xdfc2.c339, 0x945b.4f6e, 0x60e7.84de, 0x6c4c.45e8, 0x99e4.32e6,
0x1f4b.85a4, 0x7fa7.f87b, 0xb6c7.a338, 0x6801.fde9, 0x96c7.6463, 0x4057.b01b,
0x03fb.1f79, 0x6c0c.55e9, 0x1438.1d80, 0x88d5.602e, 0x1d46.7d33, 0xe952.4541,
0x8327.8928, 0x2c79.c0a9, 0x4e01.414b, 0x69d8.0111, 0x8192.9c50, 0xb640.26a2,
0x6202.b35a, 0x6213.5418, 0xa7ba.f39d, 0xe49b.722c, 0xb731.da91, 0xeef8.5381,
0x4cc8.6319, 0xc010.85ca, 0x78f7.08b8, 0x4f95.3ea6, 0xea1d.a2e6, 0x79e9.c994,
0x547f.0b9d, 0x13bb.ad08, 0x99cf.efb7, 0xdd23.a3e5, 0xa1e6.59d0, 0xb799.4c12,
0xb5ae.1155, 0x1d9d.eb8e, 0xe85f.e64a, 0x7478.d439, 0xaf43.989c, 0x5c2f.500e,
0x76d4.f1e4, 0x51f7.53ce, 0x3783.161c, 0x7e7c.c082, 0xdb2e.38c8, 0x45d1.2138,
0xf64c.555b, 0x1067.4ff0, 0xdd2d.8626, 0x5610.f8b5, 0x9dcb.0810, 0xd191.3a3b,
0x11cc.7c20, 0x206c.1c62, 0xc54f.a40b, 0xc030.d018, 0xbc83.e82f, 0xb50c.e48b,
0x511b.1405, 0xf96d.626f, 0xd5c7.1bd0, 0xa1d1.0260, 0x1d04.8527, 0xbcc3.b83d,
0xc331.3799, 0x23e6.89ef, 0x6e2f.40ff, 0x4c9c.04e9, 0x1a14.8481, 0x1b63.4730,
0x6931.8d79, 0x29e1.5c32, 0x2650.e53b, 0x3900.bbf7, 0xd01f.876a, 0x54f5.3d03,
0xb6d2.a9e9, 0x5e6c.3e32, 0x5ee8.b9b9, 0x391e.94ee, 0xa542.fd19, 0xe1bb.8367,
0xf191.81eb, 0xc6d3.05a3, 0x4b77.1fd6, 0xa7cf.9096, 0x781c.78ec, 0xfb00.c89b,
0x3c95.8c93, 0x6284.4042, 0xd294.4c66, 0x0a78.1b21, 0x9c90.7376, 0x3796.f797,
0x57d7.3198, 0x23f0.0093, 0x6e2c.027c, 0x1fce.c27e, 0xe848.8e66, 0x4e60.41ac,
0xa2f8.aecf, 0xccc2.a2a2, 0xcc98.57a1, 0x8f24.4194, 0x8732.4cd5, 0x44d8.ccce,
0xf1e7.2988, 0x4545.3ccf, 0x538b.1a25, 0x1d3f.da10, 0x2e11.416b, 0x029b.522c,
0x27cb.9176, 0xa25b.c7b2, 0x2123.767c, 0xcc64.fbf7, 0xb584.3566, 0x663d.1782,
0x162a.b383, 0x3400.2911, 0x944f.ef45, 0x44c7.c457, 0x8192.3d9b, 0xb92f.5653,
0x4cf2.69f2, 0x194c.f9de, 0x5b16.0b3d, 0x9795.6c40, 0x742a.1cf0, 0xfb46.face,
0x422b.f117, 0x0a56.8a47, 0xcf93.f849, 0x5638.46a3, 0xa5f1.fd6c, 0x3b6c.0ae6,
0xaa26.dca6, 0x27d9.41c2, 0xd3a6.c133, 0x67bc.b133, 0xdef4.79c0, 0x4730.5d04,
0x5033.c7c0, 0x51a1.e6ef, 0xac21.060e, 0x32b6.c154, 0x268c.f0ae, 0x9072.1e8f,
0x3824.f40e, 0x9ff8.9ce2, 0x4375.12d8, 0x0513.863a, 0x6307.2a1d, 0x98c8.69b0,
0x8bfc.17b1, 0xffa2.b67c, 0xa256.0729, 0x6b8a.0d13, 0xfae2.8d10, 0x0020.096e,
0xe1b7.7185, 0x4518.500b, 0x3504.7958, 0xad77.26a4, 0x41ae.244a, 0x2c90.3343,
0x13e5.8b94, 0xa000.bd68, 0x79aa.aa9c, 0xa96d.bc9d, 0x38ba.85a7, 0x52bd.089a,
0x5cc8.57b6, 0xed0f.e153, 0x1cf9.24bd, 0x3800.13bc, 0xd800.700e, 0x5256.89e2,
0xa17c.529b, 0xc7aa.689e, 0x1403.13b6, 0xfcae.635e, 0x25b6.a619, 0x80b8.2112,
0xe4ac.c74f, 0xb71c.8a9e, 0xe1ad.2d96, 0xe673.14c6, 0x1013.9d91, 0xc2eb.d29d,
0x9fd6.1aed, 0x44d0.a261, 0x663e.9086, 0x8265.183d, 0x3ac0.b133, 0xdd45.8e0b,
0xdc30.9b40, 0x19e5.b0b5, 0x2633.48ab, 0xde45.6757, 0x5a39.0267, 0x396e.85f4,
0x81ba.a057, 0xfd60.197a, 0x9c29.2794, 0x194c.61f1, 0xd904.1990, 0x08de.43bd,
0x9d52.036e, 0x543e.4a91, 0x23e1.00e6, 0x7c05.3d09, 0xd16d.cf20, 0x5188.a6c3,
0x392e.fcbf, 0x677f.ad04, 0x93f8.d7c6, 0xf379.fde4, 0xe0ef.8485, 0xd83a.3e3b,
0x3e9e.1951, 0xe775.4fec, 0x155a.c6c3, 0x49fb.4981, 0x89f9.09a0, 0x3562.ee14,
0x42a1.29cf, 0xe0f9.8fa0, 0xcebe.d942, 0x68df.2855, 0xba22.3f5d, 0x582d.6860,
0xad57.33dd, 0xd8a5.3b85, 0x8571.8221, 0x5ffb.31ff, 0x1410.3490, 0x1630.029e,
0xec4b.014c, 0x4e7b.4e6e, 0x48ee.48b4, 0x1d6c.230d, 0x5255.8b1f, 0x0ff6.0fe2,
0xc61f.25c5, 0x07fb.467c, 0x3ffa.0118, 0x7356.33a4, 0x9c39.29c1, 0x28b5.4393,
0xbea8.26aa, 0x5633.c3b5, 0x25a9.5419, 0x1f17.1463, 0xb623.b710, 0x4a70.8ea3,
0xf600.1066, 0x8047.e550, 0x70c1.b24b, 0x1b8d.335d, 0x6810.556b, 0xc082.d94e,
0x7fc2.466e, 0x5494.213d, 0x4345.1d4d, 0xe356.07c3, 0x563d.9b63, 0x45ca.c0bb,
0xb69c.e0e7, 0x4e96.a24e, 0xeb59.1fc2, 0x0a2e.a015, 0x028e.444e, 0x14ee.be0d,
0x3ba2.0bd9, 0x5d56.3d3c, 0x9658.8901, 0xf1c5.3883, 0x8af0.63a5, 0x3ce2.2bb0,
0x3ef7.a5e1, 0x27c7.9c2d, 0xffce.a793, 0x1e92.41bf, 0x68d3.de85, 0xd188.4803,
0x40c2.664c, 0x240f.2784, 0x6b29.9fa9, 0xa360.ae02, 0xd8e7.db21, 0x2485.a54d,
0x3327.040c, 0xf220.1ead, 0x68a0.7907, 0x41d0.633f, 0x023f.429c, 0x0ab2.0aa0,
0x46aa.f2d2, 0xa58f.b21d, 0xa596.d564, 0x40c7.312c, 0x2e5e.870c, 0x3382.2ef4,
0xc493.82cc, 0xd744.4b2c, 0x2a72.1808, 0xf47b.5b58, 0xdf17.e9af, 0x9f22.5af1,
0xff33.d7ae, 0xb573.0445, 0xd13e.077b, 0xb9d2.0cd9, 0x8a86.c23b, 0x0470.a118,
0x3957.1048, 0xa000.982d, 0x592a.20d8, 0xf682.19e7, 0x30d8.fd16, 0x54f8.2c7c,
0x388f.52fb, 0xb7f1.1246, 0x561e.6f3b, 0x182a.3170, 0x78de.07e0, 0xb297.f2a6,
0x3b00.2e65, 0xc38e.b6f5, 0x29f2.ae33, 0xe606.c564, 0x8030.0049, 0xd29d.ce12,
0x489d.4343, 0xb27f.71f3, 0xd608.a708, 0x3da0.ea27, 0x3f01.8263, 0x0881.aeef,
0xb901.61c0, 0x7861.c667, 0x1e21.c8a6, 0x2009.09b2, 0x9c7d.4e7f, 0xbf31.3131,
0x1534.7bce, 0x0901.7894, 0xb31e.e4e3, 0xf416.e848, 0x86aa.d657, 0x283f.47c5,
0x7c40.95e4, 0x08e6.a092, 0x40a7.cced, 0x171d.568e, 0xde93.30e9, 0x0f60.025b,
0x26a5.5304, 0xe2eb.2e49, 0xe214.f8ec, 0x94ab.e358, 0xe462.179f, 0x8941.457a,
0xa81e.73b1, 0x8af6.d28b, 0x2b45.2770, 0x74a6.c9fd, 0xfa27.fcf6, 0x7502.fd47,
0x6708.6919, 0xf649.fd85, 0x8256.03c6, 0xcc6e.a881, 0xbe9b.cec6, 0x533f.4d47,
0x466c.070e, 0x2aa3.053b, 0x0e26.c7f2, 0x08e0.defd, 0xfd19.67e9, 0xcee6.f201,
0xa067.821c, 0xb5a4.3fff, 0xac6c.bdb2, 0x84a7.a475, 0x6883.e483, 0x7aa4.a7fe,
0xaa3e.520a, 0x3c43.9036, 0x4677.a325, 0x192e.0ae6, 0x0bba.4c05, 0x7b28.2da3,
0xf4e2.7e44, 0xf780.9052, 0x97c7.7832, 0x682f.001e, 0x8c06.8030, 0x126f.b465,
0x8c18.85d9, 0x51ad.d413, 0x417c.6e97, 0x3902.5733, 0x63fb.5bfb, 0xa577.6982,
0x8f6a.779a, 0xf737.adc4, 0xf899.64d1, 0x678c.9ed5, 0xee58.8145, 0xadef.eb14,
0x7457.ad00, 0x5e17.f5e8, 0xa8af.501c, 0x81d8.a33f, 0x5c82.3b04, 0x95d0.4cc9,
0x1a23.0f97, 0x9800.66f5, 0xcf3b.ba71, 0x6cb5.9a21, 0x8f51.9806, 0x94c5.1419,
0x4ce2.95aa, 0x872a.c970, 0xbbfe.f5a0, 0x6773.2b31, 0x420f.5a67, 0x6110.479b,
0xa381.10f7, 0x453a.14f7, 0x9643.56ac, 0x0e6b.7e22, 0xa0fb.51ad, 0x8854.8e93,
0xd120.6419, 0xd842.3279, 0x09c4.72c6, 0x154d.109b, 0x61d4.62cf, 0xcae3.3984,
0x19c2.5c14, 0x87b1.9bfe, 0xd90d.3a5f, 0x5682.0532, 0x2d64.3332, 0xa70f.6d9c,
0x92a9.f93c, 0x0a12.2749, 0xf248.e3af, 0xe436.cc53, 0x8b74.3adc, 0xdf56.5a05,
0xf759.1484, 0x2c10.0d2d, 0xd9af.c2fa, 0x2020.2bd5, 0x4f50.ed9f, 0x6c54.10ec,
0x4bb5.bad1, 0xf50c.fcea, 0x1849.d21f, 0xc10e.501c, 0x01d1.8625, 0x702f.040c,
0x4a78.9a68, 0xbe6b.0e2a, 0x0b2d.6a54, 0x9070.e1f2, 0x43ea.2e27, 0x9806.ea52,
0xa43e.df2c, 0xbfd4.ced9, 0x50ed.c205, 0x8116.1b95, 0x7bb3.bfdc, 0xa600.0e54,
0xa96f.6634, 0xee98.c65a, 0xc326.3881, 0xeba0.d504, 0x8130.a999, 0xfe84.ecfc,
0x8954.0c78, 0x9366.0d96, 0xbb0a.9085, 0x710a.4f4a, 0xca02.f2fc, 0x4cc1.d90b,
0x1336.7f84, 0x00c8.8bc3, 0x27bf.8055, 0x87a3.383d, 0xef8f.653b, 0x98c2.fc8c,
0x5c77.e105, 0xffaf.37e6, 0x779f.5e17, 0x0156.5766, 0xef2b.bb14, 0x97fb.fecb,
0xd060.ff8e, 0x3e6f.60db, 0x37b1.6dea, 0xdc0f.2fe8, 0x0cde.6feb, 0x1b7a.8fe7,
0x5bf9.d9fc, 0x3dbe.2dbd, 0xf78e.f41f, 0xf1ca.e1e0, 0x987c.3d9f, 0x9f37.b16f,
0x0eca.dfcf, 0xf0fe.60f0, 0xff04.fcad, 0x7e7e.3855, 0xb0f3.e580, 0xdec1.b643,
0x3fdf.97b3, 0x7faf.1dec, 0xff6d.a1fc, 0xc3fd.ffa8, 0xcfbf.ec5f, 0x7958.378f,
0x3edb.6dff, 0xd86f.e03b, 0xa6bd.fff1, 0xbfc1.fef7, 0x70db.de9f, 0xdbfb.679f,
0xea3d.1ff1, 0xb2e8.ffef, 0x0136.7dbf, 0x2b07.bcb8, 0x72bf.cffb, 0xbe7e.dbd4,
0xbef2.bc71, 0xfc7e.7fbf, 0xa7ff.636f, 0xbfcf.f3bd, 0xb4bc.7abc, 0xa5af.de3f,
0xe6bc.9af1, 0xfbfa.8f0f, 0xed89.f367, 0x5c42.7cd3, 0x9c4a.0099, 0x78ca.d1ff,
0xb47f.f757, 0xcf9a.7fb2, 0x63df.2b5b, 0x2b97.e63a, 0xde56.0fdb, 0xa7bb.fa8f,
0xb90d.a1ef, 0x795c.df7c, 0xed5c.bfdf, 0xea57.cf1e, 0x1f9e.da7d, 0x2f1f.ed3c,
0xb9d7.fb8a, 0x48a0.f879, 0xb3c7.cf47, 0xb9e3.caf7, 0xbee7.0f3e, 0x44ee.e8ff,
0x77b0.ff47, 0xc7ab.0782, 0xef1f.9e7b, 0x1f3f.efb9, 0x3e81.95fc, 0x613b.d078,
0xfcfd.e0f8, 0xef9f.da78, 0x711f.2e6d, 0x23e1.1ec2, 0x95b3.ed1b, 0xdef6.1ffd,
0x8c3f.fd87, 0xbb8c.3906, 0xfcc7.fedb, 0xa17f.ef80, 0xf51f.fdf6, 0xa70f.dff6,
0xde99.eb7c, 0xbf7f.9b7f, 0xf147.ff6a, 0xcf3e.1f0a, 0x3980.3405, 0xcffb.4b3d,
0xbf1c.fee3, 0xd22d.c4a6, 0xf815.c427, 0x0dee.f1d7, 0x6ed1.ffdf, 0xe9a0.ff3c,
0x7915.2fed, 0x8afc.4ba0, 0x6e23.cf5f, 0x04bb.fbed, 0x2c26.e11f, 0xb8f3.fed9,
0x0372.3e3f, 0xd1cb.8e79, 0x06cf.7bb7, 0x0e3f.3f43, 0x1ffd.c658, 0x39dd.876a,
0x388d.e4a7, 0xfda5.6f1f, 0x5047.7bcb, 0xf5e3.37e0, 0x9ffd.f73d, 0x9f37.42cb,
0xa8e3.ff69, 0x3fe7.cf4f, 0x6085.d1f0, 0x8f9b.2cf0, 0x78f2.9ef0, 0xbc36.5d1e,
0x2bb3.186f, 0xc3d5.3860, 0xebb9.e0c1, 0x7ceb.afd3, 0x0f86.d0ee, 0xcfb3.e59e,
0xe385.1e0f, 0x87b2.fef9, 0xf1ea.2b47, 0xe3c3.e356, 0x06de.d1fe, 0x3d9e.0c6f,
0x5f5d.fcc8, 0xf115.cbff, 0xc854.f786, 0x6c8f.aea4, 0xe85e.e483, 0x32fb.a37e,
0x7829.b003, 0x967f.bd94, 0x5d02.478d, 0xc9e9.6771, 0xbcf7.78a7, 0xf406.3fb7,
0x47ff.690b, 0xe255.f8bd, 0x77a5.6f0c, 0xe41e.7141, 0xfa60.87fb, 0x0dbf.b7ac,
0x1f7e.efa0, 0xdcf2.7725, 0xff3b.db04, 0xdb26.ddbd, 0xf9f7.2ec1, 0x2b7c.fbaa,
0x7da1.8221, 0xf84d.3cf5, 0xdee3.ade0, 0xe0ff.b0fb, 0xd9fc.dedd, 0xede9.e797,
0x1d17.88e0, 0xe897.49f5, 0xe8fe.7c02, 0xfb4b.f9f8, 0xbcdb.d167, 0xf8bd.9bde,
0xaffe.7413, 0xe3cb.7b3c, 0x79b2.e0c9, 0x8fed.fbf0, 0x1057.2ecf, 0xbf90.60cb,
0xb67f.3c1f, 0xf07b.bd9f, 0xd7cb.4bd6, 0xf795.eb8a, 0xa6e3.c3fd, 0x378a.e92b,
0xd31b.bf7f, 0x5e6e.bcdd, 0x5c35.f39f, 0xbc15.e751, 0x6f6b.d2fe, 0x0fba.d1e5,
0xbf5f.fb2e, 0xfdf2.b971, 0xf256.f1ca, 0x7bff.8085, 0x9629.ec1f, 0xcbf7.d67d,
0xbf3c.7d67, 0x7f2b.2e67, 0x71c0.f96f, 0x7a37.fbef, 0x959f.07df, 0x2af8.601f,
0xdbd9.7ffc, 0xf897.ba3e, 0x1ef4.adfe, 0xfdc7.f3f8, 0x8733.0ff7, 0xec1f.9abd,
0x08b7.bcad, 0xe069.e39e, 0xde56.b7f9, 0xf867.2e67, 0x0bb3.efaa, 0x85ff.fe04,
0x967d.ffba, 0x7c80.185f, 0xc73e.f2b8, 0xfdf8.abeb, 0xfbf7.95dd, 0xfb8f.7788,
0x1595.ffd7, 0xff7d.9a80, 0xe1fb.e560, 0xf8ab.f7ca, 0xc07f.dbff, 0xbf2b.e5fb,
0x8ab3.d74f, 0xbcac.1fff, 0xfb6a.be1f, 0xe79e.fe6c, 0x8f33.e078, 0x2fa8.0bd7,
0xfdfc.fbe1, 0xe6fb.feb3, 0xfdbf.efd9, 0x5ff7.57b7, 0xdd5c.bf79, 0xbc7f.51fe,
0xd7b6.be39, 0x72fd.e56c, 0xa500.bde5, 0xf5b4.0c1b, 0xbfbf.3661, 0xb690.040e,
0xf7d2.f8e7, 0x9483.7f61, 0xb701.7f1e, 0xeff1.0402, 0x1cbc.78f7, 0xc411.0031,
0xe11e.cff7, 0xf476.65fd, 0x6ebe.83f7, 0x4be9.f20e, 0x9b11.cff8, 0x6f68.680f,
0xc009.c61f, 0xf162.10d5, 0xd090.0f0c, 0x8bf6.7a3c, 0x737a.6239, 0xa800.ff65,
0xf61e.ffb8, 0x80e1.21cf, 0xbe42.636f, 0xcb3d.f5c4, 0xc9e7.a833, 0x4b3f.ef00,
0xcb0c.e3fb, 0x753c.7c37, 0xb200.9eba, 0x67fb.659e, 0xfe7c.b50a, 0x4fa4.ded0,
0xbbbf.1cf6, 0x4590.0ac5, 0x458c.f683, 0xdf01.fdf8, 0xc0f9.0824, 0x0989.23c7,
0x1fd7.6590, 0x7afa.63dc, 0x7f6b.c07f, 0x7bc2.12e0, 0xc319.80c8, 0xf6cb.c740,
0xde9f.170f, 0x79ff.606f, 0x71fb.4044, 0xc71e.383c, 0x25a8.6197, 0x4c04.6cf1,
0x5ddf.dc5b, 0xe4d9.90fe, 0x73ff.be5b, 0x9728.fb7f, 0xce87.c3e7, 0x57ca.9457,
0x8374.a51e, 0x0986.79e3, 0x79db.2a5a, 0xd874.61f0, 0x0fe7.a23a, 0xdf0f.d754,
0xf07d.227a, 0xbe40.39fd, 0x4ff9.987f, 0x3783.ff98, 0xc2df.7cfd, 0x077a.e1f7,
0xf7ff.69e7, 0xb86a.6fe7, 0x73f7.be34, 0x5f88.863e, 0x2099.d3fb, 0xbb08.44c7,
0xe0fd.7f6f, 0x8c37.5441, 0xef07.cdff, 0x0cf8.e667, 0xd1b2.0ffb, 0x81e8.e2fc,
0x6ab1.940b, 0xb0af.f927, 0x6787.a0e5, 0x29bb.7e4d, 0xa606.fdde, 0x5ff7.df7e,
0x56f8.3f22, 0x941d.2f9e, 0x6377.720f, 0x2cf3.b3fa, 0xfab1.339a, 0x60a8.545e,
0x01f2.35b8, 0x6f80.ffed, 0x47fd.bd47, 0x193b.a3cf, 0x3298.ff72, 0xefbf.083c,
0x88c0.f9e7, 0x1fdc.4419, 0xe9ca.db47, 0x87c0.5f89, 0xfb45.790f, 0x4a80.3f21,
0x164d.e3f5, 0x91b4.df4e, 0x38bb.b7a6, 0x10ee.60f6, 0xcef4.d064, 0xd383.e4df,
0x34bc.3d1e, 0x9fc2.8f04, 0xd83c.1afe, 0x8303.e5ef, 0xdfea.c23e, 0xec6c.83a0,
0xe6eb.194a, 0xc7fa.f375, 0x560e.1af5, 0xddb9.583f, 0xef95.83db, 0x307f.b657,
0xbfff.c15f, 0xdda7.a0fe, 0xb7fa.37c3, 0xcbf6.1c93, 0x7959.7001, 0x7ff0.1bc6,
0xea56.e2df, 0xf4e5.c105, 0x8673.1012, 0x9e7f.f82b, 0xd03c.c01f, 0xeafd.bfa0,
0x2b7e.1efb, 0x2168.0e57, 0x4036.61e3, 0x92ec.c444, 0xfa8e.7800, 0x2784.bfdf,
0x0521.fcb3, 0xf9dc.38db, 0x33fd.9583, 0xb400.cfbc, 0xdb20.ffb2, 0xe9db.c71f,
0x6570.ffef, 0x7a41.3cff, 0x0bd5.ef3e, 0xf956.9218, 0x5fdf.84fa, 0xcaf9.fefa,
0xf13e.f0f9, 0x7fde.afff, 0x0deb.33f3, 0xd5ef.e12f, 0xfbf5.617c, 0xcabe.fc15,
0x5fee.afbf, 0x5ff8.fefe, 0x7fb9.2008, 0xf8ab.fff2, 0xfeef.9b3f, 0x92a7.88f9,
0xaac0.383e, 0xc367.db7b, 0xef7b.d079, 0xd7d2.2400, 0x7dfb.3002, 0xdff6.9f7c,
0x8297.f3eb, 0x8e7d.7eaf, 0x3ffc.727f, 0xb0ff.5def, 0xa4e7.be7f, 0xc1fb.7def,
0xea3f.f7dc, 0xb1c3.9fef, 0x9f2c.b08c, 0x806b.0c09, 0xb8d0.ff02, 0xef1f.23cb,
0xf805.d9fb, 0x3ead.11fe, 0xa607.09e4, 0xe9ed.28d2, 0xa1e3.28bd, 0xeff6.988e,
0x67c8.dda1, 0xff73.9f3f, 0x48ff.7a47, 0xfa64.38d7, 0x87a0.0190, 0xfda4.04d9,
0x0f16.d99f, 0xa1e1.bd52, 0x4adb.f1ae, 0x9500.3238, 0xcd9f.d029, 0x5f10.fff6,
0xe7fb.cc6e, 0xaf21.f37f, 0xffb4.ade9, 0xf79f.d81b, 0x1ff6.ce19, 0x387f.f6f5,
0x3501.01ff, 0x39fb.f9c0, 0x2698.7c00, 0xf1ff.e390, 0x63a8.c61b, 0x782f.54ff,
0x5b0b.00ee, 0xcbbf.f1c7, 0xf5bf.9b6b, 0x797d.73e7, 0xb83f.3e4e, 0x03bf.b8da,
0x7103.6674, 0xfbe3.3fff, 0x24cf.0053, 0x1c6b.e7fe, 0x3a15.c8ed, 0x5b9e.1fcb,
0x03f2.e68a, 0x0f44.1f7e, 0x4771.7036, 0x1062.b458, 0x6f03.6643, 0xa3eb.f9e5,
0x9e1f.33f9, 0x7f11.09ea, 0x3378.bbba, 0x7485.27ab, 0xfbd3.f92b, 0x6f40.6c0f,
0xa9be.7db8, 0xbefa.8ff9, 0x035f.b55c, 0x6fe4.8387, 0x7c01.bd6f, 0x4c13.a59d,
0x7d8b.7c79, 0x3c6f.47a9, 0x30fd.a139, 0xdf88.87a7, 0xb285.241f, 0x3e79.f3f4,
0x8d85.729e, 0xefdf.23da, 0xed65.c0ef, 0x9bd8.19a6, 0xc702.1df7, 0x19f6.f7df,
0x3ddb.06be, 0xc156.42da, 0xd278.91e9, 0xb4d1.fa00, 0x0ecb.de7c, 0x8c7d.604b,
0x3fc7.1471, 0x8503.261a, 0x8b2b.7bbf, 0x389f.b46e, 0xe6a1.e622, 0xfbfc.0ec5,
0xdbd9.7aed, 0x746a.d9e2, 0x2093.f3cd, 0x5bfd.da00, 0x8479.8131, 0xe00a.240c,
0xf20f.5bc1, 0x99fb.7de8, 0x8801.3389, 0x7b29.a607, 0xdf49.060f, 0x9884.d17e,
0x93ec.3624, 0xc7e0.e5fd, 0x131d.e56f, 0x4a38.7bfc, 0x0678.dbdf, 0x5795.4209,
0x6c33.363d, 0xaeaf.42b0, 0x6fdc.0abc, 0xefc9.f7a1, 0xc13f.fdbb, 0x5707.ffaf,
0x0a3e.47d6,
}
obj = {
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
state = 6
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
  elseif state==1 or state==6 then
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
walk_cycle = 0
function _draw()
  if state!=3 then
    draw_world()
  else
    cls(fog_color)
  end
  walk_cycle += 0x.08
  frame = flr(walk_cycle % 1 * 12)
  u32_to_memory(0x1000, image_list[2].data[0], 0xc00, flr(frame / 4) * 0x300)
  palt(0,false)
  palt(7,true)
  spr(128 + frame % 4 * 4, 40, 70, 4, 6)
  palt()
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
  elseif state==6 then
  end
end
__gfx__
87c9dedbd6c84695a9e14993c4659b7c3533556d66694bee4b6c32979f3801cf1b481c8c30d5366b0a1235ae8848ade49b2522ee5119738ea29c97fac3319b32
c61fb8f1c285b02d8404fa4551d274aad32b483955eef0fc067fd8f1eb52562c4660e6f4a4d02038ffce6b695ad2cd2dc07ed7e97ed37ecd8aaedd9e6b0c699c
8eeaccc888bf17ee97fbe97f97fd37feadadf3d3fa72fedcfbffad7fdfddbbfdff5b77f5bcebdfefb26f8efbe3e5bf1cad7dfd3f77dcfc6ef4eb29d7bfedb26f
85d7df00ff37037b7deddf8ff116fff8f678f7f59ef77f70ebeb71eff07d93f7d4bffb7fadadbb3f7de3e9fb61e31d71fe6f7e1ebbf7d6be0f73ff3adef13fdd
fa68fff6f7df3ebdfb6adfb9f83c78fdf0fb2cf1fdbfacb66f5c7fe67e39ab6ff2df71fecfeef98f59fbef88fee7a6788f78f1733f5b5bf8ebeb6fb6f1dde77f
befe63fed747bf3afacbbf5ffe589f80f5cfaea5e715b6f1fd9f1ff2ff7dffbcf37f3c8bfff47def7f0bbadfdfdbf78f1d7df9c7de70b6ff0e3afabdf1f35bf3
0b94efa78fcf75efaddffeccef3cc6fffd95bfdef958d0f3afdef8e3afaf7cf5bfdef9dfe8def6f7c7dceb859dfff7afb8fb4fecff5f6ff7ffb49d74f5bcefef
84ff8f3e51fa7af7cefeff5ef35fee7defe7f77979f859f143f7dfb2b87afaffdaf73f73ff2d76c7df70ebeff8fb4ffaefdb9cff0f72efc5ef9df580660fad76
de0b2fad9f3cfb9f71ff9dfecbf719d74f75a95bf8e70dfdfb1357e75ebef3dfdb73f2ffcd7c7bfbb9f6c163df8afbf78dbb975feff73ff4df6cf1dff6ffdafb
5ff64af4e36c69d3529fd76fffac3b7379f71ef3ff7eff7e4f9c74fdb797ba72d0645fa87dffaff6ffdb38f36ffbdfbbff946f1dfaeb26bcfcc908ff0ef3bf3a
fb9ff1fbdf3ccfbcf9e7fe5ed4f337fffae2efcffb3fbbfb4fecfe5ef9df4fb7660cb63ffefa53160e661ccdfb975c53cff9f7affecfadd9fb3f79ff5e593d58
d5eb37bffaeb6f42ce2f173f1d7f1bfbd42cb27c0fa875367ac53bd5e670740ff527ffbdb6f4e7eddff9c7f1264bb8e03b1fedb6c1ff768e05ff5f136ff7fe32
fdff7a167cfa07efe7ea30045f2c691c79d75c67a0e43ed3e8f7de7eabeff8e76fadad39f70f5b5bf9e7db9bd8dfffb972adfd6a3e7e8dff3af9efca1337ff9e
7f284cce7ffc28efdde0f7eba4e7ff8bf5fd8f6e73fb9effeb4f54e0016f3ff7f546ff721e4ceffeb0def7b3cebaf7f586ff6eb1fdc7caf7f546ff7cdcdef6af
fbf26bf73fd83fa7deb96ffeb8def5eda5b7cfd8f6adfbf22bff97d7b7deb9f74ef8789cbf28bf71162e1a50bef7cfb0def7baef6c796be0284ffddf6c71adff
b1f8fb1f46deefdef2abf7899fb5f4e78b6f587ff031777e9c6cecdef2a7df66a7f5adb1d71ebeff6adbef116eff59faf9b3c4cadadbc17da96e3f8f9b729636
877d726f6f6ffcf30807afbde702b1ac31c12e7ee8356bd37f7b3560f1df4e989fcefc1bffd6d40cd6db3cfaf9f7ff5bbdd43adff6737bf678dfd6afe37cefd8
6008baf53de9f936f7fda3c89b1deff4a9fc7bf36ee0bf78bef03f7f9d861f3b6007b92df07e5d99f37eef21958fdf46d0308fc7bf3470b1c83e9068ef97c00c
e4d0d996a1e12e379ef3f5992cf713090ff4e10b8b97ddcbe6e573fab97ddcbe6e573fab97ddcbe6e573fab97ddcbe6e573fab97ddcbe6e573fab97ddcbe6e57
3fab97ddcbe6e573fab97ddcbe6e573fafff8e5beffadfbef6c7beff7cffef8c75eb6f78ebaf78e5bb5b17beb47b6dfbc7b7debcb6f5a5b5f5bf1dafaffcd318
b6b6fbcfad387deb5fa5836c797df61ffef6ddef6d6c7bef997973ef5e757b5aff995fdafddf2d72f5afdbf2dffdf5efddf2ffec79f7bfbc1efaf2df86de74f9
b409f9763efc87dddb936cdc13e6e81737c8b936cdc13e6e81737c8b936cdc13e6e81737c8b936cdc13e6e81ff43e13a9abd2a8aaa6b3cbaaea0bf3b5cf0eb4f
55bcf6b3d60d9670fd8f5dfa28fd483c711ef6b3f8dbada0f7791efba4f19dbb28764e902c7fd651f4d83b8e09ad18fa6b9963afb8bd8d98a6c7aa37ad69dad6
0839aed7d51f33bf3b1c1ba5b3e2eae0b35672e2875e51ea3c703ef11e48db75beffbed4c99dacfa02f913ec32eb1df3e1fbdac7aa2c598f4a0e218f687ed22e
48072e87d850764a4cbc677c52594120630804a6dc041e35ac3c8d14976f4746ef129f4c1855a1766bffaeb4a442503c41490159d5e4ba356567d4c967e1b8a3
71f48cd2d62d87e4e632967117ef9f9514d62f9da2a0c929f1f20b34d830738f7835bf0f97a3d9a9f724126145b8653f38ba2ce3d5b5dacb2c112d0abdedce07
3ec7a03b7fa946deb507a0cff4a8cc43a13284fb8b1552583bb84d5470500b966ae6a6aea3a591736bbcfab3e1953fc2317e0b39a13ea653af4e62296775ddae
729efc8afc0371aa10c8f9358b0bf0616ff71e75417faa8aec1dac2aa2166c435c53ea78ad0efd0ebaabc47905a4f41aa2cfe8fb9ae20dd0a22779c588c4bdd5
85251c82949839a4e9db423defc34bc9ce63bd8dd1a45eec44717cd0a0d98c7862d192479535f16462a965a204db0a3e2c7243a7d07b4d0faa86796e602758ca
4a951700c161da127d9dc7e2c555b379d459b110d9aa66ba4756f25bd174c58b60af1f2a4cd7ab3d4b56e9739515cd9b954c1b8f5a1d4b0b9164289a48aebfcd
e2a579641ee94aacc7f9bfe69d351ee67a0dca7b17a4ab8e822b75113c74f66a335cdceb69b6922d75e35049d0fbbac535529decf4eb0e5f3e2eadc4a0eef5a0
f397b276817089998da893bb2d4554c88eafebf19fbdcdb64cfca5d09dd7a6b2793a0409c35441b7e34982bf4a41a187c830eaa5594faa88ae7add28bec6821f
2d5cd6ef0a4b111289ac3094d1d386b46ad152c5447e0a81194fbd5cad9b863b991efe861be3335454193d5e0dcc9a702fbd9d12b3fb04df0f1604d85a9041f8
464d56ea6a46ce2831887039b6de4612e282fb6c4a48e6a5554987599d46e13d2a6e46a279bcca2775657ba12ab677b27f4947da883fa278759b5f76e83ba43b
49c167b1dfa5ee79ae2c5893de61af2b4cc711d554c47a1171d5ee4032671e986a554fbd17489cb974f20903c94b43e5544dc6eeb54c3262d207772c17bcc12f
3d77235fe23de0d84bb869f29d278550c3555d5cb45e996a156c55405b39431f9d4b7b9e2addd16449b90ee2778aaace7a60015f09a65d9b264c324ba3dbfc66
79468ee8e396b5cf2df4cc3f013d77995a9d75e625c93ca51c1b8a40edba811dd51a3a973504afc07829575c0c7db8d3cf53ca250bf890052315753322e198db
e825cac12369dd451ea3ad564b9277e6239660f47f81d64349c0415836964523cee8116a21ce192a0007accf3e49bb6e6790ad4667fd5fcae5720de72bbc22f9
9822fdd3abed8ae5d6f0385eaf4945fa725a4ecccd05a88e67affa20ec39130b48b582ba227f3ed579986b25cd2af539e1b70f5d4b6a1c374a832fbe327f5155
6b96717ab3b80beec2c36c27a0b556ddee8ddd768b116416349339afb428d566e115162ae94be3a080971554d4d8024ec176c866d94f62b935a2347909b6e6ff
d6fdef3a9856674e295c5c7d998f250cce23b88e23d34f9059168e8343e4d0e8a07e6f94d29a486057df503b5aa3a5976adc83761544bfe65942421866e79abc
21678a441b7f87ad5fc149bfbeebd9559cbf56eb4a2a6a4f5e75523c0f0a4d2c51313072bbb96cc90b37426c989a4a92db875d62f66da742d0b9efb075dea89f
77baaea9bf7846ffa0c3d519667c547ee8322c3c6df06546a2b9441d57972392579a2a2d55d3d286d7c6e3d10fc01529d5eaae58389b231325d56629e39ddaf8
c4376e17392f21e38899352fe61242f6df03876986241f42112323e0763cbe25029ac11fa7cb4e4cafc2116325b3c124af80df2fd35e191351d93c68545954e7
dc345ef9462c837993ae28bd86df4550c44774420abee6b79704b23be8abf994bbf6ff55e7c84823b3f909aaf2e5d7d1d91ab6a7ea6805e9c9ea98c8d8c6c97a
1b87b28bcd9f4b35103c7bb06e98584133ac7aa8ee5b8a22126d1d8b52eb03bfdc6d82f4fbc7e02d6a032371cbf8e58302aa04ccdbb2f878d5c4c8ab8e0f82d7
ab29635c08c6c32815d5758b339e4376d10118b2c35b7d0f9dedad54ea9592598824847257fe4e218c543e6ff9e818d372d523688afd9663cf81ea92dabfef82
a796b47e67d597e7841f9feeea57eafdebf71e96369936fe6dd67e578be87df50275c86d899692d3924882a492e4f37035c27293c2ccc63d552ad89014b92604
b1dc0dd12bf4d04f0ba4e3fa0f9b57d7de294baae2b3c83c3ce236e235401e06bace362b3e3cd83f510fa17b7d841728e65c3a75b2e50a3abb0b8a7d75d9a654
e89dfb4a961defbbcdef3ae042c7f9d00deb23bbe46a090a66513a9bb6069ea834dc4fb4ed7a25c8ab8aa5d3435d6c9723d18226a7de3f1578f66be78d6eceb4
4b87a6f0d509b4e513c8b15277895a909c89bdacdd78ccda225f113616ea4555a9b283bf8898cd4d0ab26c68621e2fb8dadcb8c38ca445e1a00ac993e81a78ce
d9ea719fbb83d013a04515a6a157213fae913a234fff4a626b55fc1a9cc8d0f7055a57d0c850a07251dd64719fff49f867ee65a33bff6d9a17f04b15f5b29fd9
6086b4ec9bd81a6dcffbba3274c2fc045792db2d14b81f3c6b2b4d6318cba0c49466e7e11f92ce83b6e1262aac9b495ac3510dba2c274fab4da924e77537567e
8de1c54994a04936cd15edf97288e41ba86f3ee0bb3f81fef1a70f71488c7a3dd09bd51937e6ff9be544bf79073e7308b3da2b2ea8315922f712348249de7b5d
452d61d1755c0506b74390c15b99446a592a90dfcb6b179679a8ffee4a3d4c2a002ca9dc4b882a1fb03ecd82d8c89e35a2ef5c445a29cf0a0c01a711dc43a2c5
4751d745093996a2614be628d9f7f5c263e277bde78ba8688eeb092e39df723f8c67846ff554d68cf77278be189a88a30d3bf7dc15ea71af8d1086bd3de9a458
4ac4d0c5b2537b2fc9dab4d3b8181503f6fb8ad3b5ccd849266fb6237e919161f92c96314efdacd2628f6e064bd85c6ea2d8912a2e6a55477159bed4daa58720
b6cfb234b0ab0b83d9e37f1597bba2aa14521b1ebb2a8cdd70e4edeefeee4cdbc5f0379b25ad23777a5343d01d49bbebdf7ea2355239fc0326fdcf3bae2faadf
7fc7bda8df76b95a49e25c0038cfdaf4044360a619e77bf2074f2e30ba1aa7210a943e1ab0f35058a9f86b36551eef315c50d14b6f09e8a5b1bce9e5de4f3a2d
b36478b0df66613c4cfd743151acdf1b3ad652dd1dcb316b47f87557e87ad16447d4a407baa4db315e0c4efd3d69e9981844b86ee4796d9b09560f944bd7bffa
2b0bf9cde52ff59b9f3ea456c5f29dfbf57abfd59af84ee5579166ca2dbfe80cbcd49bd8329814abb670f20e85f3850234498f82c1c7fe21bac149bc1a4c107d
c8ffe6a9ab88aada55d6e5435a71d93d103f455ad439624c4666aca26559af90a324d57708e872d1e494f1d5753aefaffce23af3a3711168fb9b3bb80cb4bb98
925525e2d44a4b9c3e66cfaab46ae994dade2b9a2c1a424e42f90b15f3958c42e15a4e3ef2ab876d8ab46f10b0879b38aea57ea331a5ea83dae7142371bf979f
2c626e5f38a1ee2a8ac1ce5596a331258441d0568625a2bcddd0fe742548e2c90326d72b16fd34996c6ea925ca0e42757fac760b52b1be856a8cc2cade93ff42
8696c65d5be8bd936704796c1ab27a2d2a970bffdcf025cebcc6f4e6e8e50bbcc1ffbc6ff924746a70dab45221e955e6ef2cff922b946b9b1db665abcc1c7596
aa27884e7d9592004cdad3257755669613f6e6fec1b9d5cbd0a076a1d53879dcd7f886ca592ee9f5925ef597ea19c7c34d5a8ab253cad289ab83a667b1ca431a
9b37f24ee642dd4764afe82c727c1435e2cfec158c2a84bf1f8d5971e539ce189812ffacbfc82a89971ca9286dd76566fd93c4c46ff4d588a2121652b8673fe4
e52a22c7573e5733eccb47755af996a3c702c66335a742fffd6c9db6db7826a4a65aacd96ad606abf12ffb3010b619c3b07d1d6b8a2a012287ec51b248ffbbb6
8c334e8dde48e547aa9930a732a57a2815f47d35463a1cb31710b4da0832a0d9c571d17663a32c2aac0704759f193331863ab1da2e96b521b1bb14ef927c888f
a924b88a42397cb46efe32377bfcfbb2f010176039627c384c8c5adf88c9cd9f1df3878686ddcf31470b3ad2a0f960d5dac9f55c6083f15c2c5143b367813e5e
f8c205f757043f03609a441b89a97d6ca9c551fffcc6798fff0634d669e0b35ac267d657d483fd55170cea8e9912555551fc12de5f655c635b108340d45f32dc
f42bd8836ec72d5bb000e4759317903e03fe414ef7056c30a64fd64c65eede52acc49923d31610f83bf1549d64a0237d82ff1e78326e8e2b986f9817f14e1772
a216b953a1771be74a1978b4c4dd091b73425be02fc9e3161634bd87373d2eff20001cce0a0430f811e35a4db9e203a9f7cb68ad62034c01dcc81520498bacdf
d4614740bcc5e4ead02360d4c61d1b55a4a313d517c79f41bf4745e78a83f0c044a932bf96cb52ef55e293ac734e91bbb6b6f1446b22773fe456a00127bf7599
f76e5702c4e5942524ef8c08455d663a0a6967170cd5ae39075f96d5f04798ea12d55e0cb8e13068dad2a0a361c9798e73655c971f6f7600e7b968a802245cdf
68050ac6944c45ed4101de6437a2df9216f3b8c0c577a6b6625a816fc6adcc109c53bc2535e42ee07443f03ce62328a2b4542355c4572e8fd064c56fc16bd101
5ef8e1c866b79b920c84e5346a1e31ad66ecaadaa7e6ebf6ff59bbefc2799ae521c272dab8aa290e45c366471941455d5cc779313ee754b71d2bd7b377829f6f
1da77adbc983ab2f262bf63927ebd3248c7f8715a69210bebe81ac455c857f33d29ed18ffcdda35092361aad2a67fb56eb86aa66407f9859ccfa347fd77eccb4
726da930392e62cf1541d9bb0d63f8ff431c2cdadaaa8dfb8e71fe3f5542c8a91626307a70be71daf2310fb68c7ae5378597ce8cc00935fd645409a47699d4b1
5e12b74ad923d7b474a41713aa75e525dac19364df0e565cc8dbd85bbfe4e58c30aa96848c4036a2dd920e4b4295fa6fde7d5ce75ca1e8bb88655316faff6d17
e2d1930e501ffe4030a58b370f923e4e85f91394d76e5de03d86c2a90eacb2c02d98611542ad30930aca5773184cec7a4b56a2735a3722c14d80a2f6e64a654e
1ebd82fe66b6f77ca00c59b9d94b3bdc2fdaa4c966bedda29bdf75159140daa27d48aabed64d37f21dc83f91dec7e71e4dc304097ad2c72fd532d60bc6fe4e82
5e432a6962eb07a55aab5960b431b0f9d5e5fbd62bbb8df06ff9ac78632928aa3c065667a867a0722e4eebb236f7627d8dbb37cf967c54b567c43cad632c8987
5fd9b7a4cf8246c2c605062a6dabe36520e64ffd583a1ae88d79ef5090caf2802e18b668b68abb8bff590fd6f1dbdb72ff51dad2adc96a15af986dd3dc1b6eab
2ff9d52937ab21d95abcd03c73c48beb2934ce48a1513ecd624169aa87e27efb860e565d961b246122d34261d9fcf5b223483c0571c2a7f528ce288a28cfb6f5
a36c954b58a24e0fa25794a42f212be84518dff1ef82aa60fae9efa3a09715640e456517ee031158fa98be4e9957dccb255c9ae6a4fec2df0593abd4e8cba071
26351549d9b89a199461ee8baccc332d200b410fa82ff22ad1a0e15fa6cb47792c4dea2d154edab88bae29dfb7a40d52de8e27e042681d4926b6b1e40bfe0941
39c44711736637715ce0d892a522eb06771b7c0b45bcb51ed49a132b107ed5c4ea2087bb57175f32ecd547d0b0e51f2475439070c2cd367af819d340c015b401
01b15375d130259b261ecc042f03e6b44bf7fcf7ab86cd56be95b0e7f4bca29fc879225d537165d2a25f8aaa13abb80ec0a4b8a18666081669683cb456f3ac73
714909b3c5cf0a6fa7b829bf949ed6e2169dfbbdafa88a75c875692adfb79719c58b8798ccb5af112273592e86ccdbba8d3b355cb2006e07875d112e4b64e7d5
70bcf7bf2de76dac18a0da13d8ca296be412b4647888af39b63712d5c6822e9aa03e6b976c9aaa0dee11d56292975e57155ad721066b58cb91eca5420efe8089
a1717d67eb829bc46a41bd8aebe6974ec6f6d48061b324ef20ca4dd726ec8e5e4a6ada79adddf864bffed8b3e1dbbec3693f05b8812071a28bbdad08e2a4c210
bb8b0a5a2f1d2f0fc94c8eac03db992747957f662e773ae0b3d33d55ea7c1c546d66ffb80e3cfa98ffbc29194c66061ed885e97a1b082c830ea4cda1f7661efb
0700aed877237a2cdc7b277b59c77aff11d1b468abb68fb5bb0e28bc95253822d22dfcf4d3e06ff10a861cf68dffbb82415acea85d7259cb67ba203598416aec
3e361e6a5d6ca581dc9a4e5064b277d38c3614155ace6b71e4cd578754c35f1f7a0b9d6ca37202d2625d3d4a2443f6524a506866119eda63640aea55988b375f
f4893b35c249031356f8b4068315e6d55a5552c881da8e559872377428354efc6149bac195bc1a17b6cb41143abacc02c6b276848a5c99b86c42f5b1ba2de671
d66e9f0a923d5701d8c1134f5b8892f614772a8f99c04d0df3c5ddbdbb743d858e62232530a27426195ba4cfb9f59abbcae2a351fb29eaa4aedcb0d2a3719894
c84736e1e13a58bc5fb6d4693567e13c5990421745a3aa7e3d1d95579a3d797559b3b1c9bcc8cfe70bffd5be0e0bf94d2a9e2a215935672cc7da0ef66949ae28
c65e1705082479ed1d9b4586e3fa9e9bc274943f919be59fc29666ab8aa26ce3b1d71da0375bcafd16a34b4adbd8a82168ad04ef5a2475cec137061ab22b817d
57e119de65805b92ff6409fbeae6aad4bd850886bd8653d6c0904ffbba6ffe715ee102b0b05035050b266e2d8393479deaf69a9fd813371e6005969fe5728bfd
97d86d4b4aeac573cb867ee9e41ff17d15472b1606708b0a66a8563f6e93feb961c20c6e074853570610934508c9c448ae63b947d46fee861544310e07dea4d6
5b19f4845e670d5c65a8a816aa2f954d15bb8e36c30f5aba391f47eb68e5e43d88c039ffdf30b8bfb0e12b0d240f85b8ee409646efd20df50f9e7c751c58d107
eaa128e42a6a8b96acf4aa811e1752ee3f3aa20f219a6c55c03951795a75a184053c5821c924329a21aaf63acf54ab42dffecb5663fe499c1fd546d284bd6bd5
aa0499e94639dcc811e7eb8d73bffbed4f6d852d5bd1fe5a159b4b0fa965e97f15243548c82f264860f844e284575b4f9b0d526b469e8432258c4c42d98b1a6d
92398e000693c9507084279f4abeab89966dbece349a9850de25b9632f24ab7a449d981e37d01ef439f79d455973d43318863a5865956509548fcc9e31ab5459
1c07b3f0ffa806ed3215925b8249fcadb819a2eafb86508b4b15790ce519d2a6eead8ba6eab89d69f6aa9165c94f86521151a89116aca72f7f0bfdafaa070900
991eac5777e1a9965979325cd928343b315da69a92c56c4398a4c80619d2282e48170855ee93d1bb4bed32420152210b296b36d8de496ff8c82ac22a38862dd3
45c30b244bc9a7bbcb2f86b383fb715b1341c347346af8b983c9cecb4ad2f25cb71d8b9fbcf99c9d3e2ca0ad91e486aa7d86156397a61c5662c91f6ec00f9dda
b2751c908e49be5c61a0e56be479c85aa6d9df193dd28b01856c74898dae4205492a942f7b920678d41e95386c13d4a175471f69a0eade6124dac7a98e21bbaa
62fa6097cb0aa671ae237aa2d41efe5e15a092e44ce35b884825e4c40102c6b86545971aa0388d83827b4d4c2d9af94c69cb661848cf14c79d5c89a9c1fe78cf
5705625d8623f10ab6f49e665e49357eaaaa92d8eeaa576e95ebaca410d0da917064c28584f410d6deee435011b8d675a262484da72137dae826bad10cab5845
1de036820ae7bd7f58b919f070714ac91c4dea9dc09cbf64d8f57c8c706a9a8facce95d4465b661c43fb8e9e130ff54e7ab5ad36d0d5792e8385fe2a728aaeac
dd4ab64bf4b674d53e5b57aab59ab74a01b9fdafd3494861a8e0790be7edaee1842b79ab401549660a093c53beca9387bcc1da38d08c70120b1fb6fad193ab3b
15168c3dcea27bf7937a24580171f82a31bef5240050ee6c3c036d2b06eb0c9f1a7ea9410ede94d8394113ac419bc3def71218c0a965ec085b19458221b6f951
25ccc3e2fa029fb49cf9dd0cea548ad26522dd5623d90d03554b2329dbc1c2bc544bc2c927140f7da7eead5e7fa13e547925ad546d26041cb738d759ea489519
88f286671cab7a0665892cdd161103cac74389a96c56e066b1c70836236658b8244e524efb064d82a0ddf1dccf0647f15ab3a65434c8675cef35baa2b4964def
2553908ac57eaeb0b10a7a3d43237306a87ce8e9169ecb94d81233e392c87becfa9f42515563fd231aea272842258347260d8449e396ff7162ff9a8435f94514
6a6362c8dafd84686b95981ff2e2795645a7aa98d96a9485f40789e47a38138ee2c758b585c86e4bb2aa14792cdb62a0743ac9875f633516bc0790b44117d4fa
6aa046e5f11eda02cf252196ab0a66c8c82c8259ce29e999a575878098e14ab88032bdc0fb669508c8fdcbf712c1167fdda8ed47a8092d2127a1dadb05f6441a
cf64736a2ab8ca0ad0f143488a039eccb56e8495e56a8ac3e3136415fc81e710659873a0fb76e5800a04426287c4e1def3081a542f011d9dc24e719403414f50
a801637d7056b2469a2ee7b965a8768495a45630cd2fc3296d135708dd932fbe48c6075ae5479a491d042f0f0ab066026315be1caff7212115572a04a05b4936
aedf4e13472cd23e6b178ce5eeee30ff90df60750b9bb67bb8c307ad0c97ce4c865192c4571564e91b17de28088bb336611da2fe3b512d4b0df4550f8c14af22
8a3a5a23f183af6e487cbb9b16a2433c51d5355e6734dc8e48d7364a0ce0e8eb12cb0395324f7e15ef63a93047cebaef7e01788aad178a872353e98dbe00b278
ddef1fd161279309c884fb215986e4bac9a80c920df1e8b936a4c3d5724c5c94e22ed39e8ab18fcbca71acd99b6c06f6dfa0b685c5d2477bba244f3bb5071597
101b26ea86bb48d93048d6260ff6d6940da58ff73eeef8aa4227ed3a35d9194c24955dab5f3f234fbfa02a2d93fd41fc3ab70f609a54126436107eb049d50938
971278f896ce8e62252afc027569ee61d99aa49674c4411a1fc59ef6603c4dfa1397b7cff3289380a377893aadb8a3db5d17ee0a5aaf5d4f8ac2adc21598da65
e17b229898d9b9adef2317bef760c549b69a425527955452729ec549a600e886c02d7d844728907002f592c7978bce47fdb869d420e86dcef51e183346e3bd65
405d86a689fb9bff1ed1b6c098de5bd6c125ac09a31f591f3006917023d6711a0032a909c99e8c22249ba8efacecf1b8051e4af14dd4cb354a0e0d4b1554ba55
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
006bf5c1836a09e99f599b4de534bc15476986b8830622f190f4ab71daca03c6eea03cebf79007e7fedf08f2638b4d01074d5530fac996f8e112d57a03f42191e3a18c3d3987c260ce96b06140fa018037de86cba20a5dea3541fc3f72ff8f4cd094116f2df843b120401c2a480e1a10fca3356cb8e897f8439d006c29c4e18e
ecdeb077efa295d26a9703caff3e7c96c9ff8eecdf064efea716ddf82f86683afcd1548fafadbd5717d8f48e8af7a4c1c91f208887f91a314d3185b15fb528bab8309c7dc92527d9b49844eb15d04ab049b299d77b8ce8364eab07c8eb853f1b1c5f0b78c58bd3ffaf13262c54ccc500772cb2edb45c688c69dd74077ab17e14
__map__
62c7a4a9e2ad1dbcb551b1826825bade028d13ee342613564cac767779d450fe8ddd24b443f3376bf7adf3cfe4843bb7403a79c988f75d4d9f9b576f454ab895770ed5c400bd6d5cbdd58c1624b5c9445639461106f1d51f55627b3b388caacd09d3ca505cc8625fa8685428d4170c219d18ecd86bc0a080181044df6cd3fb51
0ef5ad7be175e722ccccfa66abfb1ec0fce91b715466167525b457addcbb2c662e8dabcd545498b755b0c10ebeb59c565c27012fda284a7ed09495d7ece38c071965d4a4fb12ceebb41300632ac61aa1278f341e3b30466e9746f943f256fe35f9dfdfe1a86871968e506118d0948d57294508c6670500e79daa1c18b7ee4e5c
44b6fb94b6bb57778a73ea332c8ea17d2963f5a641a4540c1995e268ebc41273094e41c8e2e1c6c59354f27b5de7b74d14efd7f98b89a2312047fad12c188b8bafee0e468f4b78c5bbd61a5af8dd99814879919dbc6da1f0e65e0b432cbcfe028bed6231014881be8fc5c9522da82c45bc6ecd7834b53a84a0f0ba666595a30e
f38459aa6297a6684dbb336cdebfd27a1d285b11ac851d8a7c9bbb4756b487ffb7b90ff1ff4af2a74b223b5221ddad95d3774e1c056b570311cedf14cb46a65bb99f13addbf912be227d66f27ebd8ea6c401dc3f924d0b14c0ab1659c420c31552a35aa4d9b4f54e15aadad0da18ee9ebba3731aa6e07c2879480ed813a006aa
07f94fa51101119e079f786ccca0b586d3d4c4a8367484e4d85ac728745630c522296a61c65c45efddc9dfb71efdfd76cc669126ff61d5ee08e2e1ae0477c3eb47bdd240d314becc42ae63116ff5b9c83bf89d4e519072425ed1b29ea067afa1fd5f1ded5debed70ed98dddf0c5a61e398fc198a6282d33a27e0eb452d73a83c
b4b68401707e0b0a81219c3f10f3c37ccbe363692896903684e7f2ff1eb60a65f1d32c514a494387d2ff14858aeda7763517d91a2f8fc95a0be1c967c7fc5dd5afc6dabf8233bcb0d8cb6ec2c1647d17c951b011138032b7d6f3571b9bba6371b0824a584717584e493e2965f478891a906a388e9db11d7b2ee002ce6b41bf20
ffda50c80bb163762dbb9056eb3560fb181c00ced2a05f9f02b7222745a5549e1b1b1d26a76106bf8f4bb4eb75f997e884a332c1df610a71ba851c4d47c5c585801d601aa5d44076c679123709969500c0f82e048c2d32e27428c16d5f9bb6bb524d85816b2d498e585de663928d8bc9003c0c3fde310f625d0c0b793e255e30
a74824392042bcb56a5f70b428015f370400251b9ae116825e5b0a5038fc039a237bc548c230678e614b09a967fb1a2ce6d13317f7ce764170368d18c696b1b1dc0989389a19ec8c01806e6d0dac3bbf2593d755f7829e6e1cd0abc909614053c4ae45cab3d82ce20d9b8a05d5943965d872cbe0ed4690351cff3522dd00f663
dd6035ab7961f73ad631180b5ac20a7a60bd7e54d2ff2b6e90a32b982dc10c55c5b601d5b4cebab9473d873733ef6b91e7e03a520cad8cb4f58c9dd68b238bdc2f9553b95b32f0bf39bcfc80bea9a1a258d0aa90f4754804e8450a4e5c43695fc1713cde461e5c7339ebe595cb3f4cf86e641baac2b95ff309f23f3ce216cf87
ab278c51e3e2c42311814dc7457648ef7df98913010bebc590342b8ce2ca56674767fe274d6417075d4c0862a0a626b35621fc044394f4c9d53326c2eda1e56d7373a4fcef7212e56fb341d24a5ecdd2534f24a7ce2209b5e11a2f1acc5a66fea9ee57fb4764526193747321ce28005b014a161852f869ca9c1d54020760c6ec
a268ddb8993e1c5bdd88b634f96f5d8e0a71d50bdd2ad8edde6cbe6de5b231151c37caff96ef35feba1be6839f869f17410c141eab9311c20a4e8bf7282645e5f7c05376cc54cd04286820f65a6441ebf7ed5e746c2c6ca6b7765085a343fdc97e387130ffb733306759d3d528a20e45a506dc83ac36670c3c3bd1e557b81f87
6db3076039b04bbca4cd5f48fe1364438cc961f70fde16ca2953294094855d655d4d213c5bfd27946a3f8c4b7257113d41844b08789c6f64602566ff72fde04e91da8808a93a92155e0df4f4aa9105e7fc9129c0c80a799d6723652cd89611ffd241b60cc0201d6001a87fbaf843f227f92fad8ab973cffc3fe37b41bb2e9c54
b1506f3816f8c5034da7845eb4b189ab524746624c59006abc065102d8190819da64da80b7867b4f8f4ca75f5077ec627e92e43f25d00a16e6208af35950d9ec5e3d615ea8f92c7d93d2c3a6cb014a9e2604f27f92ff7d039c03deae0317c6a600bf13870080ca7fb440b2084bf97a4c8929d75d198359227327e041f69418fe
1b623fcef8d252edcdc7c6de68a160ebe91e13dc8e792179bba28ad5393a20de5fdd52d8e0d60e441622e1532eab74a2ab84173ce3c28d492069f37cc749fe932bd4c5c3558d4c2872f58567dd9d932cc4b706864cfe5ef514ec69e1e27f825b0b1183910831ed89c58f8ac92fc9f8cd81d330a650a6099bafbf7dfd373b67c5
2ac8ff856eea0fdfda545cc00bb8ca65f515625e5b92f48e1dc3e60e986d9bbc71b546985e8a03b8be36cc1344b7b6e4348092b8772590d4780d0d6773ae1a0dcc96372e8561312d761503d610a6f1213cccd43a5318f0ad3bd673df24f99bfd5fe23622f13e8591ab62482bd431e2f517b51c548e23ae21ff1fd689e657455a
b8458e2512197ef20b94c047cba3f8c1fa9129c5b119e271882877ee25ffc501553c3a42abe5e2c1a2373f282897aa132540bff4f62562af6e9d55b44adddc134f1b411498e19aa7e118c6f0dafe1d1c4452c44ab5b0c8ca0b73449b10b52d6239e89424d58b96d1202ebbc888762cd81e9af12303b0b9db36f9afe39c9b94ff
db0803e757f44e6cc1362e0f397aa1b945c3ed045ba2a18d33f041806157ac24227de466766ad30c28abf9ffc1a02f7ff3472f5a87d444ac8ad5f8500c74a13624c1ef52ec4bd5ecd3ffd79128a41c04b43ac193a0cef83bc010913e6eff49fee18a86288c182d6c19405c50f6ba7c49ed41be6bd560363810bd0647086a8b8a
7895e21676090326c333ad0438e9b8917c9d27f95b86be17d4ca10ed54cafb36fcc3941931c926bbfd022ccaf8dce185f2262a00b15695d2968522cdf272df81d704ef06b47f97bf1d6edb92c45d398305ed850c69a9fc65a1eee9c790682bd851c1ff6f7a5abe2010a6282e6e3d66ab1d4eb99dfcff5d03a3412927a5a81e41
489abf518144df25822bb35deafe228615d3e8ab60ffc8baddbe3af1879ddf28d52b52902e06cef69fbb2e7f1b1ac87113c0d32d18a59ae51101eab41628a5ba05bb274a72c3269e064af0f696dd593ca7843ae52b7e6feea928b4a405c7510bcd335d5f4f10b7ec7f43ed586a436f41df4e1abba61b9b54221aaa0512c2e9c2
81037e8509e7be70d1f70e64ff07c9fe2792ff7e6da23ab8746d240100f2a816a9db90fab39c94b53367d9ee996cbd9316990352b91031acd2b07737b7ff7213c3d9d9df31f9df99a8333072c65d4d5f4a40d0290723015157844df47fb07fc3ffaaa139f857eae946a0641ce21f70ae2f09faa3fccd1002f20aa66f70c2663c
66425f2d7c455ce40021d0b7838bb8e7ade3429d3628bbb36cc81ff3d49fe9a95922aaeae61b4d73ef1eb8e48f63166257f455bb3d5bc5fca1a2fddb94b0a39eb155fec230d445a162151832303468345ba89ee047bfa68a9bfd23fd1f70118fc5900bca1f5d214f2f97d147c3894f3b12822c4230f1b28d97e5a28c4ceca51d
8e5e680a3329d858cab2cabded7de27f3399256137f1bffda3cd37a2cfdb2845ca0d2b8aba987f90d331c21cf267fc9f465f5779f745597ae9762a281fb248397e008030ad2000158c76e022adfeb71ff433e8d454286d71e745e1195fab2cdbf045b89c7071aa617ad262deeff5ade092fe74a2ff252f46b8d2c3b149d50472
413256f20cd9bf01c020ffd2699d2d06d0a93fdbc42b75a56674f752a8867165d2491f4bf34622891a9f70805bbc0b86875387890833b827f071c7f8ef25a645488dd7e5641a81a1314921406aadadfc3632bc7b23e6e5643f2ced33ff157e6cd5f2f82602a8c406ec7f239cdf2b9c8ed77c5921d72097447f24285bf1b12cf1
db3183c186e0a23abada658aac76885852bacb06c14bc5c68c806e31066e6858d0a2008462639da846d55ed88d0e994128fe1758cdf7d5c1f1adb05523ad74bed87836f38595b2d0aaf060d07482d2707fe67e8f8f699b9b4ff7e0192dfc07531f715d3e23e257d9a6d7c875440c5b53a4e7165a59a1b07965bb01b902f3d772
2ec33a625e95dd2e0b535e937f30ce207f8b65f8eaa9e9839965ee980aaf934109217fe80c0bb501281a1e5816eb680ab65918aa6e000b0d271b1afc0fa86ad33c87c5810d97ffc688895187dbd29051c1844e3d0d51df06b1a7e8188b69c014c6654d2a1aa8e2704baa866d755ea4ee2ab7b0dd235020404277265c07b0b60b
d718a43fc09fdbc31dc1e9a0ece76c19a9d850de560b1629b7411ab4b129c539495b567d67df934784712bfeb1c092701fc2fc314c98899939a0a5f1ff65d8bd6ebdae3894fc1724d16bb4de26dc72c0fb30da64bdbecb593d50fe53e17bd17d0e16ce51f8037a7c8c516c585e105400f5802b330293540c8d45a6008e55803b
99ca6b9aa7bb08c6767aeba9087f86c11bdbb86d961edcea90f063076dc7037c7ad7fe83ff57bb4c377c417643c58fc289ffa28c59bc5205b368eb40b98276bd88fd24953b7d56cee07fddbd98e561aa078d903e924f3385ad0d3220a697776bd0709782bee6d4164ebd31d1d21d12cc82c11312a8967cd22fc1d1badd5f29c2
0fd21fecb44f133a49f6afbe9c65881c36b7617ee8c20c7580fff3cc5d766eb49d9dc8d6f132bdb2d3bf8ed90ea01a7e02a13d08d298bafbe6f789ffc35965d4f7cfc1006cd8d741febbfc7a6f0d8c8a536345366001825aaaca0e10a53216d9378ef685a383c3b75a6698560b67f65adb0b63beda87fc2d78d87fe10feb4405
a0add19303dea521827138854bbb78a1657bfe8858160fccfe2d6957b39eda0adad625e55a81781442a88c4649a0ad019ce8a2079879bb2b182ec022e2429e76345814692926f9cc900599e5620961e3d494b232e435eb783a161a67c9f6c3eeabdca068ffaac56c5f72410611ed8b5d6b01066b500c0742cd08ded0957368a7
c92f08398453453653db219d059afce9f0436869c25cef58a679810447f2bf6dfb4397b6ec40e0214cf52e11c0202a2b8653f9e46de21f065ef8066b28ed6c6180880b163eeddb105f2cb44cac7e61d8e21c3a08f9434f1f03190c062f4815e020463f96b0938ec93c29269b0372c8de27079c7dc0254c471375708bb1658b75
67d0bc2515413a1c1428d8942db15fa4c4e885c10aaec1fbe30adb36caa95639b665a18a49c83228ebd6ae3c77e39460d86837cc8e2d8e7018bb58e46277ac07b4718c721340314274883a47968543e55a124b5b2eff177470b87bc352e805b2dabef4a2f686723c70d0509c30e1b7cfed66d71790ff152c5bf6cfda5f70bff7
ec603b7024c3fb6b26303ac225b40212a5d495bd2f912d083ab3ef0264c2e3758b3ebbd8609328d11cbde18b304834d76c52fe16602c2cf14e14a0283adccd652abac179a69658d9523209b8563485061a3b6666414458c40e80587ee01afa1085c1d7e3960f06ef39f65bc7439241104998b0908eae1d71ded68e94f71acee7
__sfx__
217ffb183361b0953c0563d250023e3343956b2f63b0447b0277f1067b3c77b25073301311b3003155e2024a2070b0f034182483563a1c6013b3510415e1263136200082430e21f072082f23f1821e2c54d29737
580ff0513c6713177f0505e3f1660153b266481d56b2952d2f2553a55b064161d37b216191a546084523630b17476237461571b1514a19109157100b05113112337220957f0d3112e43c1057f1a00c1a34025470
c42bc78010120345182172b361000c46d2c063020443f36c00133213202e3761202e087202e64d3b60a38050020780400a361093d171112071e1363877d0e047170742d0452a3071d5460e709290312d37c0a320
2ccc9a410b45d2147f354492d55900366304043e3173223c233210c51b1114c002440b1342b451027111a77f0e373360083e7201951c3f718140143a7182c147084342d16a316091d16803520216710210d1e472
9591f52931722033602816405627245451733b0c5111d7382470a07030174680d05b371242c51b2852a3a45f0736a2955a2547b1350e103110b65233164037042533c0b45f2726f0f66d01555137781a66809361
940495791d17f300003a25f0127a1527b3e10c310023706b370651b70e2566d1d771196652225c2e5300d2050e32a342763601b365002200c2665f0007a0d37a2d7271e3450b40e334193f512010123003639771
8f0b390024300267062d10f2f670000701962b0e06f001723f559287532422f2d32a280061f1072055d1667f2d32c3d01c0e3391d7781042e3714c192003b47520501147230f27409401195010e412275163206b
be6995aa0a041041233363d0060b0066718061017062c5252e31f3a3152845d2a17b172382c5373541e2733a092050f7012a773074493316d1f2460212d09235334523e00c2c27e2b2080051c340533360a3c702
88a389ce2a0270242b2a7043a66d132303d1743b7373901a39318081402560d3d55e0b10b094631263f0f4422a34607757210152d370133663e6003e02c3c54d1d16f3022a3004b05652241122d6050423204043
469038c83c5001f55b0d4333b3231a7733254d0603a3726d2401f3120a3e02602200147771c65c3f22b2567614279311253624a0f074366061a62b1d55201005107791c11c3667c150730c62c19012234182675d
ec5bd6da3a7643853f0966b3b24b0325a3172c000750430e00519247741e0180661b0744f03545026692e74b3c7642737a0c0291c56e0a34d2e3140b10a29037130710f42b1b24e0b11a276250700b2a52226608
a49fc1a53d454364513c3233177e1d4071a16a3950405454206080a33508620043030d11b1665d060602176f2f0412b4782457c060491d7521027f3621a097093963b29408256203f4440c33d0a01d0863f0161b
084201d9227173126f2f530032732a14c196201b55b16200114272177f3146b364683b1402414a242200870818137300631007f1f7102f4402643d320330a77d2e11c0d2030d52e1a7683e77d24220067741e56f
180df8e80970a2245e07077342562f37b2477a062572472e262280c0763623c2a0691466c064573a637144562655908124384710b1043255c3c5653e30a0826c1776a2f145287431743931234073263343638773
724c25553b220152700825a185020534d1253a0664d2660e1110e3f7673c529196171f14d356152e0762a7221916006541007721406718233354482a3482d6040811d1514e051600005e1c1073930a1906702237
6c47e2733c319202361f335282093d6131667d25776311081f16125434140650d06e0003d0642c3f47b3e15f1360231450264510b2312c625215461b26d256151e5113034d3f227397752110d0c00f3831132736
b96e30951707f3f7032a37d1b3723f7103131d2e4771c43c025082522f0116a0314c3f0472940d0c1400a71a3854f0b1662753a2126f0d536194212d4591811b2b300101010432d2663d3f333305720a13838045
cbe04ae5241560314102557040563654b3a54a264571240f3f57f152550d0592a4393f7253477f3710c33500253101560d380300e3770817f015542e23f222273f25b232592114b1c72e111200054f0b34536667
dedc66662c7541977b0955006168197183c7183a7011f01a3a5113014a2d67c0236b0f24d22416146602b028134393f5003f77b2b569136113640d3345f1e0432f6483d74a0d4590845e173193f23d3e14d16400
ff2c862f3000f3877f1830a26761146240d3240305a056303f1580d10d2801028603390142f22212238244121634f013391f1523e75d024113b5413a052373032f204317531267b2503c0f63309479311292315f
e515f2c72702d0d60c0802d1d66e07361265352d220130092377a1267f3533f150162851e1d4770d12e2d26b094070d4381c7061e2161853c321003353c010762c422263023f7583a573292190114f1a15c0326f
3a6ff49b354283d7081f105305511177f0757e121653967f1f36d3176d3051422108133070e1020a72a2c7292554b006682226f172293f1071a249136523470c1d55b3c7781962c370260e60b3303a2b56936616
d4c137ac154202e3651a357377020977206238094103d1050705c1f4673156027361356001367f31134071230917f17302343513214c126730730b0727a0a600257703f220334570243b32608043743277d1467e
da1555082624c2d6000e6061b65f2440b2a54c3f053213643c3332f5681742c1b4782542a165730140f281413e222325301c5233815e305613b5313e1570463d0c17b17129160562d53f1e50a3a1043c5592c002
0bdc0816077570732c3e330280061d0413b30e2a2270f056115010d00003025162412542e2a5093361a045640e3072947f3f01a095642e2263f36a224753245b3820416664042103106a1f6163a318341423f100
e9464d540d603347132040f0c74e1c1080e15d1726f3713d2d228376001f27b3d6090544d3b32d0360124770024003502538777262212630a0014a184430500307748376001817f0f04c0c4780744f1b00f3e67b
c89a76700d044052551f66d2f7582e71d347003314b3701a0b5062170e1a55a1a264054053601d2b1392100c215192a6550c13b2a5460642620156005092f509115642d5581752f1525507232375490d77b0a17f
61007b2d1d4351812a34028373280f01b1a74818531345412c449135412a6082e10a3b1260b22b1d46e1f6111c513384083d60a3c7180d000002751101e1d5662a67a012151e3301277b022311d0611910a1951e
c8ee2b8f0941c2a1010b2430c557201301b36d3e2202753e0931c1220b000283b04b0a37d1537533544096083d6502534b213512c0353060d215143677d0065e3b6781a61d0522320703331213b72e0824215141
ea3ec17b056372251836721091663a1742b732324253104f143260e2082245d3254b0d61e3704e365452633e3c5581e72416740385461a5302d753103032211d0f330197530017c030442710b2a7103827830564
5e320a020036a18364316602d5351b16108406145770422139252053021102d1376e1f44e1260d1307e3f7023f14c0b32423538240742167f1f7342c53a2b043223163f76d1127e393222355b26272182002f702
8a7d9cdb0300e3237e3126c372261f32c1d40e3d0040b47c3510e2046c1207e1152e1772e314643524d0f540080600f3273f1043d73800506337742574d116371435c3f3592477a373643b20c282041547e0f16b
603862413f42e2f55609278142040f2593e1640836f3f3051232f2a10e3a035047061475b0e02c2d257215340542f0b274077272616438250030201b20f2235900721397510921b1f15d01443034551a1462f263
6ef2dfbc0620c130353d2253025d1b76e1f03a014490744f2362d373401810c247783a633247700b6232f267354483977925000005313545a2b03e3f7210b168203381341e0743c34171200182f6690e45b0211b
cbffe0592b37f1f62e040360765e042401736a2175a38240055583c40d3a06136328367760425f231643d25a0e26c3e67a2c210041740137b3f2120a00c0b352250792451e3a3640812e0e3382b32c3d53d14551
5dfebaff2d61805316076070a13d165772d41f225291213f2f47b02117332373d14918277111523805319027274590864a03003324740d07b184583616e070682714b2974c13651374421f02c2077a2e11933562
241fa92c060721a351260513244d1623c0447a3905d1d5251951d214593771a231131d4572067710652026051870f36073257771b3480402c1a7303b73c1c54d2511f0751533665366020811c09653305162817c
b755f98618246100090d63f0410c300341b359320471603b0c0043d36c0c24f1344804763204603877728179357492d47e1375b0a2333821e0a7602867d154462515c1f623025171c6591303b0700d3324832018
1dbc43ce11418317710e1122037e1d623156332c130283442937b0e5231b22937313250492a326213170875c1b55d222421962102605335170c0070825a3b55011440291090226c2e76d3d52f0b5080112837710
ee79ccf60642922022382243d50c18471230033c46d18201387480673b0a463045243c4152b049001223503c2552f26052003732577c3e5072177b3b3432b62b386073141d3624a0d712301252b3643e24e05151
b751a2413c4123f27c1326f112482c70a106001c0463351b2463f071200764a306572b561347212c038061522c7070935e3802e2f1670071d1211f3721b054671a7212b0763652f0b10a2005f3f146053513b770
6e0e85773c559340742e15a2617b2f0600d57f3f051104091d14031009024073e52e0371b31136202151775437147202332c772300390452410040381193d462156792054a0e23d0a07d210220163f3424b38174
287f8b592363b3720c0e76039436166252e176115280c45f1b4072c1442237e131302953e1150b0b4441b6502f30c3c65b252792d251104472045f27144182281403f0e0342d06f2f17f143183d4241c30923642
482a2a5f2802d1f16e322782817b0021f372192e25e3f6390c6602107e325283e416120731e73e24140057493f7333a4101976826319336183e4743423d1217f346092d1223816c24438147590b07a071280d207
45a870970164f0031c140031b5350c7562036d2a760167670716c212321c15c0227627033146453e74b0343a364482c00d293411e00025320337483150d1d07d1b33617412265620872a345180801c3f65516314
23fcffdd3273311361212292b12f114310d0042a10e3b0012a66a1241b2f362023781503706218160440a30e016223f1043b4510976a3b65528704216420d17e205680d42e2f1251f0182d0691540d0b6420541a
c266d3710140d1d0481473a0340d002210b7150017b1b5123c238244001827e1d41d1b0623770b2c75c2d77d3402e0e7622513a0360c1e3110d64e1b33e2f0390a3160e0041e7450b07132727154571c2141b516
a2c77f24315793d53c035072420b3f7002a5281857f01232067221410e3235d2d0370f42915417232051d1290b5182e4000b3652c4710b4713f0333971b082030453e2b726043073522e2f0412833f0f17f0f64e
728f8bbc2753b305761465210118303542475a2f3103142c154011b362152593931c0833f237330875611574010031c3203f156372112267f2723231429284490d461332660a72f1105a281112b3032737d26460
a33acd171063f181303c55c2766c2607e205682b05f104721843d3634118148112643e3280b73c174371877f251771d7523004b141471d14c3f5553d4072860e1a33905431187700b016136021b3093845b30677
a17541592d7032a57e3b56910461245510277716007172053304a1a3201c01a2975c1056117439371702477f1940b2700f2a4782f71a34300283552e3172922032773237420f2561767f3102e3f3411d3201663b
923f4939191193f74e383030a77700000370073b56b023141845a3370d002090a24d2221a0d0140b423056162375516541030653321a21012203303903516233381433330e1b166325353e44e1c121333232640f
dec05f230d173384051a05f1a451117181b0340325a3b04d253031652f2034e0603d055470d6283c5101223c18504323470423c0d5142c32f383353216d2767f1f0522c5243b7382852d357301f1582566217210
fd87d118262292c13b07149314221a5100204b332342c57c3371b074482c6000163c32355284553177f314093b300387770823315616097711837c2a7792107609251205051a64c1e3200076c062662705b3b40a
74c0070d3317b0b151087191256c0565b036190477f1061e3f652077400b2230b46b2416f1f203370020f75e3530a3b65f27349257012b60a2021e39218036353b6672165529343060263d3202434c2045a19551
97ae41111a2762c4523c0160f4133612213406354031b6652f204030420911616011377693077b3672c2a02c2d1263c4451f41c30500206343c63d335410b651106732d16c1c45a014441836b2b000227103635d
c3b4f19a0c2412605c294030c650002750036f014400e44c1f4682d00f365541a5761467b1657f1e041135182b271015372f3163c5341177f334111e7383d716210312577a3b2251c45d1e1343516e1853429668
cb068cbf1466c352140521711109103270f73a271451d31e0a25b1f21e3f320257722b176195142b421091642a278072543f7711c71f2d4572c1781977f1e4630d2090f11232544184113266e086343413333539
1b4e266f243552473a0422528467066732f50b2d531270120e714287650a17f0300a0d0700c231077241004c1c5013b3183c72d0a77a0264d044090e46b216372177d017460e1060e2323b60a3954f305222313c
2dfc03800764c1d67e31613343501e66e031602470f2d61633100346202e2413634d306012b62b0b3423f72a24770045530031720351282573f703135220a7772431f27631326071e4183a26d24315090480f641
3f50246b1306e1f626005191a45a1405b0f76c366292d6633f7732b058320333e67e13326184661676c0b3131a65509266136023c224030272c42e2a56a0c0173e0083c065180191b661385612d2622516c05550
e3f1774e074550a27f0117f0033c17534145392762a0b77d1614c1926f052060c67a3d03f2a5200a6533a7121534a394152853d0453e0425d32217021191d33f070422a73828337273062072a3443b357162421c
eb4818921933f33638182682262d2e157015682651e0977d1535c0000c3e0222e104034392e47f2116a3813d1267b3c7731874b014393706d05205085563e422283283f772153603602f3e0501b7260300815644
87a87fac3724e0026f0f6402c1443f30227455074220e23b0230b217672e6542b1740f36c3e745040683371c0922b067252b5451e70a196062d00a2947d1e65f0311e2000e1e4130961f2b4231d4733644f1b417
__music__
0a 72067d6a
05 411d3b01
0b 0d77621b
0e 575a3558
09 03047d38
09 095e5778
0e 7f647f47
01 0c17220b
01 6e02523f
0a 0d721f41
0e 326e4043
06 23133f04
0c 7a3f3f53
05 69720c63
0a 35247f3d
0a 4f447969
0f 7e7f586d
02 5f72370f
0a 71252271
0d 76063d79
07 5064386d
04 567b170a
04 48735903
07 085f176b
00 243b782d
05 47066542
0a 705f1852
09 5b5e4b7e
07 18645d4c
0d 7e174c7f
01 496d1b5c
0d 7c005569
01 092f245c
08 48051872
00 36496f75
04 4d04502e
0b 7f654822
0b 0a5d0322
07 493c785d
0b 46264f77
08 62323b63
06 26600664
07 7f477b66
09 2e682a75
0f 68662a60
02 015c3b0f
0c 2c41364b
01 5c112d17
00 1c512574
0d 025b636d
04 3b2b7c41
06 46571803
0c 3c0e7b58
02 796c754b
0f 786f0a45
03 14115121
06 7b600037
0a 2b67564c
0f 7e11535d
08 1b443530
01 450b417c
0d 67357c2d
04 797d1b75
0f 5453594f
