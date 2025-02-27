import 'package:flutter/material.dart';
import 'package:opencloud/pages/project_control/add_project.dart';
import 'package:opencloud/pages/project_control/list_of_files.dart';
import 'package:opencloud/providers/openprovider.dart';
import 'package:provider/provider.dart';

class ListOfProjects extends StatelessWidget {
  const ListOfProjects({Key? key}) : super(key: key);
  static const String routeName = '/ListOfProjects';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List of Projects'),
        ),
        body: ListView.builder(
            itemCount: Provider.of<OpenDrive>(context).Projects.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(Provider.of<OpenDrive>(context)
                    .Projects[index]
                    .options
                    .projectId),
                onTap: () {
                  Navigator.of(context).pushNamed(ListOFProjectFiles.routeName,
                      arguments: Provider.of<OpenDrive>(context, listen: false)
                          .Projects[index]);
                },
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.of(context).pushNamed(AddProject.routeName);
          },
          child: const Icon(Icons.add),
        ));
  }
}
