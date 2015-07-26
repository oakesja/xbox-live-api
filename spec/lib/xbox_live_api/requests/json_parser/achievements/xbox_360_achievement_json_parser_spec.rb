require 'spec_helper'

class XboxLiveApi
  describe Xbox360AchievementJsonParser do
    let(:subject) { Xbox360AchievementJsonParser.new }

    describe 'parse_achievements_from' do
      context 'when given a json with achievements' do
        let(:json_string) { File.read(File.expand_path('spec/fixtures/xbox_360_achievements.json')) }
        let(:achievement) do
          achievement = Achievement.new(name: 'First Strike',
                                        id: 2,
                                        is_unlocked: false,
                                        icon_url: 'http://image.xboxlive.com/global/t.58410a13/ach/0/6',
                                        is_secret: false,
                                        unlocked_description: 'You got an objective before everyone else.',
                                        locked_description: 'Be the first to get an objective in game.',
                                        value: 5,
                                        time_unlocked: '2002-11-15T00:00:00.0000000Z')
        end
        it 'returns the parsed Achievements' do
          achievements = subject.parse_achievements_from(json_string)
          expect(achievements.size).to be 12
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
end