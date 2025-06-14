; ModuleID = 'lib.a4a84c0ce7adf3d6-cgu.0'
source_filename = "lib.a4a84c0ce7adf3d6-cgu.0"
target datalayout = "e-m:e-p:32:32-p10:8:8-p20:8:8-i64:64-n32:64-S128-ni:1:10:20"
target triple = "wasm32-unknown-unknown"

%ThreadIdx = type { i32, i32, i32 }
%BlockIdx = type { i32, i32, i32 }
%BlockDim = type { i32, i32, i32 }

@alloc_289b84035b3220255b84b8869a538376 = private unnamed_addr constant <{ [69 x i8] }> <{ [69 x i8] c"unsafe precondition(s) violated: usize::unchecked_add cannot overflow" }>, align 1
@alloc_b8d608a939be3296158da5aeae0a94c6 = private unnamed_addr constant <{ [6 x i8] }> <{ [6 x i8] c"lib.rs" }>, align 1
@alloc_953ac363862f989fed22fd5b19c8bf30 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00(\00\00\00\12\00\00\00" }>, align 4
@alloc_99e06ec59ea595cb982aef921476d1fb = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00(\00\00\00\11\00\00\00" }>, align 4
@alloc_bad60ba3298dcfb796fab18b89a076a4 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00+\00\00\00\1D\00\00\00" }>, align 4
@alloc_29d75ae37cb3bc586b212f3fc53fcdbb = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00+\00\00\00-\00\00\00" }>, align 4
@alloc_ab84b37a6e25f01c648e8d822d201568 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00+\00\00\00\0D\00\00\00" }>, align 4
@alloc_a7337aefd3430e5f3ae6986085a8943e = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00:\00\00\00\12\00\00\00" }>, align 4
@alloc_0bf4661680c060226aa9695c5604d86a = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00:\00\00\00\11\00\00\00" }>, align 4
@alloc_22230bead5b292cc3002f171fa3ee92f = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00=\00\00\00\1D\00\00\00" }>, align 4
@alloc_0cad69ef0a2dde4bf717222a82ed7059 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00=\00\00\00-\00\00\00" }>, align 4
@alloc_612fa7f9d702d1b0770005a52cdd4040 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00=\00\00\00\0D\00\00\00" }>, align 4
@alloc_a054c0ee2e1ec6311f6f88f45fe1589a = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00P\00\00\00\12\00\00\00" }>, align 4
@alloc_29edfcf511c979a205056468a2e44f05 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00P\00\00\00\11\00\00\00" }>, align 4
@alloc_6d553a946cdaa15b3adaff86f8f2eb80 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00T\00\00\00\19\00\00\00" }>, align 4
@alloc_f6762ba5e06f1dd171222cc693c33ad2 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00T\00\00\00%\00\00\00" }>, align 4
@alloc_8881fa30d080ae854e1afa24426a72cc = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00T\00\00\00\0D\00\00\00" }>, align 4
@alloc_da728090e115b6bc7c09d03c75b35fda = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00V\00\00\00\0F\00\00\00" }>, align 4
@alloc_e56edd30e8574d0563525398cba5f56f = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00V\00\00\00\0E\00\00\00" }>, align 4
@alloc_57e7f310305477def3a06ab7103b4ad3 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00V\00\00\00\09\00\00\00" }>, align 4
@alloc_9d24817f5a3b39519d83af2fd8a20c28 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00f\00\00\00\12\00\00\00" }>, align 4
@alloc_d7ce86918d304f92dec812763db77522 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00f\00\00\00\11\00\00\00" }>, align 4
@alloc_01a19de0f6bbb275f64a884ce94ee59f = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00i\00\00\00\1D\00\00\00" }>, align 4
@alloc_da61175e9c3b1dd68817350003802f26 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00i\00\00\00\0D\00\00\00" }>, align 4
@alloc_ceb82e5a47c5715cba27fcf7c0b5866f = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00z\00\00\00\17\00\00\00" }>, align 4
@alloc_f18398194fc0b3a1fcd7c65334321db0 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00z\00\00\00\16\00\00\00" }>, align 4
@alloc_5f098b4704ded2783121a055ab259dab = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00{\00\00\00\10\00\00\00" }>, align 4
@alloc_2e761d469539f4f8386a58bb72750f31 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00{\00\00\00\0F\00\00\00" }>, align 4
@alloc_996c47994551f36383d683e76f157529 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\86\00\00\00\15\00\00\00" }>, align 4
@alloc_ff7d22422cb0cf14880ce160e43dc087 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\88\00\00\00\0D\00\00\00" }>, align 4
@alloc_b650210c97ea5deb8e7ad4daaf9a43d3 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\80\00\00\00\19\00\00\00" }>, align 4
@alloc_f50345d98df1c590a94332c63192a250 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\81\00\00\00\19\00\00\00" }>, align 4
@alloc_102c74d37a1b38a64459e479866b5247 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\83\00\00\00\18\00\00\00" }>, align 4
@alloc_f42be0c73fdac7af778010681c188cfc = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\83\00\00\00(\00\00\00" }>, align 4
@alloc_0d5e23dfa48c7cd056050e3b79f7a92b = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\83\00\00\00\11\00\00\00" }>, align 4
@alloc_90ee939770c9274936c9304ad670f762 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\97\00\00\00\10\00\00\00" }>, align 4
@alloc_14653ceb87d7a6d0a874b58729abe30c = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\97\00\00\00\0F\00\00\00" }>, align 4
@alloc_fe6f0aa3d92ce491c83d8757dc7388da = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\98\00\00\00\10\00\00\00" }>, align 4
@alloc_fb209e4ff747acd5e1e28f13041a0697 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\98\00\00\00\0F\00\00\00" }>, align 4
@alloc_c2e7c08e18c55866b650a4c593470ecb = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\9C\00\00\00\19\00\00\00" }>, align 4
@alloc_acd97dd57980d75f9b233496ea8fad46 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\9D\00\00\00\1A\00\00\00" }>, align 4
@alloc_97ac010c69806fc7389169324aae9f8b = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\A0\00\00\00'\00\00\00" }>, align 4
@alloc_14bb6428041e6f1bd4b26a1cf7fa4bc8 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\A0\00\00\00\0D\00\00\00" }>, align 4
@alloc_1086ad80c96435981262190db8afed0f = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\B0\00\00\00\10\00\00\00" }>, align 4
@alloc_4cb37460ed473180a0e65f2ec010965f = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\B0\00\00\00\0F\00\00\00" }>, align 4
@alloc_c9dccff83bfba1c1e98dcdc1e599be55 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\B6\00\00\00\13\00\00\00" }>, align 4
@alloc_b03bf4639511c6cb5840a6e7dd1a4bdf = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\B6\00\00\00!\00\00\00" }>, align 4
@alloc_ce8f02ae43158c6f1ade3ef3a1b0a5b2 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\B7\00\00\00\0D\00\00\00" }>, align 4
@alloc_6dc368ac0f5129e4502095eebbff1020 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\C5\00\00\00\10\00\00\00" }>, align 4
@alloc_1e3d9b901e7744707a0ddbc2b9825c91 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\C5\00\00\00\0F\00\00\00" }>, align 4
@alloc_6b53b56e6c46a41797419148833ff0e2 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\C8\00\00\00\17\00\00\00" }>, align 4
@alloc_7e4b3613342d9c1edd3a659427531162 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\C9\00\00\00\0D\00\00\00" }>, align 4
@alloc_a2b8f2b14f52042d4256fcab92b4735c = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\DA\00\00\00\12\00\00\00" }>, align 4
@alloc_d3fbb5e51c1c9eb78e3c08423f251200 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\DA\00\00\00\11\00\00\00" }>, align 4
@alloc_22533ebdac495a0ac460cc6b55a42f48 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\DB\00\00\00\12\00\00\00" }>, align 4
@alloc_773da82417bf83b3f19b624e802e7f3c = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\DB\00\00\00\11\00\00\00" }>, align 4
@alloc_911af8cc4b95266c676c93947088dd71 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\DD\00\00\00\19\00\00\00" }>, align 4
@alloc_74e44f8b9dda7b1b867c5d867e22cdf7 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\DE\00\00\00\18\00\00\00" }>, align 4
@alloc_c26b2b4e721a6e5bb0174b15bf53c14c = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\E1\00\00\00\1A\00\00\00" }>, align 4
@alloc_cfc4913e75d26c6b4e3efc69f5c64536 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\E2\00\00\00\1A\00\00\00" }>, align 4
@alloc_19b02c5569accd812868bdca16e2aa65 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\F4\00\00\00\1B\00\00\00" }>, align 4
@alloc_57a2ca4ae80cda11e440323e33569cf7 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\F5\00\00\00\0D\00\00\00" }>, align 4
@alloc_fa8bc99c2ebdaedb3247b56cff5110f9 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\E8\00\00\00\1C\00\00\00" }>, align 4
@alloc_a1ebd876254b1dc432a62d35fbf04f57 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\E9\00\00\00\1C\00\00\00" }>, align 4
@alloc_81023a066df163d95dd148b55e223e70 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\EC\00\00\00\1F\00\00\00" }>, align 4
@alloc_aef100b777b16bb0855040ed08807812 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\ED\00\00\00\1F\00\00\00" }>, align 4
@alloc_29ebdeeddedb0447ff5237604efe725c = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\0F\01\00\00\10\00\00\00" }>, align 4
@alloc_251daf577e40a1183a37245c19bde16a = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\0F\01\00\00\0F\00\00\00" }>, align 4
@alloc_4465dfd240857ae22e53e89c9128be10 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00'\01\00\00\1B\00\00\00" }>, align 4
@alloc_7218e97f0d127828635e79d07730fa78 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00(\01\00\00$\00\00\00" }>, align 4
@alloc_5fe0c5950edc50faeb8a68ef3e1f53b0 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00(\01\00\00\11\00\00\00" }>, align 4
@alloc_073edc48a205d6c854825ca87e43d4b7 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\1E\01\00\00\1B\00\00\00" }>, align 4
@alloc_50ff918821cbe80445b5603c2644014d = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\1F\01\00\00&\00\00\00" }>, align 4
@alloc_22b2a57ed6fb3613e85596665afdc79c = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00 \01\00\00\11\00\00\00" }>, align 4
@alloc_2dc3fc36bd9bad972bacd5f99803fe25 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\15\01\00\00\1B\00\00\00" }>, align 4
@alloc_468faf02ec7375d2a8bcef0a5fe6497c = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_b8d608a939be3296158da5aeae0a94c6, [12 x i8] c"\06\00\00\00\16\01\00\00\1B\00\00\00" }>, align 4

; <usize as core::iter::range::Step>::forward_unchecked
; Function Attrs: inlinehint nounwind
define internal i32 @"_ZN49_$LT$usize$u20$as$u20$core..iter..range..Step$GT$17forward_unchecked17h5e54375cc9090828E"(i32 %start1, i32 %n) unnamed_addr #0 {
start:
  br label %bb1

bb1:                                              ; preds = %start
; call core::num::<impl usize>::unchecked_add::precondition_check
  call void @"_ZN4core3num23_$LT$impl$u20$usize$GT$13unchecked_add18precondition_check17ha5526db3375ef373E"(i32 %start1, i32 %n) #6
  br label %bb2

bb2:                                              ; preds = %bb1
  %_0 = add nuw i32 %start1, %n
  ret i32 %_0
}

; core::num::<impl usize>::unchecked_add::precondition_check
; Function Attrs: inlinehint nounwind
define internal void @"_ZN4core3num23_$LT$impl$u20$usize$GT$13unchecked_add18precondition_check17ha5526db3375ef373E"(i32 %lhs, i32 %rhs) unnamed_addr #0 {
start:
  %0 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %lhs, i32 %rhs)
  %_5.0 = extractvalue { i32, i1 } %0, 0
  %_5.1 = extractvalue { i32, i1 } %0, 1
  br i1 %_5.1, label %bb1, label %bb2

bb2:                                              ; preds = %start
  ret void

bb1:                                              ; preds = %start
; call core::panicking::panic_nounwind
  call void @_ZN4core9panicking14panic_nounwind17hc189c31fedd6a605E(ptr align 1 @alloc_289b84035b3220255b84b8869a538376, i32 69) #7
  unreachable
}

; core::iter::range::<impl core::iter::traits::iterator::Iterator for core::ops::range::Range<A>>::next
; Function Attrs: inlinehint nounwind
define internal { i32, i32 } @"_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hce2dd5e42e891459E"(ptr align 4 %self) unnamed_addr #0 {
start:
; call <core::ops::range::Range<T> as core::iter::range::RangeIteratorImpl>::spec_next
  %0 = call { i32, i32 } @"_ZN89_$LT$core..ops..range..Range$LT$T$GT$$u20$as$u20$core..iter..range..RangeIteratorImpl$GT$9spec_next17hb609e38ed37b9e28E"(ptr align 4 %self) #6
  %_0.0 = extractvalue { i32, i32 } %0, 0
  %_0.1 = extractvalue { i32, i32 } %0, 1
  %1 = insertvalue { i32, i32 } poison, i32 %_0.0, 0
  %2 = insertvalue { i32, i32 } %1, i32 %_0.1, 1
  ret { i32, i32 } %2
}

; <I as core::iter::traits::collect::IntoIterator>::into_iter
; Function Attrs: inlinehint nounwind
define internal { i32, i32 } @"_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17ha28445c3727553ffE"(i32 %self.0, i32 %self.1) unnamed_addr #0 {
start:
  %0 = insertvalue { i32, i32 } poison, i32 %self.0, 0
  %1 = insertvalue { i32, i32 } %0, i32 %self.1, 1
  ret { i32, i32 } %1
}

; <core::ops::range::Range<T> as core::iter::range::RangeIteratorImpl>::spec_next
; Function Attrs: inlinehint nounwind
define internal { i32, i32 } @"_ZN89_$LT$core..ops..range..Range$LT$T$GT$$u20$as$u20$core..iter..range..RangeIteratorImpl$GT$9spec_next17hb609e38ed37b9e28E"(ptr align 4 %self) unnamed_addr #0 {
start:
  %_0 = alloca [8 x i8], align 4
  %_4 = getelementptr inbounds i8, ptr %self, i32 4
  %_3.i = load i32, ptr %self, align 4
  %_4.i = load i32, ptr %_4, align 4
  %_0.i = icmp ult i32 %_3.i, %_4.i
  br i1 %_0.i, label %bb2, label %bb4

bb4:                                              ; preds = %start
  store i32 0, ptr %_0, align 4
  br label %bb5

bb2:                                              ; preds = %start
  %old = load i32, ptr %self, align 4
; call <usize as core::iter::range::Step>::forward_unchecked
  %_6 = call i32 @"_ZN49_$LT$usize$u20$as$u20$core..iter..range..Step$GT$17forward_unchecked17h5e54375cc9090828E"(i32 %old, i32 1) #6
  store i32 %_6, ptr %self, align 4
  %0 = getelementptr inbounds i8, ptr %_0, i32 4
  store i32 %old, ptr %0, align 4
  store i32 1, ptr %_0, align 4
  br label %bb5

bb5:                                              ; preds = %bb2, %bb4
  %1 = load i32, ptr %_0, align 4
  %2 = getelementptr inbounds i8, ptr %_0, i32 4
  %3 = load i32, ptr %2, align 4
  %4 = insertvalue { i32, i32 } poison, i32 %1, 0
  %5 = insertvalue { i32, i32 } %4, i32 %3, 1
  ret { i32, i32 } %5
}

