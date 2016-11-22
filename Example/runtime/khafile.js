let project = new Project('runtime');
project.addAssets('../common/Assets/**'); // our png
project.addAssets('../common/Sheets/**'); // xml we load at runtime

project.localLibraryPath = '../common/Libraries';
project.addLibrary('haxe-format-starling');
project.addSources('../..');

project.addSources('src');

resolve(project);
