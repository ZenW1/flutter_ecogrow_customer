//
// class AnimationOpenContainerWidget extends StatelessWidget {
//   const AnimationOpenContainerWidget({super.key, required this.openBuilder});
//
//   final openBuilder;
//
//   @override
//   Widget build(BuildContext context) {
//     return OpenContainer(
//       closedBuilder: (context, openContainer) {
//         return ListTile(
//           title: const Text('Container transform'),
//           subtitle: const Text('OpenContainer'),
//           onTap: openContainer,
//         );
//       },
//       openBuilder: openBuilder,
//     );
//   }
// }