; Function Attrs: nounwind
define dso_local void @vector_add_kernel(%ThreadIdx %0, %BlockIdx %1, %BlockDim %2, ptr %a, ptr %b, ptr %c, i32 %n) unnamed_addr #1 {
start:
  %block_dim = alloca [12 x i8], align 4
  %block_idx = alloca [12 x i8], align 4
  %thread_idx = alloca [12 x i8], align 4
  store %ThreadIdx %0, ptr %thread_idx, align 4
  store %BlockIdx %1, ptr %block_idx, align 4
  store %BlockDim %2, ptr %block_dim, align 4
  %_11 = load i32, ptr %block_idx, align 4
  %_12 = load i32, ptr %block_dim, align 4
  %3 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_11, i32 %_12)
  %_13.0 = extractvalue { i32, i1 } %3, 0
  %_13.1 = extractvalue { i32, i1 } %3, 1
  br i1 %_13.1, label %panic, label %bb1

bb1:                                              ; preds = %start
  %_14 = load i32, ptr %thread_idx, align 4
  %4 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_13.0, i32 %_14)
  %_15.0 = extractvalue { i32, i1 } %4, 0
  %_15.1 = extractvalue { i32, i1 } %4, 1
  br i1 %_15.1, label %panic1, label %bb2

panic:                                            ; preds = %start
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_953ac363862f989fed22fd5b19c8bf30) #7
  unreachable

bb2:                                              ; preds = %bb1
  %_16 = icmp ult i32 %_15.0, %n
  br i1 %_16, label %bb3, label %bb8

panic1:                                           ; preds = %bb1
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_99e06ec59ea595cb982aef921476d1fb) #7
  unreachable

bb8:                                              ; preds = %bb9, %bb2
  ret void

bb3:                                              ; preds = %bb2
  %_0.i7 = getelementptr inbounds i32, ptr %a, i32 %_15.0
  %_36 = ptrtoint ptr %_0.i7 to i32
  %_39 = and i32 %_36, 3
  %_40 = icmp eq i32 %_39, 0
  br i1 %_40, label %bb11, label %panic2

bb11:                                             ; preds = %bb3
  %_17 = load i32, ptr %_0.i7, align 4
  %_0.i6 = getelementptr inbounds i32, ptr %b, i32 %_15.0
  %_30 = ptrtoint ptr %_0.i6 to i32
  %_33 = and i32 %_30, 3
  %_34 = icmp eq i32 %_33, 0
  br i1 %_34, label %bb10, label %panic3

panic2:                                           ; preds = %bb3
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_36, ptr align 4 @alloc_bad60ba3298dcfb796fab18b89a076a4) #7
  unreachable

bb10:                                             ; preds = %bb11
  %_19 = load i32, ptr %_0.i6, align 4
  %5 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %_17, i32 %_19)
  %_21.0 = extractvalue { i32, i1 } %5, 0
  %_21.1 = extractvalue { i32, i1 } %5, 1
  br i1 %_21.1, label %panic4, label %bb6

panic3:                                           ; preds = %bb11
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_30, ptr align 4 @alloc_29d75ae37cb3bc586b212f3fc53fcdbb) #7
  unreachable

bb6:                                              ; preds = %bb10
  %_0.i = getelementptr inbounds i32, ptr %c, i32 %_15.0
  %_24 = ptrtoint ptr %_0.i to i32
  %_27 = and i32 %_24, 3
  %_28 = icmp eq i32 %_27, 0
  br i1 %_28, label %bb9, label %panic5

panic4:                                           ; preds = %bb10
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_bad60ba3298dcfb796fab18b89a076a4) #7
  unreachable

bb9:                                              ; preds = %bb6
  store i32 %_21.0, ptr %_0.i, align 4
  br label %bb8

panic5:                                           ; preds = %bb6
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_24, ptr align 4 @alloc_ab84b37a6e25f01c648e8d822d201568) #7
  unreachable
}

; Function Attrs: nounwind
define dso_local void @vector_sub_kernel(%ThreadIdx %0, %BlockIdx %1, %BlockDim %2, ptr %a, ptr %b, ptr %c, i32 %n) unnamed_addr #1 {
start:
  %block_dim = alloca [12 x i8], align 4
  %block_idx = alloca [12 x i8], align 4
  %thread_idx = alloca [12 x i8], align 4
  store %ThreadIdx %0, ptr %thread_idx, align 4
  store %BlockIdx %1, ptr %block_idx, align 4
  store %BlockDim %2, ptr %block_dim, align 4
  %_11 = load i32, ptr %block_idx, align 4
  %_12 = load i32, ptr %block_dim, align 4
  %3 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_11, i32 %_12)
  %_13.0 = extractvalue { i32, i1 } %3, 0
  %_13.1 = extractvalue { i32, i1 } %3, 1
  br i1 %_13.1, label %panic, label %bb1

bb1:                                              ; preds = %start
  %_14 = load i32, ptr %thread_idx, align 4
  %4 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_13.0, i32 %_14)
  %_15.0 = extractvalue { i32, i1 } %4, 0
  %_15.1 = extractvalue { i32, i1 } %4, 1
  br i1 %_15.1, label %panic1, label %bb2

panic:                                            ; preds = %start
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_a7337aefd3430e5f3ae6986085a8943e) #7
  unreachable

bb2:                                              ; preds = %bb1
  %_16 = icmp ult i32 %_15.0, %n
  br i1 %_16, label %bb3, label %bb8

panic1:                                           ; preds = %bb1
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_0bf4661680c060226aa9695c5604d86a) #7
  unreachable

bb8:                                              ; preds = %bb9, %bb2
  ret void

bb3:                                              ; preds = %bb2
  %_0.i7 = getelementptr inbounds i32, ptr %a, i32 %_15.0
  %_36 = ptrtoint ptr %_0.i7 to i32
  %_39 = and i32 %_36, 3
  %_40 = icmp eq i32 %_39, 0
  br i1 %_40, label %bb11, label %panic2

bb11:                                             ; preds = %bb3
  %_17 = load i32, ptr %_0.i7, align 4
  %_0.i6 = getelementptr inbounds i32, ptr %b, i32 %_15.0
  %_30 = ptrtoint ptr %_0.i6 to i32
  %_33 = and i32 %_30, 3
  %_34 = icmp eq i32 %_33, 0
  br i1 %_34, label %bb10, label %panic3

panic2:                                           ; preds = %bb3
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_36, ptr align 4 @alloc_22230bead5b292cc3002f171fa3ee92f) #7
  unreachable

