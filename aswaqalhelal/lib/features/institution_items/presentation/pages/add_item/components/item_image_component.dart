part of '../add_items_page.dart';

class _ImageComponent extends StatelessWidget {
  const _ImageComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final intl = AppLocalizations.current;
    final bloc = context.read<AddItemBloc>();
    return BlocBuilder<AddItemBloc, AddItemState>(
      buildWhen: (p, c) =>
          p.imageFile != c.imageFile || p.imageUrl != c.imageUrl,
      builder: (context, state) {
        if (state.imageFile.value != null) {
          return Stack(children: [
            Positioned.fill(
              child: Image.file(
                state.imageFile.value!,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 4,
              right: 4,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
                child: GestureDetector(
                  onTap: () {
                    bloc.add(DeleteImageFile());
                  },
                  child: const Icon(
                    Icons.close,
                    size: 18,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ]);
        } else if (state.imageFile.value == null &&
            state.imageUrl.value != null) {
          return Stack(children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: state.imageUrl.value!,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                top: 4,
                right: 4,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade200,
                  ),
                  child: GestureDetector(
                      onTap: () {
                        bloc.add(DeleteImageUrl());
                      },
                      child: const Icon(Icons.close, color: Colors.red)),
                ))
          ]);
        } else {
          return Padding(
            padding: const EdgeInsets.all(4),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                intl.tapTonselectItemImage,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
