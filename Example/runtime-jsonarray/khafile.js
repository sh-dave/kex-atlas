let project = new Project('runtime');
project.addAssets('../common/Assets/**'); // our png
project.addAssets('../common/Sheets/**'); // json we load at runtime

project.localLibraryPath = '../common/Libraries';
project.addSources('../..');

project.addSources('src');

resolve(project);