bb10:                                             ; preds = %bb11
  %_19 = load i32, ptr %_0.i6, align 4
  %5 = call { i32, i1 } @llvm.ssub.with.overflow.i32(i32 %_17, i32 %_19)
  %_21.0 = extractvalue { i32, i1 } %5, 0
  %_21.1 = extractvalue { i32, i1 } %5, 1
  br i1 %_21.1, label %panic4, label %bb6

panic3:                                           ; preds = %bb11
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_30, ptr align 4 @alloc_0cad69ef0a2dde4bf717222a82ed7059) #7
  unreachable

bb6:                                              ; preds = %bb10
  %_0.i = getelementptr inbounds i32, ptr %c, i32 %_15.0
  %_24 = ptrtoint ptr %_0.i to i32
  %_27 = and i32 %_24, 3
  %_28 = icmp eq i32 %_27, 0
  br i1 %_28, label %bb9, label %panic5

panic4:                                           ; preds = %bb10
; call core::panicking::panic_const::panic_const_sub_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_sub_overflow17h4bde73793043cc8eE(ptr align 4 @alloc_22230bead5b292cc3002f171fa3ee92f) #7
  unreachable

bb9:                                              ; preds = %bb6
  store i32 %_21.0, ptr %_0.i, align 4
  br label %bb8

panic5:                                           ; preds = %bb6
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_24, ptr align 4 @alloc_612fa7f9d702d1b0770005a52cdd4040) #7
  unreachable
}

; Function Attrs: nounwind
define dso_local void @vector_add_loop_kernel(%ThreadIdx %0, %BlockIdx %1, %BlockDim %2, ptr %a, ptr %b, ptr %c, i32 %n) unnamed_addr #1 {
start:
  %i = alloca [4 x i8], align 4
  %block_dim = alloca [12 x i8], align 4
  %block_idx = alloca [12 x i8], align 4
  %thread_idx = alloca [12 x i8], align 4
  store %ThreadIdx %0, ptr %thread_idx, align 4
  store %BlockIdx %1, ptr %block_idx, align 4
  store %BlockDim %2, ptr %block_dim, align 4
  %_11 = load i32, ptr %block_idx, align 4
  %_12 = load i32, ptr %block_dim, align 4
  %3 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_11, i32 %_12)
  %_13.0 = extractvalue { i32, i1 } %3, 0
  %_13.1 = extractvalue { i32, i1 } %3, 1
  br i1 %_13.1, label %panic, label %bb1

bb1:                                              ; preds = %start
  %_14 = load i32, ptr %thread_idx, align 4
  %4 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_13.0, i32 %_14)
  %_15.0 = extractvalue { i32, i1 } %4, 0
  %_15.1 = extractvalue { i32, i1 } %4, 1
  br i1 %_15.1, label %panic1, label %bb2

panic:                                            ; preds = %start
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_a054c0ee2e1ec6311f6f88f45fe1589a) #7
  unreachable

bb2:                                              ; preds = %bb1
  store i32 %_15.0, ptr %i, align 4
  br label %bb3

panic1:                                           ; preds = %bb1
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_29edfcf511c979a205056468a2e44f05) #7
  unreachable

bb3:                                              ; preds = %bb11, %bb2
  %_17 = load i32, ptr %i, align 4
  %_16 = icmp ult i32 %_17, %n
  br i1 %_16, label %bb4, label %bb12

bb12:                                             ; preds = %bb3
  ret void

bb4:                                              ; preds = %bb3
  %_20 = load i32, ptr %i, align 4
  %_0.i10 = getelementptr inbounds i32, ptr %a, i32 %_20
  %_49 = ptrtoint ptr %_0.i10 to i32
  %_52 = and i32 %_49, 3
  %_53 = icmp eq i32 %_52, 0
  br i1 %_53, label %bb15, label %panic2

bb15:                                             ; preds = %bb4
  %_18 = load i32, ptr %_0.i10, align 4
  %_23 = load i32, ptr %i, align 4
  %_0.i9 = getelementptr inbounds i32, ptr %b, i32 %_23
  %_43 = ptrtoint ptr %_0.i9 to i32
  %_46 = and i32 %_43, 3
  %_47 = icmp eq i32 %_46, 0
  br i1 %_47, label %bb14, label %panic3

panic2:                                           ; preds = %bb4
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_49, ptr align 4 @alloc_6d553a946cdaa15b3adaff86f8f2eb80) #7
  unreachable

bb14:                                             ; preds = %bb15
  %_21 = load i32, ptr %_0.i9, align 4
  %5 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %_18, i32 %_21)
  %_24.0 = extractvalue { i32, i1 } %5, 0
  %_24.1 = extractvalue { i32, i1 } %5, 1
  br i1 %_24.1, label %panic4, label %bb7

panic3:                                           ; preds = %bb15
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_43, ptr align 4 @alloc_f6762ba5e06f1dd171222cc693c33ad2) #7
  unreachable

bb7:                                              ; preds = %bb14
  %_26 = load i32, ptr %i, align 4
  %_0.i = getelementptr inbounds i32, ptr %c, i32 %_26
  %_37 = ptrtoint ptr %_0.i to i32
  %_40 = and i32 %_37, 3
  %_41 = icmp eq i32 %_40, 0
  br i1 %_41, label %bb13, label %panic5

panic4:                                           ; preds = %bb14
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_6d553a946cdaa15b3adaff86f8f2eb80) #7
  unreachable

bb13:                                             ; preds = %bb7
  store i32 %_24.0, ptr %_0.i, align 4
  %_30 = load i32, ptr %block_dim, align 4
  %6 = getelementptr inbounds i8, ptr %block_dim, i32 4
  %_31 = load i32, ptr %6, align 4
  %7 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_30, i32 %_31)
  %_32.0 = extractvalue { i32, i1 } %7, 0
  %_32.1 = extractvalue { i32, i1 } %7, 1
  br i1 %_32.1, label %panic6, label %bb9

panic5:                                           ; preds = %bb7
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_37, ptr align 4 @alloc_8881fa30d080ae854e1afa24426a72cc) #7
  unreachable

bb9:                                              ; preds = %bb13
  %8 = getelementptr inbounds i8, ptr %block_dim, i32 8
  %_33 = load i32, ptr %8, align 4
  %9 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_32.0, i32 %_33)
  %_34.0 = extractvalue { i32, i1 } %9, 0
  %_34.1 = extractvalue { i32, i1 } %9, 1
  br i1 %_34.1, label %panic7, label %bb10

panic6:                                           ; preds = %bb13
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_da728090e115b6bc7c09d03c75b35fda) #7
  unreachable

bb10:                                             ; preds = %bb9
  %10 = load i32, ptr %i, align 4
  %11 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %10, i32 %_34.0)
  %_35.0 = extractvalue { i32, i1 } %11, 0
  %_35.1 = extractvalue { i32, i1 } %11, 1
  br i1 %_35.1, label %panic8, label %bb11

panic7:                                           ; preds = %bb9
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_e56edd30e8574d0563525398cba5f56f) #7
  unreachable

bb11:                                             ; preds = %bb10
  store i32 %_35.0, ptr %i, align 4
  br label %bb3

panic8:                                           ; preds = %bb10
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_57e7f310305477def3a06ab7103b4ad3) #7
  unreachable
}

; Function Attrs: nounwind
define dso_local void @vector_scale_kernel(%ThreadIdx %0, %BlockIdx %1, %BlockDim %2, ptr %a, i32 %scale, ptr %c, i32 %n) unnamed_addr #1 {
start:
  %block_dim = alloca [12 x i8], align 4
  %block_idx = alloca [12 x i8], align 4
  %thread_idx = alloca [12 x i8], align 4
  store %ThreadIdx %0, ptr %thread_idx, align 4
  store %BlockIdx %1, ptr %block_idx, align 4
  store %BlockDim %2, ptr %block_dim, align 4
  %_11 = load i32, ptr %block_idx, align 4
  %_12 = load i32, ptr %block_dim, align 4
  %3 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_11, i32 %_12)
  %_13.0 = extractvalue { i32, i1 } %3, 0
  %_13.1 = extractvalue { i32, i1 } %3, 1
  br i1 %_13.1, label %panic, label %bb1

bb1:                                              ; preds = %start
  %_14 = load i32, ptr %thread_idx, align 4
  %4 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_13.0, i32 %_14)
  %_15.0 = extractvalue { i32, i1 } %4, 0
  %_15.1 = extractvalue { i32, i1 } %4, 1
  br i1 %_15.1, label %panic1, label %bb2

panic:                                            ; preds = %start
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_9d24817f5a3b39519d83af2fd8a20c28) #7
  unreachable

bb2:                                              ; preds = %bb1
  %_16 = icmp ult i32 %_15.0, %n
  br i1 %_16, label %bb3, label %bb7

panic1:                                           ; preds = %bb1
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_d7ce86918d304f92dec812763db77522) #7
  unreachable

bb7:                                              ; preds = %bb8, %bb2
  ret void

bb3:                                              ; preds = %bb2
  %_0.i5 = getelementptr inbounds i32, ptr %a, i32 %_15.0
  %_28 = ptrtoint ptr %_0.i5 to i32
  %_31 = and i32 %_28, 3
  %_32 = icmp eq i32 %_31, 0
  br i1 %_32, label %bb9, label %panic2

bb9:                                              ; preds = %bb3
  %_17 = load i32, ptr %_0.i5, align 4
  %5 = call { i32, i1 } @llvm.smul.with.overflow.i32(i32 %_17, i32 %scale)
  %_19.0 = extractvalue { i32, i1 } %5, 0
  %_19.1 = extractvalue { i32, i1 } %5, 1
  br i1 %_19.1, label %panic3, label %bb5

panic2:                                           ; preds = %bb3
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_28, ptr align 4 @alloc_01a19de0f6bbb275f64a884ce94ee59f) #7
  unreachable

bb5:                                              ; preds = %bb9
  %_0.i = getelementptr inbounds i32, ptr %c, i32 %_15.0
  %_22 = ptrtoint ptr %_0.i to i32
  %_25 = and i32 %_22, 3
  %_26 = icmp eq i32 %_25, 0
  br i1 %_26, label %bb8, label %panic4

panic3:                                           ; preds = %bb9
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_01a19de0f6bbb275f64a884ce94ee59f) #7
  unreachable

bb8:                                              ; preds = %bb5
  store i32 %_19.0, ptr %_0.i, align 4
  br label %bb7

panic4:                                           ; preds = %bb5
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_22, ptr align 4 @alloc_da61175e9c3b1dd68817350003802f26) #7
  unreachable
}

