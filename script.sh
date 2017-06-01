#!/sbin/sh


sed -i '/deep_buffer {/,/}/d' /system/etc/audio_effects.conf
sed -i '/raw {/,/}/d' /system/etc/audio_effects.conf
sed -i 's/^libraries {/libraries {\n  volume_listener {\n    path \/system\/lib\/soundfx\/libvolumelistener.so\n  }/g' /system/etc/audio_effects.conf
sed -i 's/^effects {/effects {\n  music_helper {\n    library volume_listener\n    uuid 08b8b058-0590-11e5-ac71-0025b32654a0\n  }/g' /system/etc/audio_effects.conf
sed -i 's/^effects {/effects {\n  ring_helper {\n    library volume_listener\n    uuid 0956df94-0590-11e5-bdbe-0025b32654a0\n  }/g' /system/etc/audio_effects.conf
sed -i 's/^effects {/effects {\n  alarm_helper {\n    library volume_listener\n    uuid 09f303e2-0590-11e5-8fdb-0025b32654a0\n  }/g' /system/etc/audio_effects.conf
sed -i 's/^effects {/effects {\n  voice_helper {\n    library volume_listener\n    uuid 0ace5c08-0590-11e5-ae9e-0025b32654a0\n  }/g' /system/etc/audio_effects.conf
sed -i 's/^effects {/effects {\n  notification_helper {\n    library volume_listener\n    uuid 0b776dde-0590-11e5-81ba-0025b32654a0\n  }/g' /system/etc/audio_effects.conf
echo "
output_session_processing {
    music {
        music_helper {
        }
    }
    ring {
        ring_helper {
        }
    }
    alarm {
        alarm_helper {
        }
    }
    voice_call {
        voice_helper {
        }
    }
    notification {
        notification_helper {
        }
    }
}" >> /system/etc/audio_effects.conf
fi 
done