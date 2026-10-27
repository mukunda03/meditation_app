import 'package:flutter/material.dart';

import '../../../auth/presentation/screens/login_screen.dart';
import '../../../auth/presentation/widgets/auth_scaffold.dart';
import '../../../auth/presentation/widgets/auth_styles.dart';
import '../../../auth/presentation/widgets/primary_button.dart';
import '../widgets/onboarding_illustrations.dart';

class _OnboardingPage {
  const _OnboardingPage({
    required this.title,
    required this.body,
    required this.illustration,
  });

  final String title;
  final String body;
  final Widget illustration;
}

const _pages = [
  _OnboardingPage(
    title: 'Sacred sound,\nwherever you are',
    body:
        'Guided meditations, mantras and chants by Master Choa Kok Sui, '
        'in your pocket, even offline.',
    illustration: SoundwaveIllustration(),
  ),
  _OnboardingPage(
    title: 'Build your daily\nsadhana',
    body:
        'Create playlists, set gentle reminders and watch your day '
        'streak grow.',
    illustration: PlaylistStackIllustration(),
  ),
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  int _page = 0;

  bool get _isLast => _page == _pages.length - 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _next() {
    if (_isLast) return _finish();
    _controller.nextPage(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutCubic,
    );
  }

  void _finish() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 12, 0),
              child: TextButton(
                onPressed: _finish,
                style: TextButton.styleFrom(
                  foregroundColor: AuthStyles.link,
                  textStyle: AuthStyles.linkText.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: const Text('Skip'),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: _pages.length,
              onPageChanged: (page) => setState(() => _page = page),
              itemBuilder: (context, i) => _PageContent(page: _pages[i]),
            ),
          ),
          const SizedBox(height: 20),
          _PageDots(count: _pages.length, active: _page),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
            child: PrimaryButton(
              label: _isLast ? 'Get started' : 'Next',
              onPressed: _next,
            ),
          ),
        ],
      ),
    );
  }
}

class _PageContent extends StatelessWidget {
  const _PageContent({required this.page});

  final _OnboardingPage page;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: FittedBox(fit: BoxFit.scaleDown, child: page.illustration),
            ),
          ),
          Text(
            page.title,
            textAlign: TextAlign.center,
            style: AuthStyles.display(size: 34),
          ),
          const SizedBox(height: 14),
          Text(
            page.body,
            textAlign: TextAlign.center,
            style: AuthStyles.subtitle.copyWith(fontSize: 15.5),
          ),
        ],
      ),
    );
  }
}

class _PageDots extends StatelessWidget {
  const _PageDots({required this.count, required this.active});

  final int count;
  final int active;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < count; i++)
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: i == active ? 24 : 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: i == active
                  ? AuthStyles.primary
                  : AuthStyles.indicatorIdle,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
      ],
    );
  }
}