; Function Attrs: nounwind
define dso_local void @matrix_mul_kernel(%ThreadIdx %0, %BlockIdx %1, %BlockDim %2, ptr %a, ptr %b, ptr %c, i32 %m, i32 %n, i32 %p) unnamed_addr #1 {
start:
  %_32 = alloca [8 x i8], align 4
  %iter = alloca [8 x i8], align 4
  %sum = alloca [4 x i8], align 4
  %block_dim = alloca [12 x i8], align 4
  %block_idx = alloca [12 x i8], align 4
  %thread_idx = alloca [12 x i8], align 4
  store %ThreadIdx %0, ptr %thread_idx, align 4
  store %BlockIdx %1, ptr %block_idx, align 4
  store %BlockDim %2, ptr %block_dim, align 4
  %3 = getelementptr inbounds i8, ptr %block_idx, i32 4
  %_13 = load i32, ptr %3, align 4
  %4 = getelementptr inbounds i8, ptr %block_dim, i32 4
  %_14 = load i32, ptr %4, align 4
  %5 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_13, i32 %_14)
  %_15.0 = extractvalue { i32, i1 } %5, 0
  %_15.1 = extractvalue { i32, i1 } %5, 1
  br i1 %_15.1, label %panic, label %bb1

bb1:                                              ; preds = %start
  %6 = getelementptr inbounds i8, ptr %thread_idx, i32 4
  %_16 = load i32, ptr %6, align 4
  %7 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_15.0, i32 %_16)
  %_17.0 = extractvalue { i32, i1 } %7, 0
  %_17.1 = extractvalue { i32, i1 } %7, 1
  br i1 %_17.1, label %panic1, label %bb2

panic:                                            ; preds = %start
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_ceb82e5a47c5715cba27fcf7c0b5866f) #7
  unreachable

bb2:                                              ; preds = %bb1
  %_21 = load i32, ptr %block_idx, align 4
  %_22 = load i32, ptr %block_dim, align 4
  %8 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_21, i32 %_22)
  %_23.0 = extractvalue { i32, i1 } %8, 0
  %_23.1 = extractvalue { i32, i1 } %8, 1
  br i1 %_23.1, label %panic2, label %bb3

panic1:                                           ; preds = %bb1
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_f18398194fc0b3a1fcd7c65334321db0) #7
  unreachable

bb3:                                              ; preds = %bb2
  %_24 = load i32, ptr %thread_idx, align 4
  %9 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_23.0, i32 %_24)
  %_25.0 = extractvalue { i32, i1 } %9, 0
  %_25.1 = extractvalue { i32, i1 } %9, 1
  br i1 %_25.1, label %panic3, label %bb4

panic2:                                           ; preds = %bb2
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_5f098b4704ded2783121a055ab259dab) #7
  unreachable

bb4:                                              ; preds = %bb3
  %_26 = icmp ult i32 %_17.0, %m
  br i1 %_26, label %bb5, label %bb24

panic3:                                           ; preds = %bb3
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_2e761d469539f4f8386a58bb72750f31) #7
  unreachable

bb24:                                             ; preds = %bb25, %bb5, %bb4
  ret void

bb5:                                              ; preds = %bb4
  %_27 = icmp ult i32 %_25.0, %p
  br i1 %_27, label %bb6, label %bb24

bb6:                                              ; preds = %bb5
  store i32 0, ptr %sum, align 4
; call <I as core::iter::traits::collect::IntoIterator>::into_iter
  %10 = call { i32, i32 } @"_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17ha28445c3727553ffE"(i32 0, i32 %n) #6
  %_29.0 = extractvalue { i32, i32 } %10, 0
  %_29.1 = extractvalue { i32, i32 } %10, 1
  store i32 %_29.0, ptr %iter, align 4
  %11 = getelementptr inbounds i8, ptr %iter, i32 4
  store i32 %_29.1, ptr %11, align 4
  br label %bb8

bb8:                                              ; preds = %bb20, %bb6
; call core::iter::range::<impl core::iter::traits::iterator::Iterator for core::ops::range::Range<A>>::next
  %12 = call { i32, i32 } @"_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hce2dd5e42e891459E"(ptr align 4 %iter) #6
  %13 = extractvalue { i32, i32 } %12, 0
  %14 = extractvalue { i32, i32 } %12, 1
  store i32 %13, ptr %_32, align 4
  %15 = getelementptr inbounds i8, ptr %_32, i32 4
  store i32 %14, ptr %15, align 4
  %_34 = load i32, ptr %_32, align 4
  %16 = icmp eq i32 %_34, 0
  br i1 %16, label %bb12, label %bb11

bb12:                                             ; preds = %bb8
  %17 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_17.0, i32 %p)
  %_53.0 = extractvalue { i32, i1 } %17, 0
  %_53.1 = extractvalue { i32, i1 } %17, 1
  br i1 %_53.1, label %panic4, label %bb21

bb11:                                             ; preds = %bb8
  %18 = getelementptr inbounds i8, ptr %_32, i32 4
  %k = load i32, ptr %18, align 4
  %19 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_17.0, i32 %n)
  %_38.0 = extractvalue { i32, i1 } %19, 0
  %_38.1 = extractvalue { i32, i1 } %19, 1
  br i1 %_38.1, label %panic7, label %bb13

bb21:                                             ; preds = %bb12
  %20 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_53.0, i32 %_25.0)
  %_54.0 = extractvalue { i32, i1 } %20, 0
  %_54.1 = extractvalue { i32, i1 } %20, 1
  br i1 %_54.1, label %panic5, label %bb22

panic4:                                           ; preds = %bb12
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_996c47994551f36383d683e76f157529) #7
  unreachable

bb22:                                             ; preds = %bb21
  %_55 = load i32, ptr %sum, align 4
  %_0.i = getelementptr inbounds i32, ptr %c, i32 %_54.0
  %_58 = ptrtoint ptr %_0.i to i32
  %_61 = and i32 %_58, 3
  %_62 = icmp eq i32 %_61, 0
  br i1 %_62, label %bb25, label %panic6

panic5:                                           ; preds = %bb21
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_996c47994551f36383d683e76f157529) #7
  unreachable

bb25:                                             ; preds = %bb22
  store i32 %_55, ptr %_0.i, align 4
  br label %bb24

panic6:                                           ; preds = %bb22
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_58, ptr align 4 @alloc_ff7d22422cb0cf14880ce160e43dc087) #7
  unreachable

bb13:                                             ; preds = %bb11
  %21 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_38.0, i32 %k)
  %_39.0 = extractvalue { i32, i1 } %21, 0
  %_39.1 = extractvalue { i32, i1 } %21, 1
  br i1 %_39.1, label %panic8, label %bb14

panic7:                                           ; preds = %bb11
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_b650210c97ea5deb8e7ad4daaf9a43d3) #7
  unreachable

bb14:                                             ; preds = %bb13
  %22 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %k, i32 %p)
  %_42.0 = extractvalue { i32, i1 } %22, 0
  %_42.1 = extractvalue { i32, i1 } %22, 1
  br i1 %_42.1, label %panic9, label %bb15

panic8:                                           ; preds = %bb13
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_b650210c97ea5deb8e7ad4daaf9a43d3) #7
  unreachable

bb15:                                             ; preds = %bb14
  %23 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_42.0, i32 %_25.0)
  %_43.0 = extractvalue { i32, i1 } %23, 0
  %_43.1 = extractvalue { i32, i1 } %23, 1
  br i1 %_43.1, label %panic10, label %bb16

panic9:                                           ; preds = %bb14
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_f50345d98df1c590a94332c63192a250) #7
  unreachable

bb16:                                             ; preds = %bb15
  %_0.i16 = getelementptr inbounds i32, ptr %a, i32 %_39.0
  %_70 = ptrtoint ptr %_0.i16 to i32
  %_73 = and i32 %_70, 3
  %_74 = icmp eq i32 %_73, 0
  br i1 %_74, label %bb27, label %panic11

panic10:                                          ; preds = %bb15
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_f50345d98df1c590a94332c63192a250) #7
  unreachable

bb27:                                             ; preds = %bb16
  %_45 = load i32, ptr %_0.i16, align 4
  %_0.i15 = getelementptr inbounds i32, ptr %b, i32 %_43.0
  %_64 = ptrtoint ptr %_0.i15 to i32
  %_67 = and i32 %_64, 3
  %_68 = icmp eq i32 %_67, 0
  br i1 %_68, label %bb26, label %panic12

panic11:                                          ; preds = %bb16
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_70, ptr align 4 @alloc_102c74d37a1b38a64459e479866b5247) #7
  unreachable

bb26:                                             ; preds = %bb27
  %_47 = load i32, ptr %_0.i15, align 4
  %24 = call { i32, i1 } @llvm.smul.with.overflow.i32(i32 %_45, i32 %_47)
  %_49.0 = extractvalue { i32, i1 } %24, 0
  %_49.1 = extractvalue { i32, i1 } %24, 1
  br i1 %_49.1, label %panic13, label %bb19

panic12:                                          ; preds = %bb27
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_64, ptr align 4 @alloc_f42be0c73fdac7af778010681c188cfc) #7
  unreachable

bb19:                                             ; preds = %bb26
  %25 = load i32, ptr %sum, align 4
  %26 = call { i32, i1 } @llvm.sadd.with.overflow.i32(i32 %25, i32 %_49.0)
  %_50.0 = extractvalue { i32, i1 } %26, 0
  %_50.1 = extractvalue { i32, i1 } %26, 1
  br i1 %_50.1, label %panic14, label %bb20

panic13:                                          ; preds = %bb26
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_102c74d37a1b38a64459e479866b5247) #7
  unreachable

bb20:                                             ; preds = %bb19
  store i32 %_50.0, ptr %sum, align 4
  br label %bb8

panic14:                                          ; preds = %bb19
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_0d5e23dfa48c7cd056050e3b79f7a92b) #7
  unreachable

bb10:                                             ; No predecessors!
  unreachable
}

; Function Attrs: nounwind
define dso_local void @matrix_transpose_kernel(%ThreadIdx %0, %BlockIdx %1, %BlockDim %2, ptr %input, ptr %output, i32 %rows, i32 %cols) unnamed_addr #1 {
start:
  %block_dim = alloca [12 x i8], align 4
  %block_idx = alloca [12 x i8], align 4
  %thread_idx = alloca [12 x i8], align 4
  store %ThreadIdx %0, ptr %thread_idx, align 4
  store %BlockIdx %1, ptr %block_idx, align 4
  store %BlockDim %2, ptr %block_dim, align 4
  %3 = getelementptr inbounds i8, ptr %block_idx, i32 4
  %_11 = load i32, ptr %3, align 4
  %4 = getelementptr inbounds i8, ptr %block_dim, i32 4
  %_12 = load i32, ptr %4, align 4
  %5 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_11, i32 %_12)
  %_13.0 = extractvalue { i32, i1 } %5, 0
  %_13.1 = extractvalue { i32, i1 } %5, 1
  br i1 %_13.1, label %panic, label %bb1

bb1:                                              ; preds = %start
  %6 = getelementptr inbounds i8, ptr %thread_idx, i32 4
  %_14 = load i32, ptr %6, align 4
  %7 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_13.0, i32 %_14)
  %_15.0 = extractvalue { i32, i1 } %7, 0
  %_15.1 = extractvalue { i32, i1 } %7, 1
  br i1 %_15.1, label %panic1, label %bb2

