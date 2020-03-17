

mkdir ..\extjs
mkdir ..\extjs\lang
mkdir ..\extjs\res
mkdir ..\extjs\res\images
mkdir ..\extjs\res\css
mkdir ..\extjs\res\ext-theme-classic
mkdir ..\extjs\res\ext-theme-classic\images
mkdir ..\extjs\res\ext-theme-gray
mkdir ..\extjs\res\ext-theme-gray\images
mkdir ..\extjs\res\ext-theme-neptune
mkdir ..\extjs\res\ext-theme-neptune\images
mkdir ..\extjs\res\ext-theme-crisp
mkdir ..\extjs\res\ext-theme-crisp\images
mkdir ..\extjs\res\ext-theme-triton
mkdir ..\extjs\res\ext-theme-triton\images
mkdir ..\extjs\res\ext-theme-triton\fonts
mkdir ..\extjs\res\ext-theme-triton\font-ext
mkdir ..\extjs\res\ext-theme-triton\font-awesome



xcopy extjs_source_all\build\classic\theme-classic\resources\images ..\extjs\res\ext-theme-classic\images /Y /E
xcopy extjs_source_all\build\classic\theme-gray\resources\images ..\extjs\res\ext-theme-gray\images /Y /E
xcopy extjs_source_all\build\classic\theme-neptune\resources\images ..\extjs\res\ext-theme-neptune\images /Y /E
xcopy extjs_source_all\build\classic\theme-crisp\resources\images ..\extjs\res\ext-theme-crisp\images /Y /E
xcopy extjs_source_all\build\classic\theme-triton\resources\images ..\extjs\res\ext-theme-triton\images /Y /E
xcopy res\images ..\extjs\res\images /Y /E
type res\images\s.gif > ..\extjs\res\s.gif


xcopy extjs_source_all\build\classic\theme-triton\resources\fonts ..\extjs\res\ext-theme-triton\fonts /Y /E
xcopy extjs_source_all\build\classic\theme-triton\resources\font-ext ..\extjs\res\ext-theme-triton\font-ext /Y /E
xcopy extjs_source_all\build\classic\theme-triton\resources\font-awesome ..\extjs\res\ext-theme-triton\font-awesome /Y /E



type res\FineUI.css > _f
type res\PageLoading.css >> _f
type res\Grid.css >> _f
type res\Tree.css >> _f

type _f > _f2
type res\theme-classic.css >> _f2
ajaxminifier\ajaxminifier -css _f2 -o ..\extjs\res\theme-classic.css

type _f > _f2
type res\theme-gray.css >> _f2
ajaxminifier\ajaxminifier -css _f2 -o ..\extjs\res\theme-gray.css

type _f > _f2
type res\theme-neptune.css >> _f2
ajaxminifier\ajaxminifier -css _f2 -o ..\extjs\res\theme-neptune.css

type _f > _f2
type res\theme-triton.css >> _f2
ajaxminifier\ajaxminifier -css _f2 -o ..\extjs\res\theme-triton.css

type _f > _f2
type res\theme-crisp.css >> _f2
ajaxminifier\ajaxminifier -css _f2 -o ..\extjs\res\theme-crisp.css


type extjs_source_all\build\classic\theme-classic\resources\theme-classic-all_1.css > ..\extjs\res\ext-theme-classic\theme-classic-all_1.css
type extjs_source_all\build\classic\theme-classic\resources\theme-classic-all_2.css > ..\extjs\res\ext-theme-classic\theme-classic-all_2.css

type extjs_source_all\build\classic\theme-gray\resources\theme-gray-all_1.css > ..\extjs\res\ext-theme-gray\theme-gray-all_1.css
type extjs_source_all\build\classic\theme-gray\resources\theme-gray-all_2.css > ..\extjs\res\ext-theme-gray\theme-gray-all_2.css

