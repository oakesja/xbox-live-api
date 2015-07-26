require 'json_parser/achievements/xbox_one_achievement_json_parser'

describe XboxOneAchievementJsonParser do
  let(:subject) { XboxOneAchievementJsonParser.new }

  describe 'parse_achievements_from' do
    context 'when given a json with achievements' do
      let(:json_string) { File.read(File.expand_path('spec/fixtures/xbox_one_achievements.json')) }
      let(:achievement) do
        icon_url = 'http://images-eds.xboxlive.com/image?url=z951ykn43p4FqWbbFvR2Ec.8vbDhj8G2Xe7JngaTToAsag2aUdBB_tYRcTKfuaeBqdlGVvgIOKcRmwkfmrRzYvppDOaoY8pHMF7oec5726VV7hz547z9KJ6tEVyB_vzOaP4coqj7vtiww_HULr4SmKYqie5c8Hl0rOp4ajonyPUN.Aaza4cNZFlzexYcHmrX'
        description = 'Acquire the first ME'
        achievement = Achievement.new(name: 'Yes, I\'m ME too!',
                                      id: 1,
                                      is_unlocked: true,
                                      icon_url: icon_url,
                                      is_secret: false,
                                      unlocked_description: description,
                                      locked_description: description,
                                      value: 10)
      end
      it 'returns the parsed Achievements' do
        achievements = subject.parse_achievements_from(json_string)
        expect(achievements.size).to be 21
        expect(achievements).to include achievement
      end
    end

    context 'when given a json without achievements' do
      let(:json_string) { '{}' }
      it 'raises an error' do
        error = 'Achievement json response is missing the achievement section'
        expect { subject.parse_achievements_from(json_string) }.to raise_error error
      end
    end

    context 'when a string that is not json' do
      let(:json_string) { '' }
      it 'raises an error' do
        error = 'Achievement response is invalid'
        expect { subject.parse_achievements_from(json_string) }.to raise_error error
      end
    end
  end
end