panic:                                            ; preds = %start
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_90ee939770c9274936c9304ad670f762) #7
  unreachable

bb2:                                              ; preds = %bb1
  %_19 = load i32, ptr %block_idx, align 4
  %_20 = load i32, ptr %block_dim, align 4
  %8 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_19, i32 %_20)
  %_21.0 = extractvalue { i32, i1 } %8, 0
  %_21.1 = extractvalue { i32, i1 } %8, 1
  br i1 %_21.1, label %panic2, label %bb3

panic1:                                           ; preds = %bb1
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_14653ceb87d7a6d0a874b58729abe30c) #7
  unreachable

bb3:                                              ; preds = %bb2
  %_22 = load i32, ptr %thread_idx, align 4
  %9 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_21.0, i32 %_22)
  %_23.0 = extractvalue { i32, i1 } %9, 0
  %_23.1 = extractvalue { i32, i1 } %9, 1
  br i1 %_23.1, label %panic3, label %bb4

panic2:                                           ; preds = %bb2
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_fe6f0aa3d92ce491c83d8757dc7388da) #7
  unreachable

bb4:                                              ; preds = %bb3
  %_24 = icmp ult i32 %_15.0, %rows
  br i1 %_24, label %bb5, label %bb13

panic3:                                           ; preds = %bb3
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_fb209e4ff747acd5e1e28f13041a0697) #7
  unreachable

bb13:                                             ; preds = %bb14, %bb5, %bb4
  ret void

bb5:                                              ; preds = %bb4
  %_25 = icmp ult i32 %_23.0, %cols
  br i1 %_25, label %bb6, label %bb13

bb6:                                              ; preds = %bb5
  %10 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_15.0, i32 %cols)
  %_28.0 = extractvalue { i32, i1 } %10, 0
  %_28.1 = extractvalue { i32, i1 } %10, 1
  br i1 %_28.1, label %panic4, label %bb7

bb7:                                              ; preds = %bb6
  %11 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_28.0, i32 %_23.0)
  %_29.0 = extractvalue { i32, i1 } %11, 0
  %_29.1 = extractvalue { i32, i1 } %11, 1
  br i1 %_29.1, label %panic5, label %bb8

panic4:                                           ; preds = %bb6
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_c2e7c08e18c55866b650a4c593470ecb) #7
  unreachable

bb8:                                              ; preds = %bb7
  %12 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_23.0, i32 %rows)
  %_32.0 = extractvalue { i32, i1 } %12, 0
  %_32.1 = extractvalue { i32, i1 } %12, 1
  br i1 %_32.1, label %panic6, label %bb9

panic5:                                           ; preds = %bb7
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_c2e7c08e18c55866b650a4c593470ecb) #7
  unreachable

bb9:                                              ; preds = %bb8
  %13 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_32.0, i32 %_15.0)
  %_33.0 = extractvalue { i32, i1 } %13, 0
  %_33.1 = extractvalue { i32, i1 } %13, 1
  br i1 %_33.1, label %panic7, label %bb10

panic6:                                           ; preds = %bb8
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_acd97dd57980d75f9b233496ea8fad46) #7
  unreachable

bb10:                                             ; preds = %bb9
  %_0.i10 = getelementptr inbounds i32, ptr %input, i32 %_29.0
  %_44 = ptrtoint ptr %_0.i10 to i32
  %_47 = and i32 %_44, 3
  %_48 = icmp eq i32 %_47, 0
  br i1 %_48, label %bb15, label %panic8

panic7:                                           ; preds = %bb9
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_acd97dd57980d75f9b233496ea8fad46) #7
  unreachable

bb15:                                             ; preds = %bb10
  %_34 = load i32, ptr %_0.i10, align 4
  %_0.i = getelementptr inbounds i32, ptr %output, i32 %_33.0
  %_38 = ptrtoint ptr %_0.i to i32
  %_41 = and i32 %_38, 3
  %_42 = icmp eq i32 %_41, 0
  br i1 %_42, label %bb14, label %panic9

panic8:                                           ; preds = %bb10
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_44, ptr align 4 @alloc_97ac010c69806fc7389169324aae9f8b) #7
  unreachable

bb14:                                             ; preds = %bb15
  store i32 %_34, ptr %_0.i, align 4
  br label %bb13

panic9:                                           ; preds = %bb15
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_38, ptr align 4 @alloc_14bb6428041e6f1bd4b26a1cf7fa4bc8) #7
  unreachable
}

; Function Attrs: nounwind
define dso_local void @dot_product_kernel(%ThreadIdx %0, %BlockIdx %1, %BlockDim %2, ptr %a, ptr %b, ptr %c, i32 %n) unnamed_addr #1 {
start:
  %sum = alloca [4 x i8], align 4
  %block_dim = alloca [12 x i8], align 4
  %block_idx = alloca [12 x i8], align 4
  %thread_idx = alloca [12 x i8], align 4
  store %ThreadIdx %0, ptr %thread_idx, align 4
  store %BlockIdx %1, ptr %block_idx, align 4
  store %BlockDim %2, ptr %block_dim, align 4
  %_11 = load i32, ptr %block_idx, align 4
  %_12 = load i32, ptr %block_dim, align 4
  %3 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_11, i32 %_12)
  %_13.0 = extractvalue { i32, i1 } %3, 0
  %_13.1 = extractvalue { i32, i1 } %3, 1
  br i1 %_13.1, label %panic, label %bb1

bb1:                                              ; preds = %start
  %_14 = load i32, ptr %thread_idx, align 4
  %4 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_13.0, i32 %_14)
  %_15.0 = extractvalue { i32, i1 } %4, 0
  %_15.1 = extractvalue { i32, i1 } %4, 1
  br i1 %_15.1, label %panic1, label %bb2

panic:                                            ; preds = %start
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_1086ad80c96435981262190db8afed0f) #7
  unreachable

bb2:                                              ; preds = %bb1
  %_16 = icmp ult i32 %_15.0, %n
  br i1 %_16, label %bb3, label %bb8

panic1:                                           ; preds = %bb1
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_4cb37460ed473180a0e65f2ec010965f) #7
  unreachable

bb8:                                              ; preds = %bb9, %bb2
  ret void

bb3:                                              ; preds = %bb2
  store i32 0, ptr %sum, align 4
  %_0.i7 = getelementptr inbounds i32, ptr %a, i32 %_15.0
  %_38 = ptrtoint ptr %_0.i7 to i32
  %_41 = and i32 %_38, 3
  %_42 = icmp eq i32 %_41, 0
  br i1 %_42, label %bb11, label %panic2

bb11:                                             ; preds = %bb3
  %_18 = load i32, ptr %_0.i7, align 4
  %_0.i6 = getelementptr inbounds i32, ptr %b, i32 %_15.0
  %_32 = ptrtoint ptr %_0.i6 to i32
  %_35 = and i32 %_32, 3
  %_36 = icmp eq i32 %_35, 0
  br i1 %_36, label %bb10, label %panic3

panic2:                                           ; preds = %bb3
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_38, ptr align 4 @alloc_c9dccff83bfba1c1e98dcdc1e599be55) #7
  unreachable

bb10:                                             ; preds = %bb11
  %_20 = load i32, ptr %_0.i6, align 4
  %5 = call { i32, i1 } @llvm.smul.with.overflow.i32(i32 %_18, i32 %_20)
  %_22.0 = extractvalue { i32, i1 } %5, 0
  %_22.1 = extractvalue { i32, i1 } %5, 1
  br i1 %_22.1, label %panic4, label %bb6

panic3:                                           ; preds = %bb11
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_32, ptr align 4 @alloc_b03bf4639511c6cb5840a6e7dd1a4bdf) #7
  unreachable

bb6:                                              ; preds = %bb10
  store i32 %_22.0, ptr %sum, align 4
  %_23 = load i32, ptr %sum, align 4
  %_0.i = getelementptr inbounds i32, ptr %c, i32 %_15.0
  %_26 = ptrtoint ptr %_0.i to i32
  %_29 = and i32 %_26, 3
  %_30 = icmp eq i32 %_29, 0
  br i1 %_30, label %bb9, label %panic5

panic4:                                           ; preds = %bb10
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_c9dccff83bfba1c1e98dcdc1e599be55) #7
  unreachable

bb9:                                              ; preds = %bb6
  store i32 %_23, ptr %_0.i, align 4
  br label %bb8

panic5:                                           ; preds = %bb6
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_26, ptr align 4 @alloc_ce8f02ae43158c6f1ade3ef3a1b0a5b2) #7
  unreachable
}

; Function Attrs: nounwind
define dso_local void @relu_kernel(%ThreadIdx %0, %BlockIdx %1, %BlockDim %2, ptr %input, ptr %output, i32 %n) unnamed_addr #1 {
start:
  %_18 = alloca [4 x i8], align 4
  %block_dim = alloca [12 x i8], align 4
  %block_idx = alloca [12 x i8], align 4
  %thread_idx = alloca [12 x i8], align 4
  store %ThreadIdx %0, ptr %thread_idx, align 4
  store %BlockIdx %1, ptr %block_idx, align 4
  store %BlockDim %2, ptr %block_dim, align 4
  %_10 = load i32, ptr %block_idx, align 4
  %_11 = load i32, ptr %block_dim, align 4
  %3 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_10, i32 %_11)
  %_12.0 = extractvalue { i32, i1 } %3, 0
  %_12.1 = extractvalue { i32, i1 } %3, 1
  br i1 %_12.1, label %panic, label %bb1

bb1:                                              ; preds = %start
  %_13 = load i32, ptr %thread_idx, align 4
  %4 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_12.0, i32 %_13)
  %_14.0 = extractvalue { i32, i1 } %4, 0
  %_14.1 = extractvalue { i32, i1 } %4, 1
  br i1 %_14.1, label %panic1, label %bb2

panic:                                            ; preds = %start
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_6dc368ac0f5129e4502095eebbff1020) #7
  unreachable

bb2:                                              ; preds = %bb1
  %_15 = icmp ult i32 %_14.0, %n
  br i1 %_15, label %bb3, label %bb9

panic1:                                           ; preds = %bb1
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_1e3d9b901e7744707a0ddbc2b9825c91) #7
  unreachable

bb9:                                              ; preds = %bb10, %bb2
  ret void

bb3:                                              ; preds = %bb2
  %_0.i4 = getelementptr inbounds float, ptr %input, i32 %_14.0
  %_28 = ptrtoint ptr %_0.i4 to i32
  %_31 = and i32 %_28, 3
  %_32 = icmp eq i32 %_31, 0
  br i1 %_32, label %bb11, label %panic2

bb11:                                             ; preds = %bb3
  %val = load float, ptr %_0.i4, align 4
  %_19 = fcmp ogt float %val, 0.000000e+00
  br i1 %_19, label %bb5, label %bb6

panic2:                                           ; preds = %bb3
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_28, ptr align 4 @alloc_6b53b56e6c46a41797419148833ff0e2) #7
  unreachable

bb6:                                              ; preds = %bb11
  store float 0.000000e+00, ptr %_18, align 4
  br label %bb7