type extjs_source_all\build\classic\theme-neptune\resources\theme-neptune-all_1.css > ..\extjs\res\ext-theme-neptune\theme-neptune-all_1.css
type extjs_source_all\build\classic\theme-neptune\resources\theme-neptune-all_2.css > ..\extjs\res\ext-theme-neptune\theme-neptune-all_2.css

type extjs_source_all\build\classic\theme-crisp\resources\theme-crisp-all_1.css > ..\extjs\res\ext-theme-crisp\theme-crisp-all_1.css
type extjs_source_all\build\classic\theme-crisp\resources\theme-crisp-all_2.css > ..\extjs\res\ext-theme-crisp\theme-crisp-all_2.css

type extjs_source_all\build\classic\theme-triton\resources\theme-triton-all_1.css > ..\extjs\res\ext-theme-triton\theme-triton-all_1.css
type extjs_source_all\build\classic\theme-triton\resources\theme-triton-all_2.css > ..\extjs\res\ext-theme-triton\theme-triton-all_2.css



type extjs_source_all\build\classic\theme-classic\theme-classic.js > ..\extjs\res\ext-theme-classic\theme-classic.js
type extjs_source_all\build\classic\theme-gray\theme-gray.js > ..\extjs\res\ext-theme-gray\theme-gray.js
type extjs_source_all\build\classic\theme-neptune\theme-neptune.js > ..\extjs\res\ext-theme-neptune\theme-neptune.js
type extjs_source_all\build\classic\theme-crisp\theme-crisp.js > ..\extjs\res\ext-theme-crisp\theme-crisp.js
type extjs_source_all\build\classic\theme-triton\theme-triton.js > ..\extjs\res\ext-theme-triton\theme-triton.js



type extjs_source_all\build\classic\locale\locale-en.js > _f
type js\lang\f-lang-en.js >> _f
ajaxminifier\ajaxminifier -js -evals:immediate  _f -o ..\extjs\lang\en.js

type extjs_source_all\build\classic\locale\locale-pt_BR.js > _f
type js\lang\f-lang-pt_BR.js >> _f
ajaxminifier\ajaxminifier -js -evals:immediate  _f -o ..\extjs\lang\pt_BR.js

type extjs_source_all\build\classic\locale\locale-tr.js > _f
type js\lang\f-lang-tr.js >> _f
ajaxminifier\ajaxminifier -js -evals:immediate  _f -o ..\extjs\lang\tr.js

type extjs_source_all\build\classic\locale\locale-zh_CN.js > _f
type js\lang\f-lang-zh_CN.js >> _f
ajaxminifier\ajaxminifier -js -evals:immediate  _f -o ..\extjs\lang\zh_CN.js

type extjs_source_all\build\classic\locale\locale-zh_TW.js > _f
type js\lang\f-lang-zh_TW.js >> _f
ajaxminifier\ajaxminifier -js -evals:immediate  _f -o ..\extjs\lang\zh_TW.js

type extjs_source_all\build\classic\locale\locale-ru.js > _f
type js\lang\f-lang-ru.js >> _f
ajaxminifier\ajaxminifier -js -evals:immediate  _f -o ..\extjs\lang\ru.js












type extjs_source_all\build\ext-all.js > ..\extjs\ext-all.js

type js\lib\json2.js > _f
type js\lib\Base64.js >> _f
type js\F\F.util.js >> _f
type js\F\F.ajax.js >> _f
type js\F\F.wnd.js >> _f
type js\F\extender.js >> _f
type js\F\F.simulateTree.js >> _f
type js\F\F.format.js >> _f
type js\ux\FormViewport.js >> _f
type js\ux\SimplePagingToolbar.js >> _f
::type js\ux\TabCloseMenu.js >> _f
type extjs_source_all\classic\classic\src\grid\plugin\RowExpander.js >> _f
type extjs_source_all\packages\ux\classic\src\RowExpander.js >> _f
type extjs_source_all\packages\ux\classic\src\TabCloseMenu.js >> _f

type _f > ..\extjs\ext-fineui.js



type version.txt > ..\extjs\version.txt

del _f /Q
del _f2 /Q


