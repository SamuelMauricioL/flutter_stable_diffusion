import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stable_diffusion/panel/presentation/bloc/panel_bloc.dart';
import 'package:formz_inputs/formz_inputs.dart';

class PanelPage extends StatefulWidget {
  const PanelPage({super.key});

  @override
  State<PanelPage> createState() => _PanelPageState();
}

class _PanelPageState extends State<PanelPage> {
  final _dreamController = TextEditingController();

  @override
  void dispose() {
    _dreamController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PanelBloc(),
      child: const PanelBody(),
    );
  }
}

class PanelBody extends StatefulWidget {
  const PanelBody({super.key});

  @override
  State<PanelBody> createState() => _PanelBodyState();
}

class _PanelBodyState extends State<PanelBody> {
  final _dreamController = TextEditingController();

  @override
  void dispose() {
    _dreamController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Panel')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: _DescriptionInput(),
              ),
              const SizedBox(height: 20),
              const _SubmitButton(),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Image.network(
                      'https://picsum.photos/250?image=9',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DescriptionInput extends StatelessWidget {
  const _DescriptionInput();

  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;
    return BlocSelector<PanelBloc, PanelState, DescriptionFormInput>(
      selector: (state) => state.description,
      builder: (context, state) {
        return TextField(
          key: const Key('PanelView_descriptionInput_textField'),
          autocorrect: false,
          onChanged: (description) {
            context.read<PanelBloc>().add(ChangeDescription(description));
          },
          decoration: InputDecoration(
            // labelText: l10n.biographyInputLabelText,
            labelText: 'Description',
            errorText: () {
              if (state.invalid) {
                if (state.error == DescriptionValidationError.empty) {
                  // return l10n.emptyBiographyInputErrorText;
                  return 'Descripci??n inv??lida';
                } else if (state.error == DescriptionValidationError.tooShort) {
                  // return l10n.longBiographyInputErrorText;
                  return 'Descripci??n muy corta';
                }
                return null;
              }
            }(),
          ),
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton();

  @override
  Widget build(BuildContext context) {
    // final l10n = context.l10n;
    return BlocBuilder<PanelBloc, PanelState>(
      builder: (context, state) {
        if (state.descriptionStatus.isInvalid ||
            state.descriptionStatus.isPure) {
          return const SizedBox.shrink();
        }

        return FloatingActionButton.extended(
          key: const Key('PanelPage_submitButton_floatingActionButton'),
          onPressed: () {
            context.read<PanelBloc>().add(const GetImage());
          },
          label: const Text('Generar Imagen'),
        );
      },
    );
  }
}