bb5:                                              ; preds = %bb11
  store float %val, ptr %_18, align 4
  br label %bb7

bb7:                                              ; preds = %bb5, %bb6
  %_0.i = getelementptr inbounds float, ptr %output, i32 %_14.0
  %_22 = ptrtoint ptr %_0.i to i32
  %_25 = and i32 %_22, 3
  %_26 = icmp eq i32 %_25, 0
  br i1 %_26, label %bb10, label %panic3

bb10:                                             ; preds = %bb7
  %5 = load float, ptr %_18, align 4
  store float %5, ptr %_0.i, align 4
  br label %bb9

panic3:                                           ; preds = %bb7
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_22, ptr align 4 @alloc_7e4b3613342d9c1edd3a659427531162) #7
  unreachable
}

; Function Attrs: nounwind
define dso_local void @max_pooling_2d_kernel(%ThreadIdx %0, %BlockIdx %1, %BlockDim %2, ptr %input, ptr %output, i32 %input_height, i32 %input_width, i32 %pool_size, i32 %stride) unnamed_addr #1 {
start:
  %_69 = alloca [4 x i8], align 4
  %_55 = alloca [8 x i8], align 4
  %iter1 = alloca [8 x i8], align 4
  %_48 = alloca [8 x i8], align 4
  %iter = alloca [8 x i8], align 4
  %max_val = alloca [4 x i8], align 4
  %block_dim = alloca [12 x i8], align 4
  %block_idx = alloca [12 x i8], align 4
  %thread_idx = alloca [12 x i8], align 4
  store %ThreadIdx %0, ptr %thread_idx, align 4
  store %BlockIdx %1, ptr %block_idx, align 4
  store %BlockDim %2, ptr %block_dim, align 4
  %3 = getelementptr inbounds i8, ptr %block_idx, i32 4
  %_13 = load i32, ptr %3, align 4
  %4 = getelementptr inbounds i8, ptr %block_dim, i32 4
  %_14 = load i32, ptr %4, align 4
  %5 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_13, i32 %_14)
  %_15.0 = extractvalue { i32, i1 } %5, 0
  %_15.1 = extractvalue { i32, i1 } %5, 1
  br i1 %_15.1, label %panic, label %bb1

bb1:                                              ; preds = %start
  %6 = getelementptr inbounds i8, ptr %thread_idx, i32 4
  %_16 = load i32, ptr %6, align 4
  %7 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_15.0, i32 %_16)
  %_17.0 = extractvalue { i32, i1 } %7, 0
  %_17.1 = extractvalue { i32, i1 } %7, 1
  br i1 %_17.1, label %panic2, label %bb2

panic:                                            ; preds = %start
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_a2b8f2b14f52042d4256fcab92b4735c) #7
  unreachable

bb2:                                              ; preds = %bb1
  %_21 = load i32, ptr %block_idx, align 4
  %_22 = load i32, ptr %block_dim, align 4
  %8 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_21, i32 %_22)
  %_23.0 = extractvalue { i32, i1 } %8, 0
  %_23.1 = extractvalue { i32, i1 } %8, 1
  br i1 %_23.1, label %panic3, label %bb3

panic2:                                           ; preds = %bb1
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_d3fbb5e51c1c9eb78e3c08423f251200) #7
  unreachable

bb3:                                              ; preds = %bb2
  %_24 = load i32, ptr %thread_idx, align 4
  %9 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_23.0, i32 %_24)
  %_25.0 = extractvalue { i32, i1 } %9, 0
  %_25.1 = extractvalue { i32, i1 } %9, 1
  br i1 %_25.1, label %panic4, label %bb4

panic3:                                           ; preds = %bb2
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_22533ebdac495a0ac460cc6b55a42f48) #7
  unreachable

bb4:                                              ; preds = %bb3
  %_29.0 = sub i32 %input_height, %pool_size
  %_29.1 = icmp ult i32 %input_height, %pool_size
  br i1 %_29.1, label %panic5, label %bb5

panic4:                                           ; preds = %bb3
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_773da82417bf83b3f19b624e802e7f3c) #7
  unreachable

bb5:                                              ; preds = %bb4
  %_30 = icmp eq i32 %stride, 0
  br i1 %_30, label %panic6, label %bb6

panic5:                                           ; preds = %bb4
; call core::panicking::panic_const::panic_const_sub_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_sub_overflow17h4bde73793043cc8eE(ptr align 4 @alloc_911af8cc4b95266c676c93947088dd71) #7
  unreachable

bb6:                                              ; preds = %bb5
  %_27 = udiv i32 %_29.0, %stride
  %10 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_27, i32 1)
  %_31.0 = extractvalue { i32, i1 } %10, 0
  %_31.1 = extractvalue { i32, i1 } %10, 1
  br i1 %_31.1, label %panic7, label %bb7

panic6:                                           ; preds = %bb5
; call core::panicking::panic_const::panic_const_div_by_zero
  call void @_ZN4core9panicking11panic_const23panic_const_div_by_zero17hda97ea85bc24956dE(ptr align 4 @alloc_911af8cc4b95266c676c93947088dd71) #7
  unreachable

bb7:                                              ; preds = %bb6
  %_35.0 = sub i32 %input_width, %pool_size
  %_35.1 = icmp ult i32 %input_width, %pool_size
  br i1 %_35.1, label %panic8, label %bb8

panic7:                                           ; preds = %bb6
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_911af8cc4b95266c676c93947088dd71) #7
  unreachable

bb8:                                              ; preds = %bb7
  %_36 = icmp eq i32 %stride, 0
  br i1 %_36, label %panic9, label %bb9

panic8:                                           ; preds = %bb7
; call core::panicking::panic_const::panic_const_sub_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_sub_overflow17h4bde73793043cc8eE(ptr align 4 @alloc_74e44f8b9dda7b1b867c5d867e22cdf7) #7
  unreachable

bb9:                                              ; preds = %bb8
  %_33 = udiv i32 %_35.0, %stride
  %11 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_33, i32 1)
  %_37.0 = extractvalue { i32, i1 } %11, 0
  %_37.1 = extractvalue { i32, i1 } %11, 1
  br i1 %_37.1, label %panic10, label %bb10

panic9:                                           ; preds = %bb8
; call core::panicking::panic_const::panic_const_div_by_zero
  call void @_ZN4core9panicking11panic_const23panic_const_div_by_zero17hda97ea85bc24956dE(ptr align 4 @alloc_74e44f8b9dda7b1b867c5d867e22cdf7) #7
  unreachable

bb10:                                             ; preds = %bb9
  %_38 = icmp ult i32 %_17.0, %_31.0
  br i1 %_38, label %bb11, label %bb36

panic10:                                          ; preds = %bb9
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_74e44f8b9dda7b1b867c5d867e22cdf7) #7
  unreachable

bb36:                                             ; preds = %bb37, %bb11, %bb10
  ret void

bb11:                                             ; preds = %bb10
  %_39 = icmp ult i32 %_25.0, %_37.0
  br i1 %_39, label %bb12, label %bb36

bb12:                                             ; preds = %bb11
  %12 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_17.0, i32 %stride)
  %_41.0 = extractvalue { i32, i1 } %12, 0
  %_41.1 = extractvalue { i32, i1 } %12, 1
  br i1 %_41.1, label %panic11, label %bb13

bb13:                                             ; preds = %bb12
  %13 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_25.0, i32 %stride)
  %_43.0 = extractvalue { i32, i1 } %13, 0
  %_43.1 = extractvalue { i32, i1 } %13, 1
  br i1 %_43.1, label %panic12, label %bb14

panic11:                                          ; preds = %bb12
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_c26b2b4e721a6e5bb0174b15bf53c14c) #7
  unreachable

bb14:                                             ; preds = %bb13
  store float 0xFFF0000000000000, ptr %max_val, align 4
; call <I as core::iter::traits::collect::IntoIterator>::into_iter
  %14 = call { i32, i32 } @"_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17ha28445c3727553ffE"(i32 0, i32 %pool_size) #6
  %_45.0 = extractvalue { i32, i32 } %14, 0
  %_45.1 = extractvalue { i32, i32 } %14, 1
  store i32 %_45.0, ptr %iter, align 4
  %15 = getelementptr inbounds i8, ptr %iter, i32 4
  store i32 %_45.1, ptr %15, align 4
  br label %bb16

panic12:                                          ; preds = %bb13
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_cfc4913e75d26c6b4e3efc69f5c64536) #7
  unreachable

bb16:                                             ; preds = %bb22, %bb14
; call core::iter::range::<impl core::iter::traits::iterator::Iterator for core::ops::range::Range<A>>::next
  %16 = call { i32, i32 } @"_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hce2dd5e42e891459E"(ptr align 4 %iter) #6
  %17 = extractvalue { i32, i32 } %16, 0
  %18 = extractvalue { i32, i32 } %16, 1
  store i32 %17, ptr %_48, align 4
  %19 = getelementptr inbounds i8, ptr %_48, i32 4
  store i32 %18, ptr %19, align 4
  %_50 = load i32, ptr %_48, align 4
  %20 = icmp eq i32 %_50, 0
  br i1 %20, label %bb20, label %bb19

bb20:                                             ; preds = %bb16
  %21 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_17.0, i32 %_37.0)
  %_74.0 = extractvalue { i32, i1 } %21, 0
  %_74.1 = extractvalue { i32, i1 } %21, 1
  br i1 %_74.1, label %panic13, label %bb33

bb19:                                             ; preds = %bb16
  %22 = getelementptr inbounds i8, ptr %_48, i32 4
  %dy = load i32, ptr %22, align 4
; call <I as core::iter::traits::collect::IntoIterator>::into_iter
  %23 = call { i32, i32 } @"_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17ha28445c3727553ffE"(i32 0, i32 %pool_size) #6
  %_52.0 = extractvalue { i32, i32 } %23, 0
  %_52.1 = extractvalue { i32, i32 } %23, 1
  store i32 %_52.0, ptr %iter1, align 4
  %24 = getelementptr inbounds i8, ptr %iter1, i32 4
  store i32 %_52.1, ptr %24, align 4
  br label %bb22

bb33:                                             ; preds = %bb20
  %25 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_74.0, i32 %_25.0)
  %_75.0 = extractvalue { i32, i1 } %25, 0
  %_75.1 = extractvalue { i32, i1 } %25, 1
  br i1 %_75.1, label %panic14, label %bb34

panic13:                                          ; preds = %bb20
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_19b02c5569accd812868bdca16e2aa65) #7
  unreachable

bb34:                                             ; preds = %bb33
  %_76 = load float, ptr %max_val, align 4
  %_0.i = getelementptr inbounds float, ptr %output, i32 %_75.0
  %_79 = ptrtoint ptr %_0.i to i32
  %_82 = and i32 %_79, 3
  %_83 = icmp eq i32 %_82, 0
  br i1 %_83, label %bb37, label %panic15

panic14:                                          ; preds = %bb33
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_19b02c5569accd812868bdca16e2aa65) #7
  unreachable

