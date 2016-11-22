let project = new Project('compiletime');
project.addAssets('../common/Assets/**');
project.localLibraryPath = '../common/Libraries';
project.addSources('../..');
project.addSources('src');
resolve(project);