bb37:                                             ; preds = %bb34
  store float %_76, ptr %_0.i, align 4
  br label %bb36

panic15:                                          ; preds = %bb34
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_79, ptr align 4 @alloc_57a2ca4ae80cda11e440323e33569cf7) #7
  unreachable

bb22:                                             ; preds = %bb32, %bb19
; call core::iter::range::<impl core::iter::traits::iterator::Iterator for core::ops::range::Range<A>>::next
  %26 = call { i32, i32 } @"_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hce2dd5e42e891459E"(ptr align 4 %iter1) #6
  %27 = extractvalue { i32, i32 } %26, 0
  %28 = extractvalue { i32, i32 } %26, 1
  store i32 %27, ptr %_55, align 4
  %29 = getelementptr inbounds i8, ptr %_55, i32 4
  store i32 %28, ptr %29, align 4
  %_57 = load i32, ptr %_55, align 4
  %30 = icmp eq i32 %_57, 0
  br i1 %30, label %bb16, label %bb24

bb24:                                             ; preds = %bb22
  %31 = getelementptr inbounds i8, ptr %_55, i32 4
  %dx = load i32, ptr %31, align 4
  %32 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_41.0, i32 %dy)
  %_60.0 = extractvalue { i32, i1 } %32, 0
  %_60.1 = extractvalue { i32, i1 } %32, 1
  br i1 %_60.1, label %panic16, label %bb25

bb25:                                             ; preds = %bb24
  %33 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_43.0, i32 %dx)
  %_62.0 = extractvalue { i32, i1 } %33, 0
  %_62.1 = extractvalue { i32, i1 } %33, 1
  br i1 %_62.1, label %panic17, label %bb26

panic16:                                          ; preds = %bb24
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_fa8bc99c2ebdaedb3247b56cff5110f9) #7
  unreachable

bb26:                                             ; preds = %bb25
  %34 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_60.0, i32 %input_width)
  %_65.0 = extractvalue { i32, i1 } %34, 0
  %_65.1 = extractvalue { i32, i1 } %34, 1
  br i1 %_65.1, label %panic18, label %bb27

panic17:                                          ; preds = %bb25
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_a1ebd876254b1dc432a62d35fbf04f57) #7
  unreachable

bb27:                                             ; preds = %bb26
  %35 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_65.0, i32 %_62.0)
  %_66.0 = extractvalue { i32, i1 } %35, 0
  %_66.1 = extractvalue { i32, i1 } %35, 1
  br i1 %_66.1, label %panic19, label %bb28

panic18:                                          ; preds = %bb26
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_81023a066df163d95dd148b55e223e70) #7
  unreachable

bb28:                                             ; preds = %bb27
  %_0.i21 = getelementptr inbounds float, ptr %input, i32 %_66.0
  %_85 = ptrtoint ptr %_0.i21 to i32
  %_88 = and i32 %_85, 3
  %_89 = icmp eq i32 %_88, 0
  br i1 %_89, label %bb38, label %panic20

panic19:                                          ; preds = %bb27
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_81023a066df163d95dd148b55e223e70) #7
  unreachable

bb38:                                             ; preds = %bb28
  %val = load float, ptr %_0.i21, align 4
  %_71 = load float, ptr %max_val, align 4
  %_70 = fcmp ogt float %val, %_71
  br i1 %_70, label %bb30, label %bb31

panic20:                                          ; preds = %bb28
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_85, ptr align 4 @alloc_aef100b777b16bb0855040ed08807812) #7
  unreachable

bb31:                                             ; preds = %bb38
  %36 = load float, ptr %max_val, align 4
  store float %36, ptr %_69, align 4
  br label %bb32

bb30:                                             ; preds = %bb38
  store float %val, ptr %_69, align 4
  br label %bb32

bb32:                                             ; preds = %bb30, %bb31
  %37 = load float, ptr %_69, align 4
  store float %37, ptr %max_val, align 4
  br label %bb22

bb18:                                             ; No predecessors!
  unreachable
}

; lib::exp_approx
; Function Attrs: nounwind
define internal float @_ZN3lib10exp_approx17hb8dbe18997443fb6E(float %x) unnamed_addr #1 {
start:
  %x1 = alloca [4 x i8], align 4
  %_3 = fcmp ogt float %x, 8.800000e+01
  br i1 %_3, label %bb1, label %bb2

bb2:                                              ; preds = %start
  %_4 = fcmp olt float %x, -8.800000e+01
  br i1 %_4, label %bb3, label %bb4

bb1:                                              ; preds = %start
  store float 8.800000e+01, ptr %x1, align 4
  br label %bb5

bb4:                                              ; preds = %bb2
  store float %x, ptr %x1, align 4
  br label %bb5

bb3:                                              ; preds = %bb2
  store float -8.800000e+01, ptr %x1, align 4
  br label %bb5

bb5:                                              ; preds = %bb1, %bb3, %bb4
  %_6 = load float, ptr %x1, align 4
  %_10 = load float, ptr %x1, align 4
  %_9 = fmul float %_10, 5.000000e-01
  %_14 = load float, ptr %x1, align 4
  %_13 = fmul float %_14, 0x3FC5557140000000
  %_17 = load float, ptr %x1, align 4
  %_16 = fmul float %_17, 0x3FA5556080000000
  %_15 = fadd float 1.000000e+00, %_16
  %_12 = fmul float %_13, %_15
  %_11 = fadd float 1.000000e+00, %_12
  %_8 = fmul float %_9, %_11
  %_7 = fadd float 1.000000e+00, %_8
  %_5 = fmul float %_6, %_7
  %y = fadd float 1.000000e+00, %_5
  ret float %y
}

; Function Attrs: nounwind
define dso_local void @softmax_kernel(%ThreadIdx %0, %BlockIdx %1, %BlockDim %2, ptr %input, ptr %output, i32 %n_rows, i32 %n_cols) unnamed_addr #1 {
start:
  %_55 = alloca [8 x i8], align 4
  %iter2 = alloca [8 x i8], align 4
  %_38 = alloca [8 x i8], align 4
  %iter1 = alloca [8 x i8], align 4
  %sum = alloca [4 x i8], align 4
  %_31 = alloca [4 x i8], align 4
  %_21 = alloca [8 x i8], align 4
  %iter = alloca [8 x i8], align 4
  %row_max = alloca [4 x i8], align 4
  %block_dim = alloca [12 x i8], align 4
  %block_idx = alloca [12 x i8], align 4
  %thread_idx = alloca [12 x i8], align 4
  store %ThreadIdx %0, ptr %thread_idx, align 4
  store %BlockIdx %1, ptr %block_idx, align 4
  store %BlockDim %2, ptr %block_dim, align 4
  %3 = getelementptr inbounds i8, ptr %block_idx, i32 4
  %_11 = load i32, ptr %3, align 4
  %4 = getelementptr inbounds i8, ptr %block_dim, i32 4
  %_12 = load i32, ptr %4, align 4
  %5 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_11, i32 %_12)
  %_13.0 = extractvalue { i32, i1 } %5, 0
  %_13.1 = extractvalue { i32, i1 } %5, 1
  br i1 %_13.1, label %panic, label %bb1

bb1:                                              ; preds = %start
  %6 = getelementptr inbounds i8, ptr %thread_idx, i32 4
  %_14 = load i32, ptr %6, align 4
  %7 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_13.0, i32 %_14)
  %_15.0 = extractvalue { i32, i1 } %7, 0
  %_15.1 = extractvalue { i32, i1 } %7, 1
  br i1 %_15.1, label %panic3, label %bb2

panic:                                            ; preds = %start
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_29ebdeeddedb0447ff5237604efe725c) #7
  unreachable

bb2:                                              ; preds = %bb1
  %_16 = icmp ult i32 %_15.0, %n_rows
  br i1 %_16, label %bb3, label %bb34

panic3:                                           ; preds = %bb1
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_251daf577e40a1183a37245c19bde16a) #7
  unreachable

bb34:                                             ; preds = %bb27, %bb2
  ret void

bb3:                                              ; preds = %bb2
  store float 0xFFF0000000000000, ptr %row_max, align 4
; call <I as core::iter::traits::collect::IntoIterator>::into_iter
  %8 = call { i32, i32 } @"_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17ha28445c3727553ffE"(i32 0, i32 %n_cols) #6
  %_18.0 = extractvalue { i32, i32 } %8, 0
  %_18.1 = extractvalue { i32, i32 } %8, 1
  store i32 %_18.0, ptr %iter, align 4
  %9 = getelementptr inbounds i8, ptr %iter, i32 4
  store i32 %_18.1, ptr %9, align 4
  br label %bb5

bb5:                                              ; preds = %bb15, %bb3
; call core::iter::range::<impl core::iter::traits::iterator::Iterator for core::ops::range::Range<A>>::next
  %10 = call { i32, i32 } @"_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hce2dd5e42e891459E"(ptr align 4 %iter) #6
  %11 = extractvalue { i32, i32 } %10, 0
  %12 = extractvalue { i32, i32 } %10, 1
  store i32 %11, ptr %_21, align 4
  %13 = getelementptr inbounds i8, ptr %_21, i32 4
  store i32 %12, ptr %13, align 4
  %_23 = load i32, ptr %_21, align 4
  %14 = icmp eq i32 %_23, 0
  br i1 %14, label %bb9, label %bb8

bb9:                                              ; preds = %bb5
  store float 0.000000e+00, ptr %sum, align 4
; call <I as core::iter::traits::collect::IntoIterator>::into_iter
  %15 = call { i32, i32 } @"_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17ha28445c3727553ffE"(i32 0, i32 %n_cols) #6
  %_35.0 = extractvalue { i32, i32 } %15, 0
  %_35.1 = extractvalue { i32, i32 } %15, 1
  store i32 %_35.0, ptr %iter1, align 4
  %16 = getelementptr inbounds i8, ptr %iter1, i32 4
  store i32 %_35.1, ptr %16, align 4
  br label %bb17

bb8:                                              ; preds = %bb5
  %17 = getelementptr inbounds i8, ptr %_21, i32 4
  %col13 = load i32, ptr %17, align 4
  %18 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_15.0, i32 %n_cols)
  %_27.0 = extractvalue { i32, i1 } %18, 0
  %_27.1 = extractvalue { i32, i1 } %18, 1
  br i1 %_27.1, label %panic14, label %bb10

bb17:                                             ; preds = %bb37, %bb9
; call core::iter::range::<impl core::iter::traits::iterator::Iterator for core::ops::range::Range<A>>::next
  %19 = call { i32, i32 } @"_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hce2dd5e42e891459E"(ptr align 4 %iter1) #6
  %20 = extractvalue { i32, i32 } %19, 0
  %21 = extractvalue { i32, i32 } %19, 1
  store i32 %20, ptr %_38, align 4
  %22 = getelementptr inbounds i8, ptr %_38, i32 4
  store i32 %21, ptr %22, align 4
  %_40 = load i32, ptr %_38, align 4
  %23 = icmp eq i32 %_40, 0
  br i1 %23, label %bb20, label %bb19

bb20:                                             ; preds = %bb17
; call <I as core::iter::traits::collect::IntoIterator>::into_iter
  %24 = call { i32, i32 } @"_ZN63_$LT$I$u20$as$u20$core..iter..traits..collect..IntoIterator$GT$9into_iter17ha28445c3727553ffE"(i32 0, i32 %n_cols) #6
  %_52.0 = extractvalue { i32, i32 } %24, 0
  %_52.1 = extractvalue { i32, i32 } %24, 1
  store i32 %_52.0, ptr %iter2, align 4
  %25 = getelementptr inbounds i8, ptr %iter2, i32 4
  store i32 %_52.1, ptr %25, align 4
  br label %bb27

bb19:                                             ; preds = %bb17
  %26 = getelementptr inbounds i8, ptr %_38, i32 4
  %col8 = load i32, ptr %26, align 4
  %27 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_15.0, i32 %n_cols)
  %_44.0 = extractvalue { i32, i1 } %27, 0
  %_44.1 = extractvalue { i32, i1 } %27, 1
  br i1 %_44.1, label %panic9, label %bb21

bb27:                                             ; preds = %bb35, %bb20
; call core::iter::range::<impl core::iter::traits::iterator::Iterator for core::ops::range::Range<A>>::next
  %28 = call { i32, i32 } @"_ZN4core4iter5range101_$LT$impl$u20$core..iter..traits..iterator..Iterator$u20$for$u20$core..ops..range..Range$LT$A$GT$$GT$4next17hce2dd5e42e891459E"(ptr align 4 %iter2) #6
  %29 = extractvalue { i32, i32 } %28, 0
  %30 = extractvalue { i32, i32 } %28, 1
  store i32 %29, ptr %_55, align 4
  %31 = getelementptr inbounds i8, ptr %_55, i32 4
  store i32 %30, ptr %31, align 4
  %_57 = load i32, ptr %_55, align 4
  %32 = icmp eq i32 %_57, 0
  br i1 %32, label %bb34, label %bb29

bb29:                                             ; preds = %bb27
  %33 = getelementptr inbounds i8, ptr %_55, i32 4
  %col = load i32, ptr %33, align 4
  %34 = call { i32, i1 } @llvm.umul.with.overflow.i32(i32 %_15.0, i32 %n_cols)
  %_61.0 = extractvalue { i32, i1 } %34, 0
  %_61.1 = extractvalue { i32, i1 } %34, 1
  br i1 %_61.1, label %panic4, label %bb30

bb30:                                             ; preds = %bb29
  %35 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_61.0, i32 %col)
  %_62.0 = extractvalue { i32, i1 } %35, 0
  %_62.1 = extractvalue { i32, i1 } %35, 1
  br i1 %_62.1, label %panic5, label %bb31

panic4:                                           ; preds = %bb29
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_4465dfd240857ae22e53e89c9128be10) #7
  unreachable

bb31:                                             ; preds = %bb30
  %_0.i19 = getelementptr inbounds float, ptr %output, i32 %_62.0
  %_74 = ptrtoint ptr %_0.i19 to i32
  %_77 = and i32 %_74, 3
  %_78 = icmp eq i32 %_77, 0
  br i1 %_78, label %bb36, label %panic6

panic5:                                           ; preds = %bb30
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_4465dfd240857ae22e53e89c9128be10) #7
  unreachable

bb36:                                             ; preds = %bb31
  %_63 = load float, ptr %_0.i19, align 4
  %_65 = load float, ptr %sum, align 4
  %_0.i18 = getelementptr inbounds float, ptr %output, i32 %_62.0
  %_68 = ptrtoint ptr %_0.i18 to i32
  %_71 = and i32 %_68, 3
  %_72 = icmp eq i32 %_71, 0
  br i1 %_72, label %bb35, label %panic7

panic6:                                           ; preds = %bb31
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_74, ptr align 4 @alloc_7218e97f0d127828635e79d07730fa78) #7
  unreachable

bb35:                                             ; preds = %bb36
  %36 = fdiv float %_63, %_65
  store float %36, ptr %_0.i18, align 4
  br label %bb27

panic7:                                           ; preds = %bb36
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_68, ptr align 4 @alloc_5fe0c5950edc50faeb8a68ef3e1f53b0) #7
  unreachable

bb21:                                             ; preds = %bb19
  %37 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_44.0, i32 %col8)
  %_45.0 = extractvalue { i32, i1 } %37, 0
  %_45.1 = extractvalue { i32, i1 } %37, 1
  br i1 %_45.1, label %panic10, label %bb22

panic9:                                           ; preds = %bb19
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_073edc48a205d6c854825ca87e43d4b7) #7
  unreachable

bb22:                                             ; preds = %bb21
  %_0.i21 = getelementptr inbounds float, ptr %input, i32 %_45.0
  %_86 = ptrtoint ptr %_0.i21 to i32
  %_89 = and i32 %_86, 3
  %_90 = icmp eq i32 %_89, 0
  br i1 %_90, label %bb38, label %panic11

panic10:                                          ; preds = %bb21
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_073edc48a205d6c854825ca87e43d4b7) #7
  unreachable

bb38:                                             ; preds = %bb22
  %_48 = load float, ptr %_0.i21, align 4
  %_50 = load float, ptr %row_max, align 4
  %_47 = fsub float %_48, %_50
; call lib::exp_approx
  %val = call float @_ZN3lib10exp_approx17hb8dbe18997443fb6E(float %_47) #6
  %_0.i = getelementptr inbounds float, ptr %output, i32 %_45.0
  %_80 = ptrtoint ptr %_0.i to i32
  %_83 = and i32 %_80, 3
  %_84 = icmp eq i32 %_83, 0
  br i1 %_84, label %bb37, label %panic12

panic11:                                          ; preds = %bb22
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_86, ptr align 4 @alloc_50ff918821cbe80445b5603c2644014d) #7
  unreachable

bb37:                                             ; preds = %bb38
  store float %val, ptr %_0.i, align 4
  %38 = load float, ptr %sum, align 4
  %39 = fadd float %38, %val
  store float %39, ptr %sum, align 4
  br label %bb17

panic12:                                          ; preds = %bb38
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_80, ptr align 4 @alloc_22b2a57ed6fb3613e85596665afdc79c) #7
  unreachable

bb10:                                             ; preds = %bb8
  %40 = call { i32, i1 } @llvm.uadd.with.overflow.i32(i32 %_27.0, i32 %col13)
  %_28.0 = extractvalue { i32, i1 } %40, 0
  %_28.1 = extractvalue { i32, i1 } %40, 1
  br i1 %_28.1, label %panic15, label %bb11

panic14:                                          ; preds = %bb8
; call core::panicking::panic_const::panic_const_mul_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4 @alloc_2dc3fc36bd9bad972bacd5f99803fe25) #7
  unreachable

bb11:                                             ; preds = %bb10
  %_0.i20 = getelementptr inbounds float, ptr %input, i32 %_28.0
  %_92 = ptrtoint ptr %_0.i20 to i32
  %_95 = and i32 %_92, 3
  %_96 = icmp eq i32 %_95, 0
  br i1 %_96, label %bb39, label %panic16

panic15:                                          ; preds = %bb10
; call core::panicking::panic_const::panic_const_add_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4 @alloc_2dc3fc36bd9bad972bacd5f99803fe25) #7
  unreachable

bb39:                                             ; preds = %bb11
  %val17 = load float, ptr %_0.i20, align 4
  %_33 = load float, ptr %row_max, align 4
  %_32 = fcmp ogt float %val17, %_33
  br i1 %_32, label %bb13, label %bb14

panic16:                                          ; preds = %bb11
; call core::panicking::panic_misaligned_pointer_dereference
  call void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32 4, i32 %_92, ptr align 4 @alloc_468faf02ec7375d2a8bcef0a5fe6497c) #7
  unreachable

bb14:                                             ; preds = %bb39
  %41 = load float, ptr %row_max, align 4
  store float %41, ptr %_31, align 4
  br label %bb15

bb13:                                             ; preds = %bb39
  store float %val17, ptr %_31, align 4
  br label %bb15

bb15:                                             ; preds = %bb13, %bb14
  %42 = load float, ptr %_31, align 4
  store float %42, ptr %row_max, align 4
  br label %bb5

bb7:                                              ; No predecessors!
  unreachable
}

; Function Attrs: noreturn nounwind
define hidden void @rust_begin_unwind(ptr align 4 %_info) unnamed_addr #2 {
start:
  br label %bb1

bb1:                                              ; preds = %bb1, %start
  br label %bb1
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i32, i1 } @llvm.uadd.with.overflow.i32(i32, i32) #3

; core::panicking::panic_nounwind
; Function Attrs: cold noinline noreturn nounwind
declare dso_local void @_ZN4core9panicking14panic_nounwind17hc189c31fedd6a605E(ptr align 1, i32) unnamed_addr #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i32, i1 } @llvm.umul.with.overflow.i32(i32, i32) #3

; core::panicking::panic_const::panic_const_mul_overflow
; Function Attrs: cold noinline noreturn nounwind
declare dso_local void @_ZN4core9panicking11panic_const24panic_const_mul_overflow17he5470c8b7857356cE(ptr align 4) unnamed_addr #4

; core::panicking::panic_const::panic_const_add_overflow
; Function Attrs: cold noinline noreturn nounwind
declare dso_local void @_ZN4core9panicking11panic_const24panic_const_add_overflow17h914801bc3b672d9fE(ptr align 4) unnamed_addr #4

; core::panicking::panic_misaligned_pointer_dereference
; Function Attrs: cold minsize noinline noreturn nounwind optsize
declare dso_local void @_ZN4core9panicking36panic_misaligned_pointer_dereference17h5c6e7dba94de4e40E(i32, i32, ptr align 4) unnamed_addr #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i32, i1 } @llvm.sadd.with.overflow.i32(i32, i32) #3

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i32, i1 } @llvm.ssub.with.overflow.i32(i32, i32) #3

; core::panicking::panic_const::panic_const_sub_overflow
; Function Attrs: cold noinline noreturn nounwind
declare dso_local void @_ZN4core9panicking11panic_const24panic_const_sub_overflow17h4bde73793043cc8eE(ptr align 4) unnamed_addr #4

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare { i32, i1 } @llvm.smul.with.overflow.i32(i32, i32) #3

; core::panicking::panic_const::panic_const_div_by_zero
; Function Attrs: cold noinline noreturn nounwind
declare dso_local void @_ZN4core9panicking11panic_const23panic_const_div_by_zero17hda97ea85bc24956dE(ptr align 4) unnamed_addr #4

attributes #0 = { inlinehint nounwind "target-cpu"="generic" }
attributes #1 = { nounwind "target-cpu"="generic" }
attributes #2 = { noreturn nounwind "target-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { cold noinline noreturn nounwind "target-cpu"="generic" }
attributes #5 = { cold minsize noinline noreturn nounwind optsize "target-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"rustc version 1.85.0 (4d91de4e4 2025-02-17)"}